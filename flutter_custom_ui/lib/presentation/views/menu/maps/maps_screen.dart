import 'package:flutter/material.dart';
import 'package:flutter_custom_ui/domain/entities/place_entity.dart';
import 'package:flutter_custom_ui/presentation/controllers/map/map_controller.dart';
import 'package:flutter_custom_ui/presentation/controllers/place/place_controller.dart';
import 'package:flutter_custom_ui/presentation/shared/common/styles/colors_pallete.dart';
import 'package:flutter_custom_ui/presentation/shared/common/styles/text_style.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class MapsScreen extends StatefulWidget {
  @override
  _MapsScreenState createState() => _MapsScreenState();
}

class _MapsScreenState extends State<MapsScreen> {
  TextEditingController searchController = TextEditingController();
  late GoogleMapController _googleMapController;
  late Location _location = Location();
  FocusNode searchFocus = FocusNode();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(-10, 100),
    zoom: 10,
  );
  var statusInitial = true;
  var colorPallete = ColorsPallete();
  var mapController = Get.put(MapController());
  var placeController = Get.put(PlaceController());

  void _onMapCreated(GoogleMapController _googleCntlr, LatLng currentPosition) {
    _googleMapController = _googleCntlr;
    _googleMapController.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(target: currentPosition, zoom: 18),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _location.onLocationChanged.listen((value) {
      if (statusInitial) {
        mapController.currentLocation(PlaceModel(
            position: LatLng(value.latitude!, value.longitude!),
            name: "Current place"));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: BackButton(
            color: colorPallete.accentColor,
          ),
          title: Text(
            "Maps Screen",
            style: textLargeColor(
                boldCondition: true, color: colorPallete.fontColor),
          ),
        ),
        body: Stack(
          children: [
            mapController.obx(
              (state) => GoogleMap(
                mapType: MapType.normal,
                initialCameraPosition: _kGooglePlex,
                onMapCreated: (value) {
                  _onMapCreated(value, state!.position!);
                },
                markers: {
                  Marker(
                      markerId: MarkerId("current"),
                      infoWindow: InfoWindow(title: state!.name),
                      icon: BitmapDescriptor.defaultMarkerWithHue(
                          BitmapDescriptor.hueMagenta),
                      position: state.position!)
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 8),
              child: TextFormField(
                controller: searchController,
                keyboardType: TextInputType.text,
                focusNode: searchFocus,
                onFieldSubmitted: (value) {
                  searchFocus.unfocus();
                  placeController.getListPlace(searchController.text);
                  bottomSheetAddress();
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: colorPallete.mainColor)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: colorPallete.accentColor)),
                  labelText: 'Search by place or building',
                  labelStyle: TextStyle(
                      color: colorPallete.fontColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                  filled: true,
                  fillColor: colorPallete.whiteColor,
                  suffixIcon: IconButton(
                      icon: Icon(
                        Icons.search,
                        color: colorPallete.accentColor,
                      ),
                      onPressed: () {
                        searchFocus.unfocus();
                        placeController.getListPlace(searchController.text);
                        bottomSheetAddress();
                      }),
                ),
              ),
            )
          ],
        ));
  }

  void bottomSheetAddress() {
    showMaterialModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), topLeft: Radius.circular(20)),
        ),
        context: context,
        builder: (context) => SingleChildScrollView(
            controller: ModalScrollController.of(context),
            child: Container(
              height: (MediaQuery.of(context).size.height / 3) + 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  titleHeader(),
                  Divider(
                    height: 0,
                  ),
                  placeController.obx(
                      (state) => Container(
                            height: MediaQuery.of(context).size.height / 3,
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  for (var items in state!.collectionPlace!)
                                    InkWell(
                                      onTap: () async {
                                        LatLng current = await placeController
                                            .getDetailPlace(items.idPlace,
                                                state.collectionPlace!);
                                        _onMapCreated(
                                            _googleMapController, current);
                                        setState(() {
                                          statusInitial = false;
                                        });
                                        Navigator.of(context).pop();
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                            border: Border(
                                          bottom: BorderSide(
                                              width: 1,
                                              color: colorPallete.accentColor),
                                        )),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 25, vertical: 20),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Flexible(
                                              child: Text(
                                                items.namePlace,
                                                style: TextStyle(fontSize: 14),
                                              ),
                                            ),
                                            Icon(Icons.arrow_forward_ios)
                                          ],
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                      onEmpty: Center(
                          child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text("No Data"),
                      )),
                      onLoading: Center(
                        child: CircularProgressIndicator(),
                      ))
                ],
              ),
            )));
  }

  Widget titleHeader() {
    return Container(
      // description title
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.only(top: 25, bottom: 20),
            child: Text(
              'Pilih Alamat',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Icon(Icons.close, size: 16))
        ],
      ),
    );
  }
}
