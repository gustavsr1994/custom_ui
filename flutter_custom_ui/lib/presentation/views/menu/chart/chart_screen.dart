import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_ui/presentation/shared/common/styles/colors_pallete.dart';
import 'package:flutter_custom_ui/presentation/shared/common/styles/text_style.dart';
import 'package:flutter_custom_ui/presentation/shared/widgets/chart/bar_chart.dart';
import 'package:flutter_custom_ui/presentation/shared/widgets/chart/line_chart.dart';

class ChartScreen extends StatefulWidget {
  @override
  _ChartScreenState createState() => _ChartScreenState();
}

class _ChartScreenState extends State<ChartScreen> {
  var colorPallete = ColorsPallete();
  int groupSelected = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Chart Screen",
            style: textLargeColor(
                boldCondition: true, color: colorPallete.transparantColor),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              groupSelected == 0
                  ? AspectRatio(
                      aspectRatio: 1.23,
                      child: Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(18)),
                          gradient: LinearGradient(
                            colors: [
                              Color(0xff2c274c),
                              Color(0xff46426c),
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            const SizedBox(
                              height: 37,
                            ),
                            const Text(
                              'Unfold Shop 2021',
                              style: TextStyle(
                                color: Color(0xff827daa),
                                fontSize: 16,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            const Text(
                              'Monthly Sales',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 2,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(
                              height: 37,
                            ),
                            Expanded(
                              child: Padding(
                                  padding:
                                      EdgeInsets.only(right: 16.0, left: 6.0),
                                  child: LineChartCustom()),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                    )
                  : AspectRatio(
                      aspectRatio: 1,
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18)),
                          color: const Color(0xff81e5cd),
                          child: Stack(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(16),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    const Text(
                                      'Mingguan',
                                      style: TextStyle(
                                          color: Color(0xff0f4a3c),
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    const Text(
                                      'Grafik konsumsi kalori',
                                      style: TextStyle(
                                          color: Color(0xff379982),
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      height: 38,
                                    ),
                                    Expanded(
                                      child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 8.0),
                                          child: BarChartCustom()),
                                    ),
                                    const SizedBox(
                                      height: 12,
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.play_arrow,
                                      color: const Color(0xff0f4a3c),
                                    ),
                                    onPressed: () {
                                      // setState(() {
                                      //   isPlaying = !isPlaying;
                                      //   if (isPlaying) {
                                      //     refreshState();
                                      //   }
                                      // });
                                    },
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
              SizedBox(
                height: 20,
              ),
              CupertinoSlidingSegmentedControl<int>(
                groupValue: groupSelected,
                children: {
                  0: buildSegment('Line Chart'),
                  1: buildSegment('Bar Chart')
                },
                onValueChanged: (value) {
                  setState(() {
                    groupSelected = value!;
                  });
                },
              )
            ],
          ),
        ));
  }

  Widget buildSegment(String text) {
    return Container(
      padding: EdgeInsets.all(12),
      child: Text(
        text,
        style: textMediumColor(
            boldCondition: true, color: colorPallete.accentBlueColor),
      ),
    );
  }
}
