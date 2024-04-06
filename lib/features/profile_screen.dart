import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_estate_app/app/themes/app_colors.dart';
import 'package:real_estate_app/app/themes/app_paddings.dart';
import 'package:real_estate_app/core/extensions/routes_extenstion.dart';
import 'package:real_estate_app/core/extensions/sizes_extensions.dart';
import 'package:real_estate_app/core/extensions/text_theme_ext.dart';
import 'package:real_estate_app/features/auth/screens/widgets/app_bar_white.dart';
import 'package:real_estate_app/features/auth/screens/widgets/button.dart';
import 'package:real_estate_app/features/home/models/house.dart';
import 'package:real_estate_app/features/home/screens/widgets/popular_houses_card.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(55),
        child: CustomAppBar(
            backgroundColor: AppColors.primaryColor,
            textColors: Colors.white,
            onPressed: () {
              context.pop();
            },
            text: "Agent Profile"),
      ),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Stack(
          children: [
            Container(
              color: AppColors.primaryColor,
              height: context.h,
              width: context.w,
            ),
            Positioned(
              top: 40,
              child: Container(
                width: context.w,
                padding: AppPaddings.small,
                decoration: const BoxDecoration(
                    color: AppColors.backgroundColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: Column(
                  children: [
                    AppSizes.normalY,
                    const ProfileCard(),
                    AppSizes.largeY,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: List.generate(
                          3,
                          (index) => RatingCard(
                              label: "Rating", rating: 500, press: () {})),
                    ),
                    AppSizes.largeY,
                    CustomTabNavigation(w: context.w),
                    AppSizes.normalY,
                    GridView.builder(
                        physics: const ClampingScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 20,
                            crossAxisSpacing: 10,
                            childAspectRatio: 0.8.h),
                        itemCount: 6,
                        itemBuilder: (context, index) {
                          return HousesCardWidget(
                            OnTapFav: () {},
                            house: demoHouse,
                          );
                        }),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Button(
          vertical: 21,
          horizontal: context.w / 2.6,
          textColor: AppColors.secondaryColor,
          press: () {},
          text: "Start Chat"),
    );
  }
}

class RatingCard extends StatelessWidget {
  const RatingCard(
      {super.key,
      required this.label,
      required this.rating,
      required this.press,
      this.borderColor,
      this.backgroundColor});
  final String label;
  final int rating;
  final Color? backgroundColor;
  final Color? borderColor;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.white,
        border: Border.all(color: borderColor ?? Colors.black12),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            rating.toString(),
            style:
                Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 20),
          ),
          AppSizes.tinyY,
          Text(label,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(color: Colors.black45)),
        ],
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 40,
        ),
        AppSizes.normalX,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "David Beckham",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontSize: 18),
            ),
            Text(
              "davidbeckham@gmail.com",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(color: Colors.black26),
            ),
          ],
        ),
        const Spacer(),
        const Icon(
          Icons.settings,
          size: 25,
          color: AppColors.primaryColor,
        )
      ],
    );
  }
}

class CustomTabNavigation extends StatelessWidget {
  const CustomTabNavigation({
    super.key,
    required this.w,
  });

  final double w;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {},
          child: CustomTabItem(
            isSelected: true,
            w: w,
            text: "Listings",
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: CustomTabItem(
            isSelected: false,
            w: w,
            text: "Sold",
          ),
        ),
      ],
    );
  }
}

class CustomTabItem extends StatefulWidget {
  const CustomTabItem({
    super.key,
    required this.w,
    required this.text,
    required this.isSelected,
  });

  final double w;
  final String text;
  final bool isSelected;

  @override
  State<CustomTabItem> createState() => _CustomTabItemState();
}

class _CustomTabItemState extends State<CustomTabItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
            color: widget.isSelected ? Colors.white : Colors.black12,
          ),
          color: widget.isSelected ? AppColors.primaryColor : Colors.white,
          borderRadius: BorderRadius.circular(15)),
      alignment: Alignment.center,
      padding:
          EdgeInsets.symmetric(vertical: 10, horizontal: context.w * 0.15.w),
      child: Text(
        widget.text,
        style: context.textTheme.titleLarge?.copyWith(
            color: widget.isSelected ? Colors.white : Colors.black54,
            fontWeight: FontWeight.w600),
      ),
    );
  }
}
