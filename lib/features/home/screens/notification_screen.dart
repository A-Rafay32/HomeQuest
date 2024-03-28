import 'package:flutter/material.dart';
import 'package:real_estate_app/core/extensions/routes_extenstion.dart';
import 'package:real_estate_app/features/auth/screens/widgets/app_bar_white.dart';
import 'package:real_estate_app/utils/widgets/notification_card.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({
    super.key,
  });

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(55),
          child: CustomAppBar(
              onPressed: () {
                context.pop();
              },
              text: "Notifications"),
        ),
        body: ListView.builder(
            itemCount: 4,
            itemBuilder: (context, index) => const NotficationCard(
                title: "Pay Your Bills",
                text: "Please Pay your Electricity Bill on Time")));
  }
}
