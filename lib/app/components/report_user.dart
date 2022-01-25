import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mms_app/app/components/score_item.dart';
import 'package:mms_app/app/components/snackbar.dart';
import 'package:mms_app/app/components/text_widgets.dart';

import 'buttons.dart';
import 'custom_dialog.dart';
import 'custom_textfield2.dart';

class ReportUser extends StatefulWidget {
  @override
  _ReportUserState createState() => _ReportUserState();
}

class _ReportUserState extends State<ReportUser> {
  TextEditingController reason = TextEditingController();
  TextEditingController comment = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: AppColors.lemon,
        width: MediaQuery.of(context).size.width,
         child: Column(children: [
          Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  alignment: Alignment.center,
                  height: 56.h,
                  child: regularText('Report User',
                      fontSize: 17.sp,
                      color: AppColors.black,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: InkWell(
                  onTap: () => Navigator.pop(context),
                  child: Image.asset(
                    'assets/images/close2.png',
                    width: 56.h,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.h),

            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [

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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    scoreItem('RM', '120'),
                    SizedBox(width: 8.h),
                    scoreItem('RG', '120'),
                  ],
                ),
                SizedBox(height: 11.h),

                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'How was your experience\nwith ',
                    style: GoogleFonts.rubik(
                      color: AppColors.black,
                      fontSize: 20.sp,
                    ),
                    children: [
                      TextSpan(
                          text: '@jacob_w',
                          style: GoogleFonts.rubik(
                            color: AppColors.black,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600,
                          ),
                          recognizer: TapGestureRecognizer()..onTap = () {}),
                    ],
                  ),
                ),
                SizedBox(height: 18.h),
                CustomTextField2(
                  title: 'Choose a report reason',
                  textInputType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  controller: reason,
                ),
                SizedBox(height: 16.h),
                CustomTextField2(
                  title: 'Write a comment',
                  textInputType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  controller: comment,
                  maxLines: 5,
                ),
                SizedBox(height: 30.h),
                buttonWithBorder(
                  'Report User',
                  buttonColor: AppColors.btnRed,
                  fontSize: 15.sp,
                  height: 56.h,
                  textColor: AppColors.white,
                  fontWeight: FontWeight.w600,
                  onTap: () {
                    showDialog<AlertDialog>(
                      context: context,
                      barrierDismissible: true,
                      builder: (BuildContext context) => Container(
                        color: AppColors.darkBlue.withOpacity(.1),
                        child: AlertDialog(
                          insetPadding: EdgeInsets.symmetric(horizontal: 10.h),
                          contentPadding: EdgeInsets.zero,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          content: CustomDialog(
                            title: 'Report User',
                            desc: 'Are you sure you want to report this user?',
                            primary: 'Report User',
                            secondary: 'Cancel',
                            primaryAction: () {
                              Navigator.of(context).pop();
                              Navigator.of(context).pop();
                              successSnackBar(context,
                                  'Report Submitted\nWe’ll look into the issue and do the needful');
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
                ),
                SizedBox(height: 20.h),

              ],
            ),
          )
        ],),
      ),
    );
  }
}
