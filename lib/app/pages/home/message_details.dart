import 'dart:async';

import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import 'package:mms_app/app/components/custom_dialog.dart';
import 'package:mms_app/app/components/empty_widget.dart';
import 'package:mms_app/app/components/input_widget.dart';
import 'package:mms_app/app/components/message_bubble.dart';
import 'package:mms_app/app/components/profile_preview.dart';
import 'package:mms_app/app/components/rate_user.dart';
import 'package:mms_app/app/components/report_user.dart';
import 'package:mms_app/app/components/request_preview.dart';
import 'package:mms_app/app/components/snackbar.dart';
import 'package:mms_app/app/components/text_widgets.dart';
import 'package:keyboard_attachable/keyboard_attachable.dart';

class ChatDetailsView extends StatefulWidget {
  final bool fromRequest;

  ChatDetailsView({this.fromRequest = true});

  @override
  _ChatDetailsViewState createState() => _ChatDetailsViewState();
}

class _ChatDetailsViewState extends State<ChatDetailsView> {
  TextEditingController textController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  List<int> messageList = [];

  @override
  void initState() {
    Future.delayed(Duration(seconds: 2), () {
      messageList = List.generate(10, (index) => index + 1);
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.h),
              child: Row(
                children: [
                  Column(
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
                              color: AppColors.textBlack,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(width: 10.h),
                  Image.asset(
                    'assets/images/call.png',
                    width: 44.h,
                    height: 44.h,
                  ),
                  SizedBox(width: 6.h),
                  InkWell(
                    onTap: onTap,
                    child: Image.asset(
                      'assets/images/more.png',
                      width: 44.h,
                      height: 44.h,
                    ),
                  ),
                  SizedBox(width: 16.h),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 18.h),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        regularText(
                          'Iphone 11Pro Max Brand New',
                          fontSize: 14.sp,
                          color: AppColors.black,
                          fontWeight: FontWeight.w600,
                        ),
                        SizedBox(height: 4.h),
                        regularText(
                          'Last Wednesday at 9:42 AM',
                          fontSize: 13.sp,
                          color: AppColors.textBlack,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10.h),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.h),
                    child: Image.asset(
                      'assets/images/placeholder.png',
                      width: 50.h,
                      height: 50.h,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                color: AppColors.lemon,
                child: FooterLayout(
                  child: Column(
                    children: [
                      if (messageList.isEmpty)
                        Expanded(
                          child: AppEmptyWidget(
                              'No Chat', 'Send a message to jacob'),
                        )
                      else
                        Expanded(
                            child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(20.h),
                                    topLeft: Radius.circular(20.h),
                                  ),
                                ),
                                child: GroupedListView<int, String>(
                                  elements: messageList,
                                  padding: EdgeInsets.only(top: 8.h),
                                  reverse: true,
                                  controller: _scrollController,
                                  groupBy: (element) => '',
                                  groupSeparatorBuilder:
                                      (String groupByValue) => Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(top: 8.h),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20.h, vertical: 6.h),
                                        decoration: BoxDecoration(
                                            color: AppColors.black,
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                        child: regularText(
                                          'Today',
                                          fontSize: 10.sp,
                                          color: AppColors.white,
                                        ),
                                      )
                                    ],
                                  ),
                                  itemBuilder: (context, int element) =>
                                      MessageBubble(
                                    text:
                                        'Awesome! Thanks. I’ll look at this today.',
                                    isSender: element.isEven,
                                    timeSent: DateFormat('hh:mm a')
                                        .format(DateTime.now()),
                                  ),
                                  itemComparator: (a, b) => a.compareTo(b),
                                  useStickyGroupSeparators: true,
                                  floatingHeader: true,
                                  order: GroupedListOrder.DESC,
                                ))),
                    ],
                  ),
                  footer: InputWidget(
                    controller: textController,
                    onSentMessage: (String message) async {
                      _scrollController.animateTo(
                          _scrollController.position.minScrollExtent - 200,
                          curve: Curves.easeOut,
                          duration: const Duration(milliseconds: 300));
                      setState(() {});
                    },
                  ),
                ),
              ),
            )
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
                  if (widget.fromRequest)
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                        showDialog<AlertDialog>(
                          context: context,
                          barrierDismissible: true,
                          builder: (BuildContext context) => Container(
                            color: AppColors.darkBlue.withOpacity(.1),
                            child: AlertDialog(
                              insetPadding:
                                  EdgeInsets.symmetric(horizontal: 16.h),
                              contentPadding: EdgeInsets.zero,
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              content: CustomDialog(
                                title: 'Grant Request',
                                desc:
                                    'Are you sure your request have been met by the user?',
                                primary: 'Yes',
                                secondary: 'Cancel',
                                primaryColor: Color(0xff40B855),
                                primaryAction: () {
                                  Navigator.of(context).pop();
                                  successSnackBar(context,
                                      'User has been granted successfully');
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
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 20.h),
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/images/grant.png',
                              width: 24.h,
                            ),
                            SizedBox(width: 16.h),
                            regularText(
                              'Grant Request',
                              fontSize: 17.sp,
                              color: AppColors.black,
                            ),
                          ],
                        ),
                      ),
                    ),
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
                            content: ProfilePreview(),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.h)),
                          ),
                        ),
                      );
                    },
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/images/face.png',
                          width: 24.h,
                        ),
                        SizedBox(width: 16.h),
                        regularText(
                          'View Full Profile',
                          fontSize: 17.sp,
                          color: AppColors.black,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h),
                  if (widget.fromRequest)
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                        showDialog<AlertDialog>(
                          context: context,
                          barrierDismissible: true,
                          builder: (BuildContext context) => AlertDialog(
                            insetPadding: EdgeInsets.symmetric(
                              horizontal: 16.h,
                              vertical: 20.h,
                            ),
                            contentPadding: EdgeInsets.zero,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            content: RateUser(),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.h),
                            ),
                          ),
                        );
                      },
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 20.h),
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/images/rate.png',
                              width: 24.h,
                            ),
                            SizedBox(width: 16.h),
                            regularText(
                              'Rate User',
                              fontSize: 17.sp,
                              color: AppColors.black,
                            ),
                          ],
                        ),
                      ),
                    ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                      showDialog<AlertDialog>(
                        context: context,
                        barrierDismissible: true,
                        builder: (BuildContext context) => Container(
                          color: AppColors.darkBlue.withOpacity(.1),
                          child: AlertDialog(
                            insetPadding:
                                EdgeInsets.symmetric(horizontal: 16.h),
                            contentPadding: EdgeInsets.zero,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            content: CustomDialog(
                              title: 'Block User',
                              desc: 'Are you sure you want to Block this user?',
                              primary: 'Block User',
                              secondary: 'Cancel',
                              primaryAction: () {
                                Navigator.of(context).pop();
                                successSnackBar(context,
                                    'User has been blocked successfully');
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
                          'assets/images/unblock.png',
                          width: 24.h,
                        ),
                        SizedBox(width: 16.h),
                        regularText(
                          'Block User',
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
                        builder: (BuildContext context) => AlertDialog(
                          insetPadding: EdgeInsets.symmetric(
                            horizontal: 16.h,
                            vertical: 20.h,
                          ),
                          contentPadding: EdgeInsets.zero,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          content: ReportUser(),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.h),
                          ),
                        ),
                      );
                    },
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/images/report.png',
                          width: 24.h,
                        ),
                        SizedBox(width: 16.h),
                        regularText(
                          'Report User',
                          fontSize: 17.sp,
                          color: AppColors.btnRed,
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
