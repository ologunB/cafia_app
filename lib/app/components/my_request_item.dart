import 'package:flutter/material.dart';

import 'package:mms_app/app/components/custom_dialog.dart';
import 'package:mms_app/app/components/request_preview.dart';
import 'package:mms_app/app/components/snackbar.dart';
import 'package:mms_app/app/components/text_widgets.dart';
import 'package:mms_app/app/pages/requests/create_request.dart';
import 'package:mms_app/app/pages/requests/request_details.dart';
import 'package:mms_app/app/utils/router.dart';
import 'package:mms_app/app/utils/utils.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class MyRequestItem extends StatefulWidget {
  final int index;

  const MyRequestItem(this.index);

  @override
  _MyRequestItemState createState() => _MyRequestItemState();
}

class _MyRequestItemState extends State<MyRequestItem> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          //   push(context, RequestDetails());
          showDialog<AlertDialog>(
            context: context,
            barrierDismissible: true,
            builder: (BuildContext context) => Container(
              color: AppColors.darkBlue.withOpacity(.1),
              child: AlertDialog(
                insetPadding:
                    EdgeInsets.symmetric(horizontal: 20.h, vertical: 20.h),
                contentPadding: EdgeInsets.zero,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                content: RequestPreview(),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.h),
                ),
              ),
            ),
          );
        },
        child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20.h, vertical: 5.h),
            padding: EdgeInsets.symmetric(horizontal: 14.h, vertical: 15.h),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(20.h),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
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
                          userNameText(
                            '@tadeubonini',
                            fontSize: 15.sp,
                            color: AppColors.black,
                            fontWeight: FontWeight.w600,
                            usernameColor: Color(0xffFFA384),

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
                                color: AppColors.black,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(width: 10.h),
                    InkWell(
                      onTap: onTap,
                      child: Icon(
                        Icons.more_vert_rounded,
                        size: 24.h,
                      ),
                    )
                  ],
                ),
                if (widget.index % 3 == 2)
                  Container(
                      height: 290.h,
                      padding: EdgeInsets.only(top: 12.h),
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20.h),
                            child: PageView.builder(
                                itemCount: 3,
                                onPageChanged: (a) {
                                  setState(() => _index = a);
                                },
                                itemBuilder: (context, pageIndex) {
                                  return Image.asset(
                                    'assets/images/placeholder.png',
                                    fit: BoxFit.fitWidth,
                                    width: MediaQuery.of(context).size.width,
                                  );
                                }),
                          ),
                          Container(
                            height: 25.h,
                            alignment: Alignment.center,
                            child: ListView.builder(
                                itemCount: 3,
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, counterIndex) {
                                  return Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.all(6.h),
                                        child: Container(
                                            height: 10.h,
                                            width: 10.h,
                                            decoration: BoxDecoration(
                                                color: _index == counterIndex
                                                    ? AppColors.darkOrange
                                                    : AppColors.white
                                                        .withOpacity(.5),
                                                borderRadius:
                                                    BorderRadius.circular(22))),
                                      )
                                    ],
                                  );
                                }),
                          )
                        ],
                      )),
                SizedBox(height: 12.h),
                regularText(
                  'This is the title pf the request.. ',
                  fontSize: 15.sp,
                  color: AppColors.black,
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(height: 8.h),
                regularText(
                  'joshua_l The game in Japan was amazing and I want to share some photos',
                  fontSize: 13.sp,
                  color: AppColors.textBlack,
                ),
                SizedBox(height: 6.h),
                regularText(
                  Utils.todaysDate(),
                  fontSize: 12.sp,
                  color: AppColors.textBlack,
                ),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    item('like', '20k'),
                    item('bookmark', '224'),
                    item('share', '112'),


                    if (widget.index % 3 == 1)
                      Container(
                          height: 22.h,
                          width: 22.h,
                          decoration: BoxDecoration(
                              borderRadius:
                              BorderRadius.circular(
                                  20.h),
                              color: AppColors.btnRed),
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.center,
                            children: [
                              regularText(
                                '1',
                                fontSize: 11.sp,
                                color: AppColors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ],
                          )),
                  ],
                )
              ],
            )));
  }

  Widget item(String a, String b) {
    return Padding(
      padding: EdgeInsets.only(right: 25.h),
      child: InkWell(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/$a.png',
              height: 20.h,
              width: 20.h,
            ),
            SizedBox(width: 6.h),
            regularText(
              b,
              fontSize: 13.sp,
              color: AppColors.black,
            ),
          ],
        ),
      ),
    );
  }

  void onTap() {
    showModalBottomSheet(
        barrierColor: AppColors.darkBlue.withOpacity(.1),
        isScrollControlled: true,
        context: context,
        backgroundColor: Colors.transparent,
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width - 40.h,
        ),
        builder: (context) {
          return Container(
            margin: EdgeInsets.only(bottom: 16.h),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30.h),
            ),
            child: Container(
              padding: EdgeInsets.all(16.h),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      regularText(
                        'More',
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.black,
                      ),
                      Spacer(),
                      InkWell(
                        onTap: () => Navigator.pop(context),
                        child: Image.asset(
                          'assets/images/close2.png',
                          width: 56.h,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                      showDialog<AlertDialog>(
                        context: context,
                        barrierDismissible: true,
                        builder: (BuildContext context) => Container(
                          color: AppColors.darkBlue.withOpacity(.1),
                          child: AlertDialog(
                            insetPadding: EdgeInsets.symmetric(
                                horizontal: 20.h, vertical: 20.h),
                            contentPadding: EdgeInsets.zero,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            content: RequestPreview(),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.h),
                            ),
                          ),
                        ),
                      );
                    },
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/images/request.png',
                          width: 24.h,
                        ),
                        SizedBox(width: 16.h),
                        regularText(
                          'View Request Details',
                          fontSize: 17.sp,
                          color: AppColors.black,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                      push(context, RequestDetails());
                    },
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/images/sms.png',
                          width: 24.h,
                        ),
                        SizedBox(width: 16.h),
                        regularText(
                          'View Responses',
                          fontSize: 17.sp,
                          color: AppColors.black,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                      showBarModalBottomSheet(
                        expand: true,
                        context: context,
                        backgroundColor: Colors.transparent,
                        topControl: SizedBox(),
                        builder: (context) => CreateRequest(isEdit: true),
                      );
                    },
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/images/alter.png',
                          width: 24.h,
                        ),
                        SizedBox(width: 16.h),
                        regularText(
                          'Edit Request',
                          fontSize: 17.sp,
                          color: AppColors.black,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                      showDialog<AlertDialog>(
                        context: context,
                        barrierDismissible: true,
                        builder: (BuildContext context) => Container(
                          color: AppColors.darkBlue.withOpacity(.1),
                          child: AlertDialog(
                            insetPadding: EdgeInsets.symmetric(
                                horizontal: 20.h, vertical: 20.h),
                            contentPadding: EdgeInsets.zero,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            content: CustomDialog(
                              title: 'Cancel Request',
                              desc:
                                  'Are you sure you want to cancel current\nrequest?',
                              primary: 'Yes, Delete',
                              secondary: 'Keep Request',
                              primaryAction: () {
                                Navigator.of(context).pop();
                                successSnackBar(
                                    context, 'Request has been deleted');
                              },
                              secondaryAction: () {
                                Navigator.of(context).pop();
                              },
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.h)),
                          ),
                        ),
                      );
                    },
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/images/remove.png',
                          width: 24.h,
                        ),
                        SizedBox(width: 16.h),
                        regularText(
                          'Delete Request',
                          fontSize: 17.sp,
                          color: AppColors.black,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
          );
        });
  }
}
