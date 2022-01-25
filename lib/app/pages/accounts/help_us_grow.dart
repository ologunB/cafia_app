import 'package:flutter/material.dart';
import 'package:mms_app/app/components/buttons.dart';
import 'package:mms_app/app/components/custom_scaffold.dart';
import 'package:mms_app/app/components/text_widgets.dart';
import 'package:share_plus/share_plus.dart';

class HelpUsGrow extends StatefulWidget {
  @override
  _HelpUsGrowState createState() => _HelpUsGrowState();
}

class _HelpUsGrowState extends State<HelpUsGrow> {
  PageController _pageController = PageController();
  int _index = 0;

  // ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        title: 'Help Us Grow',
        child: Column(
          children: [
            Container(
                margin: EdgeInsets.symmetric(horizontal: 20.h),
                padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 20.h),
                decoration: BoxDecoration(
                  color: AppColors.black,
                  borderRadius: BorderRadius.circular(20.h),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    regularText(
                      'Share Cafia with 3 of your friends to take\nunlimited request free, for 14 days',
                      fontSize: 15.sp,
                      color: AppColors.white,
                    ),
                    Row(),
                    SizedBox(height: 16.h),
                    InkWell(
                      onTap: () {
                        Share.share('Tell a friend', subject: 'Cafia');
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 14.h, vertical: 8.h),
                        decoration: BoxDecoration(
                            color: AppColors.green,
                            borderRadius: BorderRadius.circular(8.h)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            regularText(
                              'Tell a friend',
                              fontSize: 16.sp,
                              color: AppColors.white,
                            ),
                            SizedBox(width: 8.h),
                            Icon(
                              Icons.arrow_forward_rounded,
                              color: AppColors.white,
                              size: 20.h,
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                )),
            SizedBox(height: 32.h),
            regularText('Or choose a plan below',
                fontSize: 15.sp,
                color: AppColors.textBlack,
                textAlign: TextAlign.center),
            SizedBox(height: 12.h),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20.h),
              padding: EdgeInsets.all(6.h),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(8.h),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () => _pageController.animateToPage(
                        0,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      ),
                      child: Container(
                        padding: EdgeInsets.all(14.h),
                        decoration: _index == 1
                            ? null
                            : BoxDecoration(
                                color: AppColors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.grey.withOpacity(.4),
                                    blurRadius: 10,
                                    spreadRadius: 3,
                                  )
                                ],
                                borderRadius: BorderRadius.circular(8.h),
                              ),
                        child: regularText('14 days',
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            color: _index == 1
                                ? AppColors.textBlack
                                : AppColors.black,
                            textAlign: TextAlign.center),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () => _pageController.animateToPage(
                        1,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      ),
                      child: Container(
                        padding: EdgeInsets.all(14.h),
                        decoration: _index == 0
                            ? null
                            : BoxDecoration(
                                color: AppColors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.grey.withOpacity(.4),
                                    blurRadius: 10,
                                    spreadRadius: 3,
                                  )
                                ],
                                borderRadius: BorderRadius.circular(8.h),
                              ),
                        child: regularText('30 days',
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            color: _index == 0
                                ? AppColors.textBlack
                                : AppColors.black,
                            textAlign: TextAlign.center),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 12.h),
            Expanded(
              child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (a) => setState(() => _index = a),
                  itemCount: 2,
                  itemBuilder: (context, pageIndex) {
                    return ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        itemCount: cafiaPlans().length,
                        itemBuilder: (context, listIndex) {
                          CafiaPlan plan = cafiaPlans()[listIndex];
                          String standard = pageIndex == 1 ? '14' : '30';
                          return plan.days == standard
                              ? SizedBox()
                              : item(plan);
                        });
                  }),
            )
          ],
        ));
  }

  Widget item(CafiaPlan plan) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.h, vertical: 15.h),
      padding: EdgeInsets.symmetric(horizontal: 32.h, vertical: 22.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.grey.withOpacity(.4),
            blurRadius: 10,
            spreadRadius: 3,
          )
        ],
        borderRadius: BorderRadius.circular(8.h),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              regularText(plan.name,
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black,
                  textAlign: TextAlign.center),

              /*      regularText('30 days',
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.black,
              textAlign: TextAlign.center),*/
            ],
          ),
          SizedBox(height: 8.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              regularText('\$${plan.price}',
                  fontSize: 50.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.black,
                  textAlign: TextAlign.center),
              SizedBox(width: 6.h),
              regularText('${plan.days} Days',
                  fontSize: 14.sp,
                  height: 4,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textBlack,
                  textAlign: TextAlign.center),
            ],
          ),
          SizedBox(height: 6.h),
          regularText(
            '1 week free trial',
            fontSize: 15.sp,
            color: AppColors.textBlack,
          ),
          SizedBox(height: 6.h),
          ListView.builder(
              itemCount: plan.pecks.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              itemBuilder: (context, i) {
                String name = plan.pecks[i];
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 4.h),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/check.png',
                        height: 24.h,
                        width: 24.h,
                      ),
                      SizedBox(width: 12.h),
                      regularText(name,
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textBlack,
                          textAlign: TextAlign.center),
                    ],
                  ),
                );
              }),
          SizedBox(height: 32.h),
          buttonWithBorder(
            'Get started',
            buttonColor: AppColors.orange,
            fontSize: 15.sp,
            height: 48.h,
            borderRadius: 4,
            textColor: AppColors.white,
            fontWeight: FontWeight.w600,
            onTap: () {
              print(plan.id);
              showModalBottomSheet(
                  barrierColor: AppColors.darkBlue.withOpacity(.1),
                  isScrollControlled: true,
                  context: context,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.h),
                      topRight: Radius.circular(30.h),
                    ),
                  ),
                  builder: (context) {
                    return Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.h, vertical: 26.h),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(height: 27.h),
                          Image.asset(
                            'assets/images/mark.png',
                            width: 64.h,
                          ),
                          SizedBox(height: 32.h),
                          regularText(
                            'Great!!!! 👏',
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.black,
                          ),
                          SizedBox(height: 16.h),
                          regularText(
                            'Thank you for helping us grow. Please invite\nyour friends to this great app and you’ll own a\nfraction of the app.',
                            fontSize: 15.sp,
                            textAlign: TextAlign.center,
                            color: AppColors.black,
                          ),
                          SizedBox(height: 50.h),
                          buttonWithBorder('Done',
                              buttonColor: AppColors.orange,
                              fontSize: 15.sp,
                              height: 56.h,
                              textColor: AppColors.white,
                              fontWeight: FontWeight.w600, onTap: () {
                            Navigator.pop(context);
                          }),
                        ],
                      ),
                    );
                  });
            },
          ),
        ],
      ),
    );
  }

  List<CafiaPlan> cafiaPlans() => [
    CafiaPlan(1, 'STANDARD', '4.50', '14',
        ['Take 7 Request Daily', 'Cancel anytime']),
    CafiaPlan(2, 'PREMIUM', '6.50', '14',
        ['Take UNLIMITED Request Daily', 'Cancel anytime']),
    CafiaPlan(3, 'PREMIUM PLUS', '15.50', '14', [
      'Take UNLIMITED Request Daily',
      '20 minutes ahead on new request ',
      'Cancel anytime'
    ]),
    CafiaPlan(4, 'STANDARD', '6.50', '30',
        ['Take 7 Request Daily', 'Cancel anytime']),
    CafiaPlan(5, 'PREMIUM', '9.50', '30',
        ['Take UNLIMITED Request Daily', 'Cancel anytime']),
    CafiaPlan(6, 'PREMIUM PLUS', '24.50', '30', [
      'Take UNLIMITED Request Daily',
      '20 minutes ahead on new request ',
      'Cancel anytime'
    ]),
  ];

}

class CafiaPlan {
  int id;
  String name;
  String price;
  String days;
  List<String> pecks;

  CafiaPlan(this.id, this.name, this.price, this.days, this.pecks);
}

