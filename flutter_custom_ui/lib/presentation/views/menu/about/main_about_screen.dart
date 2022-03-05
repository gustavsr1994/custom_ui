import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_custom_ui/presentation/shared/common/styles/colors_pallete.dart';
import 'package:flutter_custom_ui/presentation/shared/common/styles/text_style.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

class MainAboutScreen extends StatefulWidget {
  MainAboutScreen();

  @override
  _MainAboutScreenState createState() => _MainAboutScreenState();
}

class _MainAboutScreenState extends State<MainAboutScreen> {
  var colorPallete = ColorsPallete();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: colorPallete.accentColor,
        ),
        title: Text(
          'About',
          style: textLargeColor(
              boldCondition: true, color: colorPallete.fontColor),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.all(8),
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              decoration: BoxDecoration(
                border: Border.all(color: colorPallete.accentColor),
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Gustav Sri Raharjo - Male',
                    style: textLargeColor(
                        boldCondition: true, color: colorPallete.fontColor),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text('08569xxxxxx',
                      style: textMediumColor(
                          boldCondition: false, color: colorPallete.fontColor)),
                  SizedBox(
                    height: 8,
                  ),
                  Text('Indonesia',
                      style: textMediumColor(
                          boldCondition: false, color: colorPallete.fontColor))
                ],
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              margin: EdgeInsets.all(8),
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                'Tech in Used',
                style: textLargeColor(
                    boldCondition: true, color: colorPallete.fontColor),
              ),
            ),
            Container(
              margin: EdgeInsets.all(8),
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                  'GetX, Google MAPS API, Google Place API, Firebase Auth',
                  style: textMediumColor(
                      boldCondition: false, color: colorPallete.fontColor)),
            ),
            Divider(
              color: colorPallete.accentColor,
            ),
            SizedBox(height: 16),
            Container(
              margin: EdgeInsets.all(8),
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                'My Contact Person',
                style: textLargeColor(
                    boldCondition: true, color: colorPallete.fontColor),
              ),
            ),
            bodyMyProfile(context),
          ],
        ),
      ),
    );
  }

  Widget bodyMyProfile(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            final Uri params = Uri(
              scheme: 'mailto',
              path: 'gustavr1994@gmail.com',
              query:
                  'subject=Dear hello&body=Hello', //add subject and body here
            );
            var url = params.toString();
            navigateToSocialMedia(url);
          },
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 50,
            margin: EdgeInsets.all(8),
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            decoration: BoxDecoration(
              border: Border.all(color: colorPallete.accentColor),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      'lib/presentation/shared/assets/images/icon_gmail.svg',
                      fit: BoxFit.contain,
                    ),
                    Text(
                      'Email',
                      style: textMediumColor(
                          boldCondition: true, color: colorPallete.fontColor),
                    ),
                  ],
                ),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: colorPallete.accentColor,
                )
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () =>
              navigateToSocialMedia('https://www.instagram.com/gustavsri/'),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 50,
            margin: EdgeInsets.all(8),
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            decoration: BoxDecoration(
              border: Border.all(color: colorPallete.accentColor),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      'lib/presentation/shared/assets/images/icon_instragram.svg',
                      fit: BoxFit.contain,
                    ),
                    Text(
                      'Instagram',
                      style: textMediumColor(
                          boldCondition: true, color: colorPallete.fontColor),
                    ),
                  ],
                ),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: colorPallete.accentColor,
                )
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () => bottomDialogSosMed(context),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 50,
            margin: EdgeInsets.all(8),
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            decoration: BoxDecoration(
              border: Border.all(color: colorPallete.accentColor),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      'lib/presentation/shared/assets/images/icon_linkedln.svg',
                      fit: BoxFit.contain,
                    ),
                    Text(
                      'Linkedln / Github',
                      style: textMediumColor(
                          boldCondition: true, color: colorPallete.fontColor),
                    ),
                  ],
                ),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: colorPallete.accentColor,
                )
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () =>
              navigateToSocialMedia('https://www.facebook.com/gustavsri'),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 50,
            margin: EdgeInsets.all(8),
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            decoration: BoxDecoration(
              border: Border.all(color: colorPallete.accentColor),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      'lib/presentation/shared/assets/images/icon_facebook.svg',
                      fit: BoxFit.contain,
                    ),
                    Text(
                      'Facebook',
                      style: textMediumColor(
                          boldCondition: true, color: colorPallete.fontColor),
                    ),
                  ],
                ),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: colorPallete.accentColor,
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  void navigateToSocialMedia(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        universalLinksOnly: true,
      );
    } else {
      throw 'There was a problem to open the url: $url';
    }
  }

  void bottomDialogSosMed(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        isDismissible: false,
        builder: (BuildContext context) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.35,
            decoration: BoxDecoration(
              color: colorPallete.whiteColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15.0),
                  topRight: Radius.circular(15.0)),
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                        width: 30,
                        height: 5,
                        margin: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: colorPallete.mainColor,
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        )),
                  ),
                  SizedBox(height: 20),
                  InkWell(
                    onTap: () => navigateToSocialMedia(
                        'https://github.com/gustavsr1994'),
                    child: Card(
                      child: Container(
                        margin: EdgeInsets.all(8),
                        padding: EdgeInsets.all(8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Github',
                              style: textMediumColor(
                                  boldCondition: true,
                                  color: colorPallete.fontColor),
                            ),
                            Icon(Icons.arrow_forward_ios_rounded)
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => navigateToSocialMedia(
                        'https://id.linkedin.com/in/gustav-sri-raharjo-a01768130'),
                    child: Card(
                      child: Container(
                        margin: EdgeInsets.all(8),
                        padding: EdgeInsets.all(8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Linkedln',
                              style: textMediumColor(
                                  boldCondition: true,
                                  color: colorPallete.fontColor),
                            ),
                            Icon(Icons.arrow_forward_ios_rounded)
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
