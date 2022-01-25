import 'package:flutter/material.dart';
import 'package:mms_app/app/components/floating_navbar.dart';
import 'package:mms_app/app/pages/notifications/notifications_view.dart';
import 'package:mms_app/app/pages/accounts/account_view.dart';
import 'package:mms_app/app/pages/requests/create_request.dart';
import 'package:mms_app/app/pages/requests/requests_layout.dart';
import 'dashboard_view.dart';

class MainLayout extends StatefulWidget {
  @override
  _MainLayoutState createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: FloatingNavBar(
        items: [
          FloatingNavBarItem(img: 'home', page: DashboardView()),
          FloatingNavBarItem(img: 'message', page: RequestLayout()),
          FloatingNavBarItem(img: 'main-add', page: CreateRequest()),
          FloatingNavBarItem(img: 'notification', page: NotificationsView()),
          FloatingNavBarItem(img: 'profile', page: AccountView()),
        ],
      ),
    );
  }
}
