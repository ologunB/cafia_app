import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:mms_app/app/components/buttons.dart';
import 'package:mms_app/app/components/chip_item.dart';
import 'package:mms_app/app/components/custom_dialog.dart';
import 'package:mms_app/app/components/custom_textfield.dart';
import 'package:mms_app/app/components/custom_textfield2.dart';
import 'package:mms_app/app/components/snackbar.dart';
import 'package:mms_app/app/components/text_widgets.dart';
import 'package:mms_app/app/pages/accounts/category_settings.dart';
import 'package:mms_app/app/pages/accounts/search_cities.dart';
import 'package:mms_app/app/pages/requests/request_summary.dart';
import 'package:mms_app/app/utils/country_cities.dart';
import 'package:mms_app/app/utils/utils.dart';
import 'dart:io';

class CreateRequest extends StatefulWidget {
  final bool isEdit;

  CreateRequest({this.isEdit = false});

  @override
  _CreateRequestState createState() => _CreateRequestState();
}

class _CreateRequestState extends State<CreateRequest> {
  TextEditingController title = TextEditingController();
  TextEditingController desc = TextEditingController();
  List<City> chosenCities = [];
  List<File> images = [];
  List<String> category = [];

  @override
  Widget build(BuildContext context) {
    return Material(
      child: WillPopScope(
        onWillPop: () async {
          bool shouldClose = true;
          await showDialog<AlertDialog>(
            context: context,
            barrierDismissible: true,
            builder: (BuildContext context) => Container(
              color: AppColors.darkBlue.withOpacity(.1),
              child: AlertDialog(
                insetPadding:
                    EdgeInsets.symmetric(horizontal: 20.h, vertical: 20.h),
                contentPadding: EdgeInsets.zero,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                content: CustomDialog(
                  title: 'Cancel Request',
                  desc: 'Are you sure you want to cancel current\nrequest?',
                  primary: 'Yes, Cancel',
                  secondary: 'Keep Request',
                  primaryAction: () {
                    shouldClose = true;
                    Navigator.of(context).pop();
                  },
                  secondaryAction: () {
                    shouldClose = false;
                    Navigator.of(context).pop();
                  },
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.h)),
              ),
            ),
          );

          return shouldClose;
        },
        child: Scaffold(
            backgroundColor: AppColors.lemon,
            bottomNavigationBar: Container(
              color: AppColors.white,
              padding: EdgeInsets.all(20.h),
              child: SafeArea(
                child: buttonWithBorder(
                  widget.isEdit ? 'Save Changes' : 'Next',
                  buttonColor: AppColors.orange,
                  fontSize: 15.sp,
                  height: 56.h,
                  textColor: AppColors.white,
                  fontWeight: FontWeight.w600,
                  onTap: () {
                    if (title.text.isEmpty ||
                        desc.text.isEmpty ||
                        category.isEmpty ||
                        chosenCities.isEmpty) {
                      errorSnackBar(context, 'Fill all Empty Fields');
                      return;
                    }
                    Utils.unfocusKeyboard(context);
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
                          content: ClipRRect(
                            borderRadius: BorderRadius.circular(20.h),
                            child: RequestSummary(
                              title: title.text,
                              desc: desc.text,
                              category: category,
                              state: chosenCities,
                              images: images,
                            ),
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.h)),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            body: SafeArea(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(20.h),
                    color: AppColors.white,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        regularText(
                          widget.isEdit ? 'Edit Request' : 'Make a Request',
                          fontSize: 18.sp,
                          color: AppColors.black,
                          fontWeight: FontWeight.w500,
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: InkWell(
                            onTap: () {
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
                                      primary: 'Yes, Cancel',
                                      secondary: 'Keep Request',
                                      primaryAction: () {
                                        Navigator.of(context).pop();
                                        Navigator.of(context).pop();
                                      },
                                      secondaryAction: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.h)),
                                  ),
                                ),
                              );
                            },
                            child: Image.asset(
                              'assets/images/close.png',
                              height: 40.h,
                              width: 40.h,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      padding: EdgeInsets.symmetric(
                          horizontal: 21.h, vertical: 30.h),
                      children: [
                        CustomTextField2(
                          title: 'Title',
                          textInputType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          controller: title,
                        ),
                        SizedBox(height: 15.h),
                        CustomTextField2(
                          title: 'Description',
                          controller: desc,
                          textInputType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          maxLines: 6,
                        ),
                        SizedBox(height: 15.h),
                        CustomTextField(
                          hintText: 'Choose Category',
                          textInputType: TextInputType.text,
                          isCreate: true,
                          textInputAction: TextInputAction.next,
                          readOnly: true,
                          onTap: () async {
                            List<String>? res = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    CategorySettings( chosen:category),
                              ),
                            );
                            if (res != null) {
                              print(res.length);
                              category = res;
                            }
                            setState(() {});
                          },
                          suffixIcon: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color: AppColors.black,
                                size: 28.h,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 5.h),
                        Wrap(
                            children: category
                                .map((e) => chipItem(
                                category: e,
                                onTap: () =>
                                    setState(() => category.remove(e))))
                                .toList()),
                        SizedBox(height: 10.h),
                        CustomTextField(
                          hintText: 'Type in your State or Country',
                          textInputType: TextInputType.text,
                          isCreate: true,
                          textInputAction: TextInputAction.next,
                          readOnly: true,
                          onTap: () async {
                            if (chosenCities.length == 3) {
                              errorSnackBar(
                                  context, 'You can only select 3 locations');
                              return;
                            }
                            City? res = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SearchCities(),
                              ),
                            );
                            if (res != null) {
                              chosenCities.add(res);
                              chosenCities = chosenCities.toSet().toList();
                            }
                            setState(() {});
                          },
                          suffixIcon: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color: AppColors.black,
                                size: 28.h,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 5.h),
                        regularText(
                          'These are the places your request will show up. you can select up to 3',
                          fontSize: 13.sp,
                          color: AppColors.textBlack,
                        ),
                        SizedBox(height: 5.h),
                        Wrap(
                            children: chosenCities
                                .map((e) => chipItem(
                                    chip: e,
                                    onTap: () =>
                                        setState(() => chosenCities.remove(e))))
                                .toList()),
                        SizedBox(height: 15.h),
                        regularText(
                          'Images:',
                          fontSize: 13.sp,
                          color: AppColors.black,
                          fontWeight: FontWeight.w600,
                        ),
                        regularText(
                          'Do you have an image to further describe your request?',
                          fontSize: 13.sp,
                          color: AppColors.textBlack,
                        ),
                        SizedBox(height: 15.h),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              InkWell(
                                onTap: () => getImageGallery(),
                                child: Container(
                                  height: 89.h,
                                  width: 89.h,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.h),
                                    color: AppColors.grey.withOpacity(.3),
                                  ),
                                  child: Image.asset(
                                    'assets/images/camera.png',
                                    width: 36.h,
                                    height: 36.h,
                                  ),
                                ),
                              ),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: images
                                      .map((e) => Padding(
                                            padding:
                                                EdgeInsets.only(left: 15.h),
                                            child: Stack(
                                              alignment: Alignment.bottomRight,
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.h),
                                                  child: Image.file(
                                                    e,
                                                    height: 89.h,
                                                    width: 89.h,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      Alignment.bottomRight,
                                                  child: InkWell(
                                                    onTap: () {
                                                      images.remove(e);
                                                      setState(() {});
                                                    },
                                                    child: Image.asset(
                                                      'assets/images/delete.png',
                                                      height: 24.h,
                                                      width: 24.h,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ))
                                      .toList(),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 30.h),
                      ],
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }

  Future getImageGallery() async {
    Utils.offKeyboard();
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(type: FileType.image);

    if (result != null) {
      images.add(File(result.files.first.path!));
      setState(() {});
    } else {
      return;
    }
  }
}
