import 'package:flutter/cupertino.dart';
import 'package:mms_app/app/components/custom_scaffold.dart';
import 'package:mms_app/app/components/text_widgets.dart';

class PrivacyPolicy extends StatefulWidget {
  @override
  _PrivacyPolicyState createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        title: 'Privacy Policy',
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 10.h),
          children: [
            regularText(
              'Do we use cookies and other tracking technologies?',
              fontSize: 25.sp,
              color: AppColors.black,
              fontWeight: FontWeight.w600,
            ),
            SizedBox(height: 20.h),
            regularText(
              'Pharetra morbi libero id aliquam elit massa integer tellus. Quis felis aliquam ullamcorper porttitor. Pulvinar ullamcorper sit dictumst ut eget a, elementum eu. Maecenas est morbi mattis id in ac pellentesque ac.',
              fontSize: 15.sp,
              height: 1.4,
              color: AppColors.textBlack,
            ),
            SizedBox(height: 20.h),
            regularText(
              'How long do we keep your information?',
              fontSize: 25.sp,
              color: AppColors.black,
              fontWeight: FontWeight.w600,
            ),
            SizedBox(height: 20.h),
            regularText(
              'Pharetra morbi libero id aliquam elit massa integer tellus. Quis felis aliquam ullamcorper porttitor. Pulvinar ullamcorper sit dictumst ut eget a, elementum eu. Maecenas est morbi mattis id in ac pellentesque ac.',
              fontSize: 15.sp,
              height: 1.4,
              color: AppColors.textBlack,
            ),
            SizedBox(height: 20.h),
          ],
        ));
  }
}
