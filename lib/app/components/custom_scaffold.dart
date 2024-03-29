import 'package:flutter/material.dart';
import 'package:mms_app/app/components/text_widgets.dart';
import 'package:mms_app/app/utils/utils.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({
    required this.child,
    this.title,
    this.bottomNavigationBar,
    this.bottomSheet,
    this.removeBack = false,
    this.removeImage = false,
  });

  final Widget child;
  final String? title;
  final Widget? bottomNavigationBar;
  final Widget? bottomSheet;
  final bool removeBack;
  final bool removeImage;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Utils.offKeyboard(),
      child: Scaffold(
        backgroundColor: AppColors.lemon,
        extendBodyBehindAppBar: true,
        appBar: title == null
            ? null
            : AppBar(
                centerTitle: true,
                elevation: 0,
                backgroundColor: Colors.transparent,
                leading: removeBack
                    ? null
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              Icons.arrow_back_rounded,
                              color: AppColors.black,
                            ),
                          )
                        ],
                      ),
                iconTheme: IconThemeData(color: AppColors.black),
                title: regularText(
                  title!,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black,
                  textAlign: TextAlign.center,
                ),
              ),
        body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration:removeImage ? null: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/map.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: SafeArea(child: child)),
        bottomNavigationBar: bottomNavigationBar,
        bottomSheet: bottomSheet,
      ),
    );
  }
}
