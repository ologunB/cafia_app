import 'package:flutter/material.dart';
import 'package:mms_app/app/components/text_widgets.dart';
import 'package:mms_app/app/pages/accounts/privacy_policy.dart';
import 'package:mms_app/app/pages/accounts/referral_terms.dart';
import 'package:mms_app/app/pages/accounts/term_of_service.dart';
import 'package:mms_app/app/utils/router.dart';

import 'about_us.dart';
import 'account_view.dart';

class AboutLayout extends StatefulWidget {
  const AboutLayout({Key? key}) : super(key: key);

  @override
  _AboutLayoutState createState() => _AboutLayoutState();
}

class _AboutLayoutState extends State<AboutLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.white,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          leading: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_rounded,
                  color: AppColors.black,
                ),
              )
            ],
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Column(
          children: [
            IntrinsicHeight(
              child: Stack(
                children: [
                  Image.asset(
                    'assets/images/about-bg.png',
                    width: MediaQuery.of(context).size.width,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(height: 20.h),
                      Image.asset(
                        'assets/images/logo.png',
                        width: 128.h,
                        height: 128.h,
                      ),
                      SizedBox(height: 16.h),
                      regularText('Cafia',
                          fontSize: 20.sp,
                          color: AppColors.black,
                          fontWeight: FontWeight.w700),
                      SizedBox(height: 8.h),
                      regularText(
                        'Version 1.2.3.4',
                        fontSize: 15.sp,
                        color: AppColors.textBlack,
                      ),
                      Row(children: [SizedBox(height: 30.h)])
                    ],
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(14.h),
              color: AppColors.white,
              child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: settingsItems().length,
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  return InkWell(
                      onTap: () => push(context, settingsItems()[index].goto),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 20.h, horizontal: 10.h),
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/images/about$index.png',
                              width: 20.h,
                              height: 20.h,
                            ),
                            SizedBox(width: 16.h),
                            regularText(settingsItems()[index].title,
                                fontSize: 14.sp,
                                color: AppColors.black,
                                fontWeight: FontWeight.w600),
                          ],
                        ),
                      ));
                },
              ),
            )
          ],
        ));
  }

  List<ProfileItem> settingsItems() => [
        ProfileItem('About Us', AboutUs()),
        ProfileItem('Terms of service', TermOfService()),
        ProfileItem('Privacy policy', PrivacyPolicy()),
        ProfileItem('Referral program', ReferralTerms()),
      ];
}
