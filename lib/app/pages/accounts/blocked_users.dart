import 'package:flutter/material.dart';
import 'package:mms_app/app/components/custom_dialog.dart';
import 'package:mms_app/app/components/custom_scaffold.dart';
import 'package:mms_app/app/components/report_user.dart';
import 'package:mms_app/app/components/snackbar.dart';
import 'package:mms_app/app/components/text_widgets.dart';
import 'package:mms_app/app/components/profile_preview.dart';

class BlockedUsers extends StatefulWidget {
  const BlockedUsers({Key? key}) : super(key: key);

  @override
  _BlockedUsersState createState() => _BlockedUsersState();
}

class _BlockedUsersState extends State<BlockedUsers> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Blocked Users',
      removeImage: true,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 5,
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          return InkWell(
              child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20.h, vertical: 3.h),
            padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 9.h),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(20.h),
            ),
            child: Row(
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
                        fontSize: 17.sp,
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
                InkWell(
                  onTap: onTap,
                  child: Icon(
                    Icons.more_vert_rounded,
                    size: 24.h,
                  ),
                )
              ],
            ),
          ));
        },
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
                                EdgeInsets.symmetric(horizontal: 10.h),
                            contentPadding: EdgeInsets.zero,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            content: CustomDialog(
                              title: 'Unblock User',
                              desc:
                                  'Are you sure you want to unblock this user?',
                              primary: 'Unblock User',
                              secondary: 'Cancel',
                              primaryAction: () {
                                Navigator.of(context).pop();
                                successSnackBar(context,
                                    'User has been unblocked successfully');
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
                          'Unblock User',
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
