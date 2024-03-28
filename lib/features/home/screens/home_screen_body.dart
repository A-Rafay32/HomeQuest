import 'package:flutter/material.dart';
import 'package:real_estate_app/app/constants/app_images.dart';
import 'package:real_estate_app/app/themes/app_colors.dart';
import 'package:real_estate_app/app/themes/app_paddings.dart';
import 'package:real_estate_app/app/themes/app_text_field_themes.dart';
import 'package:real_estate_app/core/extensions/routes_extenstion.dart';
import 'package:real_estate_app/features/home/models/house.dart';
import 'package:real_estate_app/features/home/screens/house_detail_screen.dart';
import 'package:real_estate_app/features/home/screens/widgets/categories_tab_nav.dart';
import 'package:real_estate_app/features/home/screens/widgets/custom_navigation_bar.dart';
import 'package:real_estate_app/features/home/screens/widgets/home_screen_app_bar.dart';
import 'package:real_estate_app/features/home/screens/widgets/house_images.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  static String homeScreen = "/HomeScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: AppColors.primaryColor,
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(65), child: HomeScreenAppBar()),
      body: SizedBox(
        height: context.h,
        width: context.w,
        child: Stack(
          children: [
            Column(children: [
              Container(
                height: 50,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextField(
                  cursorHeight: 25,
                  controller: TextEditingController(),
                  decoration: AppTextFieldDecorations.searchFieldDecoration,
                ),
              ),
              AppSizes.normalY,
              CatogoriesTabNav(w: context.w),
            ]),
            Positioned(
              top: context.h * 0.17,
              child: Container(
                height: context.h * 0.72,
                width: context.w,
                padding: AppPaddings.normal,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(45),
                      topRight: Radius.circular(45)),
                ),
                child: Column(
                  children: [
                    AppSizes.normalY,
                    Row(
                      children: [
                        Text(
                          "Top Property",
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                        const Spacer(),
                        const Text("View All"),
                      ],
                    ),
                    AppSizes.normalY,
                    Expanded(
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: AppImages.houseImages.length,
                          itemBuilder: (context, index) => HouseImages(
                                onTap: () {
                                  context.push(
                                      HouseDetailScreen(house: demoHouse));
                                },
                                house: demoHouse,
                              )),
                    ),
                    AppSizes.normalY,
                    AppSizes.normalY,
                    AppSizes.normalY,
                    AppSizes.normalY,
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: CustomNavigationBar(
        w: context.w,
      ),
    );
  }
}
