import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:real_estate_app/app/constants/app_images.dart';
import 'package:real_estate_app/app/themes/app_colors.dart';
import 'package:real_estate_app/core/exceptions/routes_extenstion.dart';
import 'package:real_estate_app/features/home/screens/profile_screen.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({
    super.key,
    required this.w,
  });

  final double w;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
      height: 65,
      width: w * 0.8,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              offset: const Offset(0, 10),
              blurRadius: 35,
              color: Colors.black.withOpacity(0.32))
        ],
        color: Colors.black,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          BottomNavBarItem(
            text: "Home",
            onTap: () {},
            isTagSelected: true,
            iconAsset: AppSvgs.home,
          ),
          BottomNavBarItem(
              text: "Camera",
              onTap: () {},
              isTagSelected: false,
              iconAsset: AppSvgs.home),
          BottomNavBarItem(
              text: "Chat",
              onTap: () {},
              isTagSelected: false,
              iconAsset: AppSvgs.inbox),
          BottomNavBarItem(
              text: "Profile",
              onTap: () {
                context.push(const ProfileScreen());
              },
              isTagSelected: false,
              iconAsset: AppSvgs.profile),
        ],
      ),
    );
  }
}

class BottomNavBarItem extends StatelessWidget {
  const BottomNavBarItem(
      {super.key,
      required this.text,
      this.iconAsset,
      required this.onTap,
      required this.isTagSelected});

  final String text;
  final bool isTagSelected;
  final String? iconAsset;

  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15), topRight: Radius.circular(15))),
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
        // padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
        child: Column(
          children: [
            iconAsset == null
                ? Container()
                : SvgPicture.asset(
                    iconAsset!,
                    height: 17,
                    width: 17,
                    colorFilter: ColorFilter.mode(
                        isTagSelected
                            ? AppColors.secondaryColor
                            : AppColors.backgroundColor,
                        BlendMode.srcIn),
                  ),
            const SizedBox(
              height: 5,
            ),
            Text(
              text,
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: isTagSelected
                        ? AppColors.secondaryColor
                        : AppColors.backgroundColor,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
