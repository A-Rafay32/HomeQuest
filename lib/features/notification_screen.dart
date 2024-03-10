import 'package:ez_homes/model/house.dart';
import 'package:ez_homes/view/widgets/back_button.dart';
import 'package:ez_homes/view/widgets/notification_card.dart';
import 'package:ez_homes/data/database_service/house_database.dart';
import 'package:ez_homes/data/database_service/user_database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/bill.dart';
import '../../model/user.dart';
import '../../view_model/notification_controller.dart';

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
        body:
            Consumer<NotificationController>(builder: (context, value, child) {
          return ListView.builder(
              itemCount: value.bills?.length ?? 0,
              itemBuilder: (context, index) => (value
                              .houses?[index].housetype ==
                          houseType.Rented &&
                      UserDBHelper.userData?.usertype == UserType.user)
                  ? NotficationCard(
                      title: "Pay Your Bills",
                      text:
                          "Please Pay your ${value.bills?[index].category} Bill on Time")
                  : Container());
        }));
  }
}
