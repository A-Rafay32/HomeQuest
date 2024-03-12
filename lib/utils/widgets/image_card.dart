import 'package:flutter/material.dart';
import 'package:real_estate_app/app/themes/app_colors.dart';
import 'package:real_estate_app/core/exceptions/routes_extenstion.dart';
import 'package:real_estate_app/features/home/models/house.dart';

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
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                  child: Image.asset(
                    widget.house.images[index],
                    fit: BoxFit.cover,
                  )),
            ),
            Positioned(
              left: 10,
              top: 20,
              child: Card(
                shape: const CircleBorder(),
                color: Colors.white,
                child: GestureDetector(
                  onTap: () {
                    context.pop();
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(9),
                    child: Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
              ),
            ),
            // ListView.builder(
            //     scrollDirection: Axis.horizontal,
            //     itemCount: widget.house.images.length,
            //     itemBuilder: (context, index) {
            //       return Dot(
            //           color: index == currentPage
            //               ? AppColors.primaryColor
            //               : Colors.grey.shade400,
            //           currentPage: currentPage);
            //     })
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
  final Color color;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      margin: const EdgeInsets.only(right: 8),
      duration: const Duration(milliseconds: 100),
      width: 8,
      height: 8,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}
