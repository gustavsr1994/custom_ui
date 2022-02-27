import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
          leading: BackButton(
            color: colorPallete.accentColor,
          ),
          title: Text(
            "Chart Screen",
            style: textLargeColor(
                boldCondition: true, color: colorPallete.fontColor),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              groupSelected == 0 ? buildChartLine() : buildChartBar(),
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

  Widget buildChartLine() {
    return AspectRatio(
      aspectRatio: 1.23,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(18)),
            color: colorPallete.mainColor),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: 37,
            ),
            Text(
              'Unfold Shop 2021',
              style: TextStyle(
                  color: colorPallete.fontColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              'Monthly Sales',
              style: TextStyle(
                color: colorPallete.fontColor,
                fontSize: 32,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 37,
            ),
            Expanded(
              child: Padding(
                  padding: EdgeInsets.only(right: 16.0, left: 6.0),
                  child: LineChartCustom()),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildChartBar() {
    return AspectRatio(
      aspectRatio: 1,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
          color: colorPallete.mainColor,
          child: Stack(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Text(
                      'Mingguan',
                      style: TextStyle(
                          color: colorPallete.fontColor,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      'Grafik konsumsi kalori',
                      style: TextStyle(
                          color: colorPallete.accentColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 38,
                    ),
                    Expanded(
                      child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: BarChartCustom()),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    icon:
                        Icon(Icons.play_arrow, color: colorPallete.accentColor),
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
    );
  }

  Widget buildSegment(String text) {
    return Container(
      padding: EdgeInsets.all(12),
      child: Text(
        text,
        style:
            textMediumColor(boldCondition: true, color: colorPallete.fontColor),
      ),
    );
  }
}
