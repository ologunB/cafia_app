import 'package:flutter/material.dart';
import 'package:mms_app/app/components/buttons.dart';
import 'package:mms_app/app/components/custom_scaffold.dart';
import 'package:mms_app/app/utils/local_storage.dart';
import 'package:mms_app/app/components/text_widgets.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:mms_app/app/pages/home/main_layout.dart';
import 'package:mms_app/app/utils/categories.dart';
import 'package:mms_app/app/utils/router.dart';

class SelectCategoryView extends StatefulWidget {

  @override
  _SelectCategoryViewState createState() => _SelectCategoryViewState();
}

class _SelectCategoryViewState extends State<SelectCategoryView> {
  List<String> chosen = [];

  @override
  void initState() {
    AppCache.setFilledProfile(true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        title: '',
        child: Stack(
          children: [
            ListView(
              padding: EdgeInsets.symmetric(horizontal: 20.h),
              shrinkWrap: true,
              children: [
                regularText(
                  'Category',
                  fontSize: 37.sp,
                  textAlign: TextAlign.center,
                  fontWeight: FontWeight.w600,
                  color: AppColors.black,
                ),
                SizedBox(height: 10.h),
                regularText(
                  'People make request based on categories, so\nthe more your categories, the higher your\nchances of receiving request notifications.',
                  fontSize: 15.sp,
                  textAlign: TextAlign.center,
                  height: 1.4,
                  fontWeight: FontWeight.w400,
                  color: AppColors.black,
                ),
                SizedBox(height: 30.h),
                StaggeredGrid.count(
                    crossAxisCount: 2,
                    children: categories().map<Widget>((Category item) {
                      return InkWell(
                          onTap: () {
                            if (chosen.contains(item.name)) {
                              chosen.remove(item.name);
                            } else {
                              chosen.add(item.name);
                            }
                            setState(() {});
                          },
                          child: Stack(
                            children: [
                              Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: AppColors.white,
                                    borderRadius: BorderRadius.circular(10.h),
                                    border: Border.all(
                                        color: chosen.contains(item.name)
                                            ? AppColors.green
                                            : AppColors.white)),
                                padding: EdgeInsets.all(10.h),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 48.h,
                                      width: 48.h,
                                      decoration: BoxDecoration(
                                        color: AppColors.lightOrange,
                                        borderRadius:
                                        BorderRadius.circular(24.h),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            'assets/images/ctg/${item
                                                .image}.png',
                                            height: 26.h,
                                            width: 26.h,
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 6.h),
                                    regularText(
                                      item.name,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.black,
                                    ),
                                  ],
                                ),
                              ),
                              if (chosen.contains(item.name))
                                Align(
                                  alignment: Alignment.topRight,
                                  child: Padding(
                                    padding: EdgeInsets.all(6.h),
                                    child: Icon(
                                      Icons.check_circle_rounded,
                                      color: AppColors.green,
                                      size: 22.h,
                                    ),
                                  ),
                                )
                            ],
                          ));
                    }).toList(),
                    mainAxisSpacing: 20.h,
                    crossAxisSpacing: 20.h),
                SizedBox(height: 100.h),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.all(20.h),
                child: SafeArea(
                  child: buttonWithBorder(
                   'Continue',
                    buttonColor: AppColors.orange,
                    fontSize: 15.sp,
                    height: 56.h,
                    isActive: chosen.isNotEmpty,
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
                                  SizedBox(height: 32.h),
                                  regularText(
                                    'Eureka!!! 👏',
                                    fontSize: 24.sp,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.black,
                                  ),
                                  SizedBox(height: 16.h),
                                  regularText(
                                    'Now you can enjoy the wonders of Cafia',
                                    fontSize: 15.sp,
                                    textAlign: TextAlign.center,
                                    color: AppColors.black,
                                  ),
                                  SizedBox(height: 100.h),
                                  buttonWithBorder('Let’s Begin',
                                      buttonColor: AppColors.orange,
                                      fontSize: 15.sp,
                                      height: 56.h,
                                      textColor: AppColors.white,
                                      fontWeight: FontWeight.w600,
                                      onTap: () {
                                        pushAndRemoveUntil(
                                            context, MainLayout());
                                      }),
                                ],
                              ),
                            );
                          });
                    },
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
