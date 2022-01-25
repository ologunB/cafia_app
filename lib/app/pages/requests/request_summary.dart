import 'package:flutter/material.dart';
import 'package:mms_app/app/components/buttons.dart';
import 'package:mms_app/app/components/text_widgets.dart';
import 'package:mms_app/app/pages/home/main_layout.dart';
import 'package:mms_app/app/utils/country_cities.dart';
import 'package:mms_app/app/utils/router.dart';
import 'dart:io';

import 'package:mms_app/app/utils/utils.dart';

class RequestSummary extends StatefulWidget {
  final String title;
  final String desc;
  final List<String> category;
  final List<City> state;
  final List<File> images;

  RequestSummary(
      {required this.title,
      required this.desc,
      required this.category,
      required this.state,
      required this.images});

  @override
  _RequestSummaryState createState() => _RequestSummaryState();
}

class _RequestSummaryState extends State<RequestSummary> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (widget.images.isNotEmpty)
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.h),
                    topRight: Radius.circular(20.h),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border(
                            bottom:
                            BorderSide(color: AppColors.grey, width: .5.h))),
                    child: Image.file(
                      widget.images.first,
                      fit: BoxFit.cover,
                      width: MediaQuery.of(context).size.width,
                    ),
                  ),
                ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 26.h),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(30.h),
                          child: Image.asset(
                            'assets/images/placeholder.png',
                            height: 44.h,
                            width: 44.h,
                          ),
                        ),
                        SizedBox(width: 10.h),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              regularText(
                                'joshua_l',
                                fontSize: 15.sp,
                                color: AppColors.black,
                                fontWeight: FontWeight.w600,
                              ),
                              SizedBox(height: 6.h),
                              Row(
                                children: [
                                  Image.asset('assets/images/flag.png',
                                      width: 20.h),
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
                        )
                      ],
                    ),
                    SizedBox(height: 10.h),
                    regularText(
                      widget.title,
                      fontSize: 15.sp,
                      color: AppColors.black,
                      fontWeight: FontWeight.w600,
                    ),
                    SizedBox(height: 10.h),
                    regularText(
                      widget.desc,
                      fontSize: 13.sp,
                      color: AppColors.textBlack,
                    ),
                    SizedBox(height: 10.h),
                    regularText(
                      Utils.todaysDate(),
                      fontSize: 10.sp,
                      color: AppColors.textBlack,
                    ),
                    SizedBox(height: 80.h),
                  ],
                ),
              )
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          left: 0,
          child: Padding(
            padding: EdgeInsets.all(20.h),
            child: buttonWithBorder(
              'Post Request',
              buttonColor: AppColors.orange,
              fontSize: 15.sp,
              height: 56.h,
              textColor: AppColors.white,
              fontWeight: FontWeight.w600,
              onTap: () {
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
                            SizedBox(height: 30.h),
                            regularText(
                              'Great!!!! 👏',
                              fontSize: 24.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.black,
                            ),
                            SizedBox(height: 10.h),
                            regularText(
                              'Your request was successful. Please invite\nyour friends to this great app and you’ll own a\nfraction of the app.',
                              fontSize: 15.sp,
                              textAlign: TextAlign.center,
                              color: AppColors.black,
                            ),
                            SizedBox(height: 70.h),
                            buttonWithBorder('Done',
                                buttonColor: AppColors.orange,
                                fontSize: 15.sp,
                                height: 56.h,
                                textColor: AppColors.white,
                                fontWeight: FontWeight.w600, onTap: () {
                              pushAndRemoveUntil(context, MainLayout());
                            }),
                          ],
                        ),
                      );
                    });
              },
            ),
          ),
        ),
        InkWell(
          onTap: () => Navigator.pop(context),
          child: Image.asset('assets/images/edit.png', height: 56.h),
        ),
      ],
    );
  }
}
