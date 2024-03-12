import 'package:flutter/material.dart';
import 'package:real_estate_app/app/constants/app_images.dart';
import 'package:real_estate_app/app/themes/app_colors.dart';
import 'package:real_estate_app/app/themes/app_paddings.dart';

class CatogoriesTabNav extends StatefulWidget {
  const CatogoriesTabNav({super.key, required this.w});

  final double w;

  @override
  State<CatogoriesTabNav> createState() => _CatogoriesTabNavState();
}

class _CatogoriesTabNavState extends State<CatogoriesTabNav> {
  static int selectedTabIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: widget.w,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      color: AppColors.primaryColor,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          HomeTabNavigationItem(
            isTagSelected: selectedTabIndex == 0 ? true : false,
            onTap: () {},
            imageAsset: AppImages.houseImages[0],
            text: "All",
          ),
          HomeTabNavigationItem(
              onTap: () {},
              text: "House",
              isTagSelected: selectedTabIndex == 1 ? true : false,
              imageAsset: AppImages.houseImages[1]),
          HomeTabNavigationItem(
              onTap: () {},
              text: "Apartment",
              isTagSelected: selectedTabIndex == 2 ? true : false,
              imageAsset: AppImages.houseImages[2]),
        ],
      ),
    );
  }
}

class HomeTabNavigationItem extends StatelessWidget {
  const HomeTabNavigationItem(
      {super.key,
      required this.text,
      this.imageAsset,
      this.paddingHorz,
      this.paddingVer,
      this.fontSize,
      required this.onTap,
      required this.isTagSelected});

  final String text;
  final bool isTagSelected;
  final String? imageAsset;
  final Function() onTap;
  final double? paddingHorz;
  final double? paddingVer;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 5.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: AppColors.blackshadowColor,
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        child: Row(
          children: [
            AppSizes.tinyX,
            if (imageAsset != null)
              Image.asset(
                imageAsset!,
                height: 20,
                width: 20,
                fit: BoxFit.cover,
              ),
            const SizedBox(
              width: 5,
            ),
            Text(
              text,
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    fontSize: fontSize ?? 14,
                    color: Colors.white,
                  ),
            ),
            AppSizes.normalX
          ],
        ),
      ),
    );
  }
}
