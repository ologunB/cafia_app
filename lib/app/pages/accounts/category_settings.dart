import 'package:flutter/material.dart';
import 'package:mms_app/app/components/buttons.dart';
import 'package:mms_app/app/components/custom_scaffold.dart';
import 'package:mms_app/app/components/snackbar.dart';
import 'package:mms_app/app/components/text_widgets.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:mms_app/app/utils/categories.dart';

class CategorySettings extends StatefulWidget {
  final List<String>? chosen;

  CategorySettings({this.chosen});

  @override
  _CategorySettingsState createState() => _CategorySettingsState();
}

class _CategorySettingsState extends State<CategorySettings> {
  List<String> chosen = [];

  @override
  void initState() {
    if (widget.chosen != null) {
      chosen.addAll(widget.chosen!);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        title: 'Categories',
        bottomNavigationBar: Container(
          padding: EdgeInsets.all(20.h),
          color: AppColors.white,
          child: SafeArea(
            child: buttonWithBorder(
              widget.chosen != null ? 'Continue' : 'Save Changes',
              buttonColor: AppColors.orange,
              fontSize: 15.sp,
              height: 56.h,
              isActive: chosen.isNotEmpty,
              textColor: AppColors.white,
              fontWeight: FontWeight.w600,
              onTap: () {
            //    print(chosen.length);


                if (chosen.isEmpty) {
                  return errorSnackBar(context, 'Select categories');
                }
                Navigator.pop(context, chosen);
                if (widget.chosen == null) {
                  successSnackBar(context, 'Changes Saved');
                }
              },
            ),
          ),
        ),
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 10.h),
          child: StaggeredGrid.count(
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
                                  borderRadius: BorderRadius.circular(24.h),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/images/ctg/${item.image}.png',
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
        ));
  }
}
