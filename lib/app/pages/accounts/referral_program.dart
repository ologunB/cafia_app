import 'package:flutter/material.dart';
import 'package:mms_app/app/components/buttons.dart';
import 'package:mms_app/app/components/score_item.dart';
import 'package:mms_app/app/components/text_widgets.dart';
import 'package:intl/intl.dart';
import 'package:mms_app/app/pages/accounts/view_leaderboard.dart';
import 'package:mms_app/app/utils/router.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:share_plus/share_plus.dart';

class ReferralProgram extends StatefulWidget {
  @override
  _ReferralProgramState createState() => _ReferralProgramState();
}

class _ReferralProgramState extends State<ReferralProgram> {
  int referral = 200;

  @override
  Widget build(BuildContext context) {
    referral = 5056;
    return Scaffold(
      backgroundColor: AppColors.green,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
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
        iconTheme: IconThemeData(color: AppColors.black),
      ),
      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/map0.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: ListView(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            children: [
              SizedBox(height: MediaQuery.of(context).viewPadding.top + 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100.h),
                    child: Image.asset(
                      'assets/images/placeholder.png',
                      width: 96.h,
                      height: 96.h,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 11.h),
              regularText(
                '@jacob_w',
                fontSize: 17.sp,
                textAlign: TextAlign.center,
                fontWeight: FontWeight.w700,
                color: AppColors.white,
              ),
              SizedBox(height: 6.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/flag.png', width: 20.h),
                  SizedBox(width: 6.h),
                  regularText(
                    'Oyo',
                    fontSize: 13.sp,
                    color: AppColors.white,
                  ),
                ],
              ),
              SizedBox(height: 11.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  scoreItem('Friends Referred',
                      NumberFormat.decimalPattern().format(referral)),
                ],
              ),
              SizedBox(height: 23.h),
              Container(
                padding: EdgeInsets.all(21.h),
                decoration: BoxDecoration(
                  color: AppColors.lemon,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.h),
                    topRight: Radius.circular(20.h),
                  ),
                ),
                child: ListView(
                  padding: EdgeInsets.zero,
                  physics: ClampingScrollPhysics(),
                  shrinkWrap: true,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.h, vertical: 20.h),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(10.h),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          regularText(
                            'Help us Grow',
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.black,
                          ),
                          SizedBox(height: 6.h),
                          regularText(
                            'Invite friends and earn a fraction of Cafia’s revenue.',
                            fontSize: 15.sp,
                            color: AppColors.textBlack,
                          ),
                          SizedBox(height: 16.h),
                          buttonWithBorder(
                            'Invite Friends',
                            buttonColor: AppColors.orange,
                            fontSize: 15.sp,
                            height: 48.h,
                            textColor: AppColors.white,
                            fontWeight: FontWeight.w600,
                            onTap: () {
                              Share.share('Tell a friend', subject: 'Cafia');
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 20.h),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(10.h),
                      ),
                      child: ListView(
                        padding: EdgeInsets.zero,
                        physics: ClampingScrollPhysics(),
                        shrinkWrap: true,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.h),
                            child: InkWell(
                                onTap: () {
                                  push(context, ViewLeaderboard());
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    regularText(
                                      'View Leaderboard',
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.darkOrange,
                                    ),
                                    SizedBox(width: 8.h),
                                    Icon(
                                      Icons.arrow_forward_rounded,
                                      color: AppColors.darkOrange,
                                      size: 20.h,
                                    )
                                  ],
                                )),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 13.h),
                            child: Divider(
                              height: 0,
                              thickness: .5.h,
                              color: AppColors.grey.withOpacity(.5),
                            ),
                          ),
                          ListView.builder(
                              itemCount: referralItems().length,
                              shrinkWrap: true,
                              physics: ClampingScrollPhysics(),
                              padding: EdgeInsets.symmetric(horizontal: 16.h),
                              itemBuilder: (context, index) {
                                ReferralItem referral = referralItems()[index];
                                return item(referral);
                              })
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }

  Widget item(ReferralItem item) {
    int referrals = referral < item.total
        ? 0
        : referral - item.total > item.max
            ? item.max
            : referral - item.total;

    return Container(
        margin: EdgeInsets.only(bottom: 10.h),
        padding: EdgeInsets.all(18.h),
        decoration: BoxDecoration(
          color: item.secondary,
          borderRadius: BorderRadius.circular(10.h),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  userNameText(
                    item.title,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.black,
                    usernameColor:
                        item.title == 'It Starts Here' ? null : item.primary,
                  ),
                  SizedBox(height: 6.h),
                  regularText(
                    item.desc,
                    fontSize: 12.sp,
                    color: AppColors.textBlack,
                  ),
                  SizedBox(height: 6.h),
                  regularText('$referrals of ${item.max}',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: item.primary),
                ],
              ),
            ),
            referrals == 0
                ? Container(
                    height: 64.h,
                    width: 64.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(32.h),
                      color: AppColors.white.withOpacity(.56),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/locked.png',
                          height: 24.h,
                          width: 24.h,
                          color: item.primary,
                        ),
                      ],
                    ))
                : CircularPercentIndicator(
                    radius: 32.h,
                    lineWidth: 6.h,
                    animation: true,
                    animationDuration: 2000,
                    circularStrokeCap: CircularStrokeCap.round,
                    percent: referrals / item.max,
                    center: regularText(
                      '${referrals * 100 ~/ item.max}%',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textBlack,
                    ),
                    progressColor: item.primary,
                  )
          ],
        ));
  }

  List<ReferralItem> referralItems() => [
        ReferralItem('It Starts Here', 'Welcome to the contest', 1000, 0,
            Color(0xffE3FCF3), Color(0xff40B855)),
        ReferralItem(
            'Congrats Ambassador',
            "You're now an Amb. here's your new badge?",
            3000,
            1000,
            Color(0xffF1CEEC),
            Color(0xffFFA384)),
        ReferralItem('Well Done Oga', 'Say hello to your new rank', 6000, 4000,
            Color(0xffE3F2FC), Color(0xff74BDCB)),
        ReferralItem('Charge On Sire', 'We salute you our valued sire', 9000,
            10000, Color(0xffFCDAD8), Color(0xffDE6704)),
        ReferralItem(
            'Omedeto Sensei ',
            'Because You command Respect.....SENSEI',
            10000,
            19000,
            Color(0xffEFE7BC),
            Color(0xffFFC63C)),
        //    ReferralItem('', '', 10000, Color(0xff), Color(0xff)),
      ];
}

class ReferralItem {
  String title;
  String desc;
  int max;
  int total;
  Color primary;
  Color secondary;

  ReferralItem(this.title, this.desc, this.max, this.total, this.secondary,
      this.primary);
}
