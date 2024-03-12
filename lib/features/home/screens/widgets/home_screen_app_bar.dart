import 'dart:ui';

import 'package:flutter/material.dart';

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
          onPressed: () {},
          style: const ButtonStyle(
              padding: MaterialStatePropertyAll(EdgeInsets.all(5)),
              backgroundColor:
                  MaterialStatePropertyAll(Color.fromARGB(255, 49, 48, 48)),
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
