import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_estate_app/app/constants/app_images.dart';
import 'package:real_estate_app/app/themes/app_colors.dart';
import 'package:real_estate_app/app/themes/app_paddings.dart';
import 'package:real_estate_app/app/themes/app_text_field_themes.dart';
import 'package:real_estate_app/core/extensions/sizes_extensions.dart';
import 'package:real_estate_app/core/extensions/text_theme_ext.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: context.h,
        width: context.w,
        color: AppColors.backgroundColor,
        padding: AppPaddings.normal,
        child: Column(
          children: [
            SizedBox(
              height: 50,
              child: TextField(
                cursorHeight: 25,
                controller: TextEditingController(),
                decoration: AppTextFieldDecorations.searchFieldDecoration,
              ),
            ),
            AppSizes.largeY,
            Expanded(
              child: GridView.builder(
                itemCount: 6,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 0.9.sp,
                    crossAxisSpacing: 15,
                    crossAxisCount: 3),
                itemBuilder: (context, index) => Column(
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset(
                          AppImages.houseImages[index],
                          fit: BoxFit.cover,
                          height: 90.h,
                        )),
                    AppSizes.tinyY,
                    Text(
                      "States",
                      style: context.textTheme.bodyMedium
                          ?.copyWith(fontWeight: FontWeight.w700),
                    )
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
