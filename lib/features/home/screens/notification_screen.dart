import 'package:flutter/material.dart';
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
        appBar: AppBar(
          leading: const BackButton(),
          title: const Padding(
            padding: EdgeInsets.only(left: 65.0),
            child: Text(
              "Notifications",
              style: TextStyle(
                  fontFamily: "Raleway",
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 21),
            ),
          ),
        ),
        body: ListView.builder(
            itemCount: 4,
            itemBuilder: (context, index) => const NotficationCard(
                title: "Pay Your Bills",
                text: "Please Pay your Electricity Bill on Time")));
  }
}
