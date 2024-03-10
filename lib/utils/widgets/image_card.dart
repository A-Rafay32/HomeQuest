import 'package:ez_homes/model/user.dart';
import 'package:ez_homes/utils/image_picker.dart';
import 'package:ez_homes/data/database_service/house_database.dart';
import 'package:ez_homes/data/database_service/user_database.dart';
import 'package:ez_homes/view_model/notification_controller.dart';
import 'package:flutter/material.dart';

import '../../../model/house.dart';
import '../../../utils/dialogboxes.dart';

class ImageCard extends StatefulWidget {
  const ImageCard(
      {required this.house, required this.h, required this.w, super.key});

  final double h;
  final double w;
  final House house;

  @override
  State<ImageCard> createState() => _ImageCardState();
}

class _ImageCardState extends State<ImageCard> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.h * 0.35,
      width: widget.w,
      padding: const EdgeInsets.all(0),
      child: PageView.builder(
        itemCount: widget.house.images.length,
        onPageChanged: (value) => setState(() {
          currentPage = value;
        }),
        itemBuilder: (context, index) => Stack(
          children: [
            SizedBox(
              height: widget.h * 0.35,
              width: widget.w,
              child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  child: Image.network(
                    widget.house.images[index],
                    fit: BoxFit.cover,
                  )),
            ),
            Positioned(
              left: 10,
              child: Container(
                margin: const EdgeInsets.only(top: 10, left: 10, bottom: 10),
                decoration: BoxDecoration(
                    color: Colors.grey.shade300, shape: BoxShape.circle),
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios_new_rounded,
                    size: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            if (UserDBHelper.userData?.usertype == UserType.admin)
              Positioned(
                // top: 10,
                // left: 10,
                right: 10,
                child: Container(
                    // height: 40,
                    // width: 40,
                    margin:
                        const EdgeInsets.only(top: 10, left: 10, bottom: 10),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300.withOpacity(0.50),
                    ),
                    child: TextButton(
                      onPressed: () {
                        Utils.addBillsDialogBox(
                          context,
                          widget.house.address,
                        );
                        NotificationController().sendNotifications(
                            "Pay your Bills", "Please pay your Bills");
                      },
                      child: const Text("Add Bills"),
                    )),
              ),
            if (UserDBHelper.userData?.usertype == UserType.admin)
              Positioned(
                top: 70,
                // left: 10,
                right: 10,
                child: Container(
                    // height: 40,
                    // width: 40,
                    margin:
                        const EdgeInsets.only(top: 10, left: 10, bottom: 10),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300.withOpacity(0.50),
                    ),
                    child: TextButton(
                      onPressed: () {
                        PickImage().pickImagesHouse(
                            widget.house.name, widget.house.address);
                      },
                      child: const Text("Add Images"),
                    )),
              ),
            Positioned(
              bottom: 20,
              left: 100,
              child: SizedBox(
                height: 8,
                width: widget.w,
                child: ListView.builder(
                  itemCount: widget.house.images.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) =>
                      widget.house.images.length > 1
                          ? Dot(
                              color: (currentPage == index)
                                  ? Colors.black
                                  : Colors.grey,
                              currentPage: currentPage,
                            )
                          : Container(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Dot extends StatelessWidget {
  Dot({
    required this.color,
    required this.currentPage,
    super.key,
  });

  int currentPage;
  final color;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      margin: const EdgeInsets.only(right: 8),
      duration: const Duration(milliseconds: 100),
      width: 8,
      height: 8,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(30),
      ),
    );
  }
}
