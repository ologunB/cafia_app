import 'package:flutter/cupertino.dart';
import 'package:mms_app/app/components/buttons.dart';
import 'package:mms_app/app/components/custom_scaffold.dart';
import 'package:mms_app/app/components/text_widgets.dart';

class DeleteAccount extends StatefulWidget {
  const DeleteAccount({Key? key}) : super(key: key);

  @override
  _DeleteAccountState createState() => _DeleteAccountState();
}

class _DeleteAccountState extends State<DeleteAccount> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        title: 'Delete Account',
        removeImage: true,
        child: ListView(
          padding: EdgeInsets.all(20.h),
          children: [
            regularText(
              'Account Deactivation means to delete your account: you will not be able to log in to your profile anymore and all your account history and data will be deleted without the possibility to restore.',
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.black,
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 30.h),
            buttonWithBorder(
              'Delete My Account Forever',
              buttonColor: AppColors.btnRed,
              fontSize: 15.sp,
              height: 56.h,
              textColor: AppColors.white,
              fontWeight: FontWeight.w600,
              onTap: () {},
            ),
          ],
        ));
  }
}
