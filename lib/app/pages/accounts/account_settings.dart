import 'package:flutter/material.dart';
import 'package:mms_app/app/components/custom_scaffold.dart';
import 'package:mms_app/app/components/text_widgets.dart';
import 'package:mms_app/app/utils/router.dart';

import 'account_view.dart';
import 'category_settings.dart';
import 'delete_account.dart';
import 'location_settings.dart';

class AccountSettings extends StatefulWidget {
  const AccountSettings({Key? key}) : super(key: key);

  @override
  _AccountSettingsState createState() => _AccountSettingsState();
}

class _AccountSettingsState extends State<AccountSettings> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        title: 'Account Settings',
        removeImage: true,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(14.h),
              margin: EdgeInsets.all(20.h),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(20.h),
              ),
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: settingsItems().length,
                padding: EdgeInsets.zero,
                separatorBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6.h),
                    child: Divider(
                      height: 0,
                      thickness: 1.h,
                      color: AppColors.grey.withOpacity(.2),
                    ),
                  );
                },
                itemBuilder: (context, index) {
                  return InkWell(
                      onTap: () => push(context, settingsItems()[index].goto),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 20.h, horizontal: 10.h),
                        child: Row(
                          children: [
                            regularText(settingsItems()[index].title,
                                fontSize: 14.sp,
                                color: settingsItems()[index].title ==
                                        'Delete Account'
                                    ? AppColors.btnRed
                                    : AppColors.black,
                                fontWeight: FontWeight.w600),
                            Spacer(),
                            Image.asset(
                              'assets/images/forward.png',
                              width: 20.h,
                              height: 20.h,
                              color: settingsItems()[index].title ==
                                      'Delete Account'
                                  ? AppColors.btnRed
                                  : null,
                            )
                          ],
                        ),
                      ));
                },
              ),
            )
          ],
        ));
  }

  List<ProfileItem> settingsItems() => [
        ProfileItem('Categories', CategorySettings()),
        ProfileItem('Location Settings', LocationSettings()),
        ProfileItem('Delete Account', DeleteAccount()),
      ];
}
