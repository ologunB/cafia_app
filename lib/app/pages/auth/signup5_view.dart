import 'package:flutter/material.dart';
import 'package:mms_app/app/components/buttons.dart';
import 'package:mms_app/app/components/chip_item.dart';
import 'package:mms_app/app/components/custom_scaffold.dart';
import 'package:mms_app/app/components/custom_textfield.dart';
import 'package:mms_app/app/components/snackbar.dart';
import 'package:mms_app/app/components/text_widgets.dart';
import 'package:mms_app/app/pages/accounts/search_cities.dart';
import 'package:mms_app/app/pages/auth/select_category_view.dart';
import 'package:mms_app/app/utils/country_cities.dart';
import 'package:mms_app/app/utils/router.dart';

class Signup5View extends StatefulWidget {
  @override
  _Signup5ViewState createState() => _Signup5ViewState();
}

class _Signup5ViewState extends State<Signup5View> {
  List<City> chosenCities = [];
  TextEditingController phone = TextEditingController();

  bool accept = false;

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: '',
      child: ListView(
        padding: EdgeInsets.all(20.h),
        children: [
          regularText(
            'We love places',
            fontSize: 37.sp,
            textAlign: TextAlign.center,
            fontWeight: FontWeight.w600,
            color: AppColors.black,
          ),
          SizedBox(height: 10.h),
          regularText(
            'So where would you love to see request from?\nyou can select up to 3 places.',
            fontSize: 15.sp,
            textAlign: TextAlign.center,
            height: 1.8,
            fontWeight: FontWeight.w400,
            color: AppColors.black,
          ),
          SizedBox(height: 30.h),
          CustomTextField(
            hintText: 'Type in your State or Country',
            textInputType: TextInputType.text,
            textInputAction: TextInputAction.next,
            readOnly: true,
            onTap: () async {
              if (chosenCities.length == 3) {
                errorSnackBar(context, 'You can only select 3 locations');
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
              }
              setState(() {});
            },
            suffixIcon: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Image.asset('assets/images/search.png', height: 16.h)],
            ),
          ),
          SizedBox(height: 20.h),
          Wrap(
              children: chosenCities
                  .map((e) => chipItem(
                      chip: e,
                      onTap: () => setState(() => chosenCities.remove(e))))
                  .toList()),
        ],
      ),
      bottomNavigationBar: Container(
        color: AppColors.lemon,
        padding: EdgeInsets.all(20.h),
        child: SafeArea(
          child: buttonWithBorder(
            'Next',
            buttonColor: AppColors.orange,
            fontSize: 15.sp,
            height: 56.h,
            isActive: chosenCities.isNotEmpty,
            textColor: AppColors.white,
            fontWeight: FontWeight.w600,
            onTap: () => push(context, SelectCategoryView()),
          ),
        ),
      ),
    );
  }
}
