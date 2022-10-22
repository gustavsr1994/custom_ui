import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_custom_ui/presentation/controllers/bloc/maps_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_custom_ui/presentation/shared/common/styles/colors_pallete.dart';
import 'package:flutter_custom_ui/presentation/shared/common/styles/text_style.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:shimmer/shimmer.dart';

class AbsentMapScreen extends StatefulWidget {
  const AbsentMapScreen({Key? key}) : super(key: key);

  @override
  _AbsentMapScreenState createState() => _AbsentMapScreenState();
}

class _AbsentMapScreenState extends State<AbsentMapScreen> {
  TextEditingController searchController = TextEditingController();
  late GoogleMapController _googleMapController;
  late Location _location = Location();
  FocusNode searchFocus = FocusNode();
  int _circleIdCounter = 1;
  Map<CircleId, Circle> circles = <CircleId, Circle>{};

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(-10, 100),
    zoom: 10,
  );

  var statusInitial = true;
  var colorPallete = ColorsPallete();

  void _onMapCreated(GoogleMapController _googleCntlr, LatLng currentPosition) {
    _googleMapController = _googleCntlr;
    _googleMapController.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(target: currentPosition, zoom: 16.5),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    settingMap();
  }

  @override
  void dispose() {
    MapsBloc().close();
    super.dispose();
  }

  void calculateDistance(lat1, lon1, lat2, lon2) {
    var p = 0.017453292519943295;
    var a = 0.5 -
        cos((lat2 - lat1) * p) / 2 +
        cos(lat1 * p) * cos(lat2 * p) * (1 - cos((lon2 - lon1) * p)) / 2;
    var distance = 12742 * asin(sqrt(a));
    var different = 200 - (distance * 1000);
    if (different < 0) {
      setState(() {
        statusInitial = false;
      });
    }
  }

  void settingMap() {
    _location.onLocationChanged.listen((value) {
      //if (statusInitial) {
      calculateDistance(
          -6.3025338843575085, 106.6521452416, value.latitude, value.longitude);
      context.read<MapsBloc>().add(InitialMaps(
          currentPosition: LatLng(value.latitude!, value.longitude!),
          officePosition: LatLng(-6.3025338843575085, 106.6521452416)));
      //}
    });
    _add(LatLng(-6.3025338843575085, 106.6521452416));
  }

  Future<void> _add(LatLng userLocation) async {
    Future.delayed(
      Duration(seconds: 1),
      () => setState(() {
        final int circleCount = circles.length;

        if (circleCount == 12) {
          return;
        }

        final String circleIdVal = 'circle_id_$_circleIdCounter';
        _circleIdCounter++;
        final CircleId circleId = CircleId(circleIdVal);

        final Circle circle = Circle(
            circleId: circleId,
            consumeTapEvents: true,
            strokeColor: Colors.grey,
            fillColor: Colors.transparent,
            strokeWidth: 2,
            center: userLocation,
            radius: 200,
            onTap: () {
              // _onCircleTapped(circleId);
            });

        setState(() {
          circles[circleId] = circle;
        });
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: BackButton(
            color: colorPallete.accentColor,
          ),
          title: Text(
            "Absent Maps Screen",
            style: textLargeColor(
                boldCondition: true, color: colorPallete.fontColor),
          ),
        ),
        body: Stack(
          children: [
            BlocBuilder<MapsBloc, MapsState>(
              builder: (context, state) {
                if (state is ResultMaps) {
                  return GoogleMap(
                    mapType: MapType.normal,
                    initialCameraPosition: _kGooglePlex,
                    circles: Set<Circle>.of(circles.values),
                    onMapCreated: (value) {
                      _onMapCreated(value, state.currentPosition);
                    },
                    markers: {
                      // Marker(
                      //     markerId: MarkerId("office"),
                      //     infoWindow: InfoWindow(title: state!.name),
                      //     icon: BitmapDescriptor.defaultMarkerWithHue(
                      //         BitmapDescriptor.hueMagenta),
                      //     position: state.position!),
                      Marker(
                          markerId: MarkerId("user"),
                          infoWindow: InfoWindow(title: "User Position"),
                          icon: BitmapDescriptor.defaultMarkerWithHue(
                              BitmapDescriptor.hueMagenta),
                          position: state.currentPosition)
                    },
                  );
                } else {
                  return Shimmer.fromColors(
                      child: Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        color: Colors.white,
                      ),
                      baseColor: colorPallete.mainColor,
                      highlightColor: colorPallete.accentColor);
                }
              },
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 8),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: colorPallete.mainColor),
                      onPressed: statusInitial
                          ? null
                          : () {
                              settingMap();
                            },
                      child: statusInitial
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Check In",
                                  style: TextStyle(
                                      color: colorPallete.fontColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  size: 20,
                                  color: colorPallete.fontColor,
                                )
                              ],
                            )
                          : Text(
                              "Anda diluar radius (200 m)",
                              style: TextStyle(
                                  color: colorPallete.fontColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ))),
            )
          ],
        ));
  }
}
