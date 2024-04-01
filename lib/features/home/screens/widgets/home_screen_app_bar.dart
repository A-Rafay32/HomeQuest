import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:real_estate_app/app/themes/app_colors.dart';
import 'package:real_estate_app/core/extensions/routes_extenstion.dart';
import 'package:real_estate_app/features/home/screens/notification_screen.dart';

class HomeScreenAppBar extends StatelessWidget {
  const HomeScreenAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: false,
      leading: const Padding(
        padding: EdgeInsets.only(left: 5, top: 5, bottom: 8),
        child: CircleAvatar(
          backgroundColor: Colors.green,
          backgroundImage: AssetImage("assets/svgs/profile/user_avatar.png"),
          radius: 3,
        ),
      ),
      title: Column(
        children: [
          Text(
            "Hi, Daniel",
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(color: Colors.white, fontSize: 20),
          ),
          Text(
            "London, UK",
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: Colors.white,
                ),
          ),
        ],
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            context.push(const NotificationScreen());
          },
          style: const ButtonStyle(
              padding: MaterialStatePropertyAll(EdgeInsets.all(5)),
              backgroundColor:
                  MaterialStatePropertyAll(AppColors.blackshadowColor),
              elevation: MaterialStatePropertyAll(10.0),
              shape: MaterialStatePropertyAll(CircleBorder())),
          child: const Icon(
            Icons.notifications_none_outlined,
            size: 25,
            color: Colors.white,
          ),
        )
      ],
    );
  }
}
