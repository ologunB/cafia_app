import 'package:flutter/material.dart';
import 'package:mms_app/app/components/empty_widget.dart';
import 'package:mms_app/app/components/my_request_item.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:mms_app/app/components/text_widgets.dart';
import 'create_request.dart';

class MyRequests extends StatefulWidget {
  const MyRequests({Key? key}) : super(key: key);

  @override
  _MyRequestsState createState() => _MyRequestsState();
}

class _MyRequestsState extends State<MyRequests> {
  bool empty = true;

  @override
  void initState() {
    Future.delayed(Duration(seconds: 2), () => setState(() => empty = false));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return empty
        ? AppEmptyWidget(
            'No Requests made yet',
            'Go ahead and make your first request.',
            onTap: () {
              showBarModalBottomSheet(
                expand: true,
                context: context,
                backgroundColor: Colors.transparent,
                topControl: SizedBox(),
                builder: (context) => CreateRequest(),
              );
            },
          )
        : ListView.builder(
            itemCount: 10,
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            padding: EdgeInsets.only(top: 10.h, bottom: 100.h),
            itemBuilder: (context, index) {
              return MyRequestItem(index);
            });
  }
}
