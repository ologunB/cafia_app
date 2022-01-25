import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mms_app/app/components/text_widgets.dart';
import 'package:mms_app/app/pages/accounts/referral_program.dart';
import 'package:mms_app/app/utils/router.dart';

class ReferralDialog extends StatefulWidget {
  const ReferralDialog({Key? key}) : super(key: key);

  @override
  _ReferralDialogState createState() => _ReferralDialogState();
}

class _ReferralDialogState extends State<ReferralDialog> {
  bool accept = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          color: AppColors.white,
          padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 20.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              regularText(
                'Rules to the Referral Program',
                fontSize: 24.sp,
                color: AppColors.black,
                fontWeight: FontWeight.w700,
              ),
              SizedBox(height: 10.h),
              Row(
                children: [
                  InkWell(
                    onTap: () => setState(() => accept = !accept),
                    child: Container(
                      height: 20.h,
                      width: 20.h,
                      decoration: BoxDecoration(
                        color: accept ? AppColors.green : null,
                        borderRadius: BorderRadius.circular(10.h),
                        border: Border.all(
                          width: 1.h,
                          color: Color(0xffD0D5DD),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 12.h),
                  Expanded(
                    child: RichText(
                      textAlign: TextAlign.start,
                      text: TextSpan(
                        text: 'I have read, understood, and agreed to the',
                        style: GoogleFonts.rubik(
                          color: AppColors.textBlack,
                          fontSize: 14.sp,
                        ),
                        children: [
                          TextSpan(
                              text: 'Terms and  Conditions',
                              style: GoogleFonts.rubik(
                                  color: AppColors.green,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w600,
                                  decoration: TextDecoration.underline),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {}),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          color: Color(0xffF2F3F5),
          padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 15.h),
          child: Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 12.h, vertical: 6.h),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      border: Border.all(color: AppColors.grey),
                      borderRadius: BorderRadius.circular(6.h),
                    ),
                    child: regularText(
                      'Cancel',
                      fontSize: 15.sp,
                      textAlign: TextAlign.center,
                      color: AppColors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 14.h),
              Expanded(
                child: InkWell(
                  onTap: () {
                    if (accept) {
                      Navigator.pop(context);
                      push(context, ReferralProgram());
                    }
                  },
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 12.h, vertical: 6.h),
                    decoration: BoxDecoration(
                      color: !accept ? AppColors.grey : AppColors.green,
                      border: Border.all(
                        color: !accept ? AppColors.grey : AppColors.green,
                      ),
                      borderRadius: BorderRadius.circular(6.h),
                    ),
                    child: regularText(
                      'Accept',
                      fontSize: 15.sp,
                      color: AppColors.white,
                      fontWeight: FontWeight.w600,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
