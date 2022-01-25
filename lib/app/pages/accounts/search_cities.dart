import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mms_app/app/components/custom_scaffold.dart';
import 'package:mms_app/app/components/custom_textfield.dart';
import 'package:mms_app/app/components/empty_widget.dart';
import 'package:mms_app/app/components/text_widgets.dart';
import 'package:mms_app/app/utils/country_cities.dart';

class SearchCities extends StatefulWidget {
  @override
  _SearchCitiesState createState() => _SearchCitiesState();
}

class _SearchCitiesState extends State<SearchCities> {
  List<City> cities = [];
  List<City> filtered = [];

  @override
  void initState() {
    readJson();
    super.initState();
  }

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/cities.json');
    final List data = await json.decode(response);
    data.forEach((e) {
      cities.add(City.fromJson(e));
    });
    setState(() {});
    filtered.addAll(cities);
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Search City',
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.h),
            child: CustomTextField(
              hintText: 'Search your state or country',
              textInputType: TextInputType.text,
              textInputAction: TextInputAction.search,
              autoFocus: true,
              onChanged: (a) {
                a = a!.trim();
                if (a.length > 0) {
                  a = a.toUpperCase();
                  filtered.clear();
                  for (City item in cities) {
                    if (item.city.toUpperCase().contains(a) ||
                        item.country.toUpperCase().contains(a)) {
                      filtered.add(item);
                    }
                  }
                } else {
                  filtered.clear();
                  filtered.addAll(cities);
                }
                setState(() {});
              },
              suffixIcon: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/search.png', height: 16.h)
                ],
              ),
            ),
          ),
          SizedBox(height: 12.h),
          filtered.isEmpty
              ? Expanded(child: AppEmptyWidget('City not found', ''))
              : Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.symmetric(horizontal: 15.h),
                      itemCount: filtered.length,
                      physics: ClampingScrollPhysics(),
                      itemBuilder: (context, index) {
                        City data = filtered[index];
                        return InkWell(
                          onTap: () => Navigator.pop(context, data),
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 16.h),
                            child: regularText(
                              data.city + ', ' + data.country,
                              fontSize: 16.sp,
                              color: AppColors.textBlack,
                            ),
                          ),
                        );
                      }),
                )
        ],
      ),
    );
  }
}
