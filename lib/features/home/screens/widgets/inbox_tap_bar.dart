import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:real_estate_app/app/themes/app_colors.dart';

class InboxTabBar extends StatefulWidget {
  InboxTabBar({super.key, required this.w, required this.selectedTabIndex});

  final double w;
  int selectedTabIndex;

  @override
  State<InboxTabBar> createState() => _InboxTabBarState();
}

class _InboxTabBarState extends State<InboxTabBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      height: 40,
      width: widget.w,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          HomeTabNavigationItem(
            isTagSelected: widget.selectedTabIndex == 0 ? true : false,
            onTap: () {
              setState(() {
                widget.selectedTabIndex = 0;
              });
            },
            text: "All",
          ),
          HomeTabNavigationItem(
            onTap: () {
              setState(() {
                widget.selectedTabIndex = 1;
              });
            },
            text: "Important",
            isTagSelected: widget.selectedTabIndex == 1 ? true : false,
          ),
          HomeTabNavigationItem(
            onTap: () {
              setState(() {
                widget.selectedTabIndex = 2;
              });
            },
            text: "Read",
            isTagSelected: widget.selectedTabIndex == 2 ? true : false,
          ),
          HomeTabNavigationItem(
            onTap: () {
              setState(() {
                widget.selectedTabIndex = 3;
              });
            },
            text: "Unread",
            isTagSelected: widget.selectedTabIndex == 3 ? true : false,
          ),
        ],
      ),
    );
  }
}

class HomeTabNavigationItem extends StatelessWidget {
  const HomeTabNavigationItem(
      {super.key,
      required this.text,
      this.iconAsset,
      this.color,
      this.opacity,
      required this.onTap,
      required this.isTagSelected});

  final String text;
  final bool isTagSelected;
  final String? iconAsset;
  final Color? color;
  final double? opacity;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
            border:
                Border.all(width: 1.5, color: color ?? AppColors.primaryColor),
            color: isTagSelected
                ? color ?? AppColors.primaryColor.withOpacity(opacity ?? 1)
                : AppColors.backgroundColor,
            borderRadius: BorderRadius.circular(20)),
        child: Row(
          children: [
            iconAsset == null
                ? Container()
                : SvgPicture.asset(
                    iconAsset!,
                    height: 15,
                    width: 15,
                    colorFilter: ColorFilter.mode(
                        isTagSelected
                            ? AppColors.backgroundColor
                            : AppColors.primaryColor,
                        BlendMode.srcIn),
                  ),
            const SizedBox(
              width: 7,
            ),
            Center(
              child: Text(
                text,
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: isTagSelected
                          ? AppColors.backgroundColor
                          : color ?? AppColors.primaryColor,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
