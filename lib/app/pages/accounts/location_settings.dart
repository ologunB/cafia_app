import 'package:flutter/material.dart';
import 'package:mms_app/app/components/buttons.dart';
import 'package:mms_app/app/components/chip_item.dart';
import 'package:mms_app/app/components/custom_scaffold.dart';
import 'package:mms_app/app/components/custom_textfield.dart';
import 'package:mms_app/app/components/snackbar.dart';
import 'package:mms_app/app/components/text_widgets.dart';
import 'package:mms_app/app/pages/accounts/search_cities.dart';
import 'package:mms_app/app/utils/country_cities.dart';

class LocationSettings extends StatefulWidget {
  @override
  _LocationSettingsState createState() => _LocationSettingsState();
}

class _LocationSettingsState extends State<LocationSettings> {
  TextEditingController country = TextEditingController();

  List<City> chosenCities = [];

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Location Settings',
      child: ListView(
        padding: EdgeInsets.all(20.h),
        children: [
          CustomTextField(
            hintText: 'Type in your State or Country',
            textInputType: TextInputType.text,
            textInputAction: TextInputAction.next,
            controller: country,
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
            'Save Changes',
            buttonColor: AppColors.orange,
            fontSize: 15.sp,
            height: 56.h,
            textColor: AppColors.white,
            fontWeight: FontWeight.w600,
            onTap: () {
              Navigator.pop(context);
              successSnackBar(context, 'Changes Saved');
            },
          ),
        ),
      ),
    );
  }
}
