import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:mms_app/app/components/buttons.dart';
import 'package:mms_app/app/components/custom_scaffold.dart';
import 'package:mms_app/app/components/custom_textfield2.dart';
import 'package:mms_app/app/components/snackbar.dart';
import 'package:mms_app/app/components/text_widgets.dart';
import 'dart:io';

import 'package:mms_app/app/utils/utils.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  File? imageFile;

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController bio = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        title: 'Personal Details',
        bottomNavigationBar: Container(
          color: AppColors.white,
          padding: EdgeInsets.all(20.h),
          child: SafeArea(
            child: buttonWithBorder(
              'Save Changes',
              buttonColor: AppColors.orange,
              fontSize: 15.sp,
              height: 56.h,
              textColor: AppColors.white,
              fontWeight: FontWeight.w600,
              onTap: () {
                Utils.unfocusKeyboard(context);
                successSnackBar(context, 'Changes Saved');
              },
            ),
          ),
        ),
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20.h),
          children: [
            SizedBox(height: 16.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(100.h),
                      child: imageFile != null
                          ? Image.file(
                              imageFile!,
                              width: 96.h,
                              height: 96.h,
                            )
                          : Image.asset(
                              'assets/images/placeholder.png',
                              width: 96.h,
                              height: 96.h,
                            ),
                    ),
                    InkWell(
                      onTap: getImageGallery,
                      child: Image.asset(
                        'assets/images/pick-img.png',
                        width: 24.h,
                        height: 24.h,
                      ),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(height: 48.h),
            regularText(
              'Basic information',
              fontSize: 17.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.black,
            ),
            SizedBox(height: 16.h),
            regularText(
              'Set up your name and contact details in simple steps.️',
              fontSize: 15.sp,
              color: AppColors.textBlack,
            ),
            SizedBox(height: 16.h),
            CustomTextField2(
              title: 'Username',
              textInputType: TextInputType.text,
              textInputAction: TextInputAction.next,
              controller: name,
              enabled: false,
            ),
            SizedBox(height: 16.h),
            CustomTextField2(
              title: 'Email',
              textInputType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              controller: email,
              enabled: false,
            ),
            SizedBox(height: 16.h),
            CustomTextField2(
              title: 'Phone',
              textInputType: TextInputType.phone,
              textInputAction: TextInputAction.next,
              controller: phone,
              enabled: false,
            ),
            SizedBox(height: 16.h),
            CustomTextField2(
              title: 'Bio',
              textInputType: TextInputType.text,
              textInputAction: TextInputAction.next,
              controller: bio,
              maxLines: 5,
            ),
            SizedBox(height: 16.h),
          ],
        ));
  }

  Future getImageGallery() async {
    Utils.offKeyboard();
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(type: FileType.image);

    if (result != null) {
      imageFile = File(result.files.first.path!);
      setState(() {});
    } else {
      return;
    }
  }
}
