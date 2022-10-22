import 'package:flutter/material.dart';
import 'package:flutter_custom_ui/data/models/absent/absent_model.dart';
import 'package:flutter_custom_ui/presentation/controllers/absent/absent_controller.dart';
import 'package:flutter_custom_ui/presentation/shared/common/styles/colors_pallete.dart';
import 'package:flutter_custom_ui/presentation/shared/common/styles/text_style.dart';
import 'package:flutter_custom_ui/presentation/shared/common/utils/date_formatter.dart';
import 'package:flutter_custom_ui/presentation/shared/widgets/buttons/button_with_icon.dart';
import 'package:get/get.dart';

class MainMenuScreen extends StatefulWidget {
  @override
  _MainMenuScreenState createState() => _MainMenuScreenState();
}

class _MainMenuScreenState extends State<MainMenuScreen> {
  var colorPallete = ColorsPallete();
  var absentController = Get.put(AbsentController());

  @override
  void initState() {
    super.initState();
    absentController.getAbsentToday();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Simple App',
          style: textLargeColor(
              boldCondition: true, color: colorPallete.fontColor),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              absentController.obx(
                (state) => Container(
                  width: MediaQuery.of(context).size.width / 3 * 2,
                  margin: EdgeInsets.symmetric(vertical: 8),
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: colorPallete.mainColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Check In',
                            style: textLargeColor(
                                boldCondition: true,
                                color: colorPallete.accentColor),
                          ),
                          Text('Check Out',
                              style: textLargeColor(
                                  boldCondition: true,
                                  color: colorPallete.accentColor)),
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            state!.checkIn,
                            style: textLargeColor(
                                boldCondition: false,
                                color: colorPallete.fontColor),
                          ),
                          Text(state.checkOut,
                              style: textLargeColor(
                                  boldCondition: false,
                                  color: colorPallete.fontColor)),
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      state.status == 'finish'
                          ? SizedBox()
                          : ButtonWithIcon(
                              buttonColor: colorPallete.whiteColor,
                              lineColor: colorPallete.secondColor,
                              textButton: state.status == 'in'
                                  ? 'Check In'
                                  : state.status == 'out'
                                      ? 'Check Out'
                                      : 'Come Home',
                              textColor: colorPallete.fontColor,
                              image:
                                  'lib/presentation/shared/assets/images/ic_barcode.svg',
                              onPress: () => processAbsent(
                                  state.checkIn, state.status!, state.id),
                            )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 32,
              ),
              Container(
                width: MediaQuery.of(context).size.width / 3 * 2,
                margin: EdgeInsets.symmetric(vertical: 8),
                child: ButtonWithIcon(
                  buttonColor: colorPallete.mainColor,
                  lineColor: colorPallete.secondColor,
                  textButton: 'Cart',
                  textColor: colorPallete.fontColor,
                  image:
                      'lib/presentation/shared/assets/images/ic_arrow_right.svg',
                  onPress: () => navigateToCart(),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 3 * 2,
                margin: EdgeInsets.symmetric(vertical: 8),
                child: ButtonWithIcon(
                  buttonColor: colorPallete.mainColor,
                  lineColor: colorPallete.secondColor,
                  textButton: 'Chart',
                  textColor: colorPallete.fontColor,
                  image:
                      'lib/presentation/shared/assets/images/ic_arrow_right.svg',
                  onPress: () => navigateToChart(),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 3 * 2,
                margin: EdgeInsets.symmetric(vertical: 8),
                child: ButtonWithIcon(
                  buttonColor: colorPallete.mainColor,
                  lineColor: colorPallete.secondColor,
                  textButton: 'Maps',
                  textColor: colorPallete.fontColor,
                  image:
                      'lib/presentation/shared/assets/images/ic_arrow_right.svg',
                  onPress: () => navigateToMap(),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 3 * 2,
                margin: EdgeInsets.symmetric(vertical: 8),
                child: ButtonWithIcon(
                  buttonColor: colorPallete.mainColor,
                  lineColor: colorPallete.secondColor,
                  textButton: 'About Us',
                  textColor: colorPallete.fontColor,
                  image:
                      'lib/presentation/shared/assets/images/ic_arrow_right.svg',
                  onPress: () => navigateToAbout(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void processAbsent(String checkIn, String status, String id) {
    Get.toNamed('/absentMap');
    // var data = AbsentModel();
    // var now = new DateTime.now();
    // var currentTime = DateFormatter().getCurrentTime(now);
    // var currentDate = DateFormatter().formatBackend(now);
    // if (status == 'in') {
    //   data = AbsentModel(
    //       checkIn: currentTime, checkOut: '--:--', date: currentDate, name: id);
    // } else {
    //   data = AbsentModel(
    //       checkIn: checkIn, checkOut: currentTime, date: currentDate, name: id);
    // }
    // absentController.submitAbsentToday(data);
  }

  void navigateToCart() {
    Get.toNamed('/cart');
  }

  void navigateToChart() {
    Get.toNamed('/chart');
  }

  void navigateToMap() {
    Get.toNamed('/map');
  }

  void navigateToAbout() {
    Get.toNamed('/about');
  }
}
