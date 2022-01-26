import 'package:flutter/material.dart';
import 'package:mms_app/app/components/text_widgets.dart';

class ViewLeaderboard extends StatefulWidget {
  @override
  _ViewLeaderboardState createState() => _ViewLeaderboardState();
}

class _ViewLeaderboardState extends State<ViewLeaderboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.green,
      extendBodyBehindAppBar: true,
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 40.h, vertical: 29.h),
        color: Color(0xffEFE7BC),
        child: SafeArea(
          child: Row(
            children: [
              regularText(
                '65',
                fontSize: 17.sp,
                color: AppColors.black,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(width: 14.h),
              ClipRRect(
                borderRadius: BorderRadius.circular(30.h),
                child: Image.asset(
                  'assets/images/placeholder.png',
                  height: 40.h,
                  width: 40.h,
                ),
              ),
              SizedBox(width: 10.h),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    regularText(
                      'You',
                      fontSize: 14.sp,
                      color: AppColors.black,
                      fontWeight: FontWeight.w600,
                    ),
                    SizedBox(height: 4.h),
                    Row(
                      children: [
                        Image.asset(
                          'assets/images/flag.png',
                          width: 20.h,
                        ),
                        SizedBox(width: 6.h),
                        regularText(
                          'Oyo',
                          fontSize: 13.sp,
                          color: AppColors.textBlack,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(width: 10.h),
              regularText(
                '9.054',
                fontSize: 15.sp,
                color: AppColors.textBlack,
                fontWeight: FontWeight.w600,
              ),
            ],
          ),
        ),
      ),
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
            Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 37.h, right: 37.h, top: 40.h),
                  child: Row(
                    children: [
                      leaderItem(2),
                      Spacer(),
                      leaderItem(3),
                    ],
                  ),
                ),
                Positioned(top: 0, left: 0, right: 0, child: leaderItem(1)),
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
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 7,
                  padding: EdgeInsets.zero,
                  physics: ClampingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.symmetric(vertical: 5.h),
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.h, vertical: 15.h),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(20.h),
                      ),
                      child: Row(
                        children: [
                          regularText(
                            (index + 4).toString(),
                            fontSize: 17.sp,
                            color: AppColors.black,
                            fontWeight: FontWeight.w600,
                          ),
                          SizedBox(width: 14.h),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(30.h),
                            child: Image.asset(
                              'assets/images/placeholder.png',
                              height: 40.h,
                              width: 40.h,
                            ),
                          ),
                          SizedBox(width: 10.h),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                regularText(
                                  '@tadeubonini',
                                  fontSize: 14.sp,
                                  color: AppColors.black,
                                  fontWeight: FontWeight.w600,
                                ),
                                SizedBox(height: 4.h),
                                Row(
                                  children: [
                                    Image.asset(
                                      'assets/images/flag.png',
                                      width: 20.h,
                                    ),
                                    SizedBox(width: 6.h),
                                    regularText(
                                      'Oyo',
                                      fontSize: 13.sp,
                                      color: AppColors.textBlack,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          SizedBox(width: 10.h),
                          regularText(
                            '9.054',
                            fontSize: 15.sp,
                            color: AppColors.textBlack,
                            fontWeight: FontWeight.w600,
                          ),
                        ],
                      ),
                    );
                  },
                )),
          ],
        ),
      ),
    );
  }

  Widget leaderItem(int val) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100.h),
                  border: Border.all(width: 5.h, color: AppColors.white)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100.h),
                child: Image.asset(
                  'assets/images/placeholder.png',
                  width:val == 1? 96.h : 72.h,
                  height: val == 1? 96.h : 72.h,
                ),
              ),
            ),
            Positioned(
              bottom: -21,
              right: 0,
              left: 0,
              child: Image.asset(
                'assets/images/$val.png',
                height: 43.h,
                width: 43.h,
              ),
            ),
          ],
        ),
        SizedBox(height: 20.h),
        regularText(
          '@jacob_w',
          fontSize: 17.sp,
          textAlign: TextAlign.center,
          fontWeight: FontWeight.w700,
          color: AppColors.white,
        ),
        SizedBox(height: 6.h),
        Row(
          mainAxisSize: MainAxisSize.min,
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
        SizedBox(height: 6.h),
        regularText(
          '9.054',
          fontSize: 15.sp,
          color: AppColors.white,
          fontWeight: FontWeight.w600,
        ),
      ],
    );
  }
}
