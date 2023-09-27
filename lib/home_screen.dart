import 'package:flutter/material.dart';
import 'package:push_notification/notification_services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

NotificationServices notificationServices = NotificationServices();

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    notificationServices.requestNotificationPermission();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("Notification Permission")),
    );
  }
}
