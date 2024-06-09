import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:real_estate_app/app/themes/app_styles.dart';
import 'package:real_estate_app/app/themes/app_colors.dart';
import 'package:real_estate_app/app/themes/app_paddings.dart';
import 'package:real_estate_app/features/home/screens/widgets/house_image_view.dart';

class HousesCardWidget extends StatefulWidget {
  const HousesCardWidget({
    super.key,
    required this.image,
    required this.name,
    required this.address,
    required this.price,
    required this.onTapFav,
  });

  final Function() onTapFav;
  final String name;
  final String address;
  final String price;
  final String image;

  @override
  State<HousesCardWidget> createState() => _HousesCardWidgetState();
}

class _HousesCardWidgetState extends State<HousesCardWidget> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(428, 926));
    return GestureDetector(
      onTap: () {
        // context.push(HouseDetailScreen(house: widget.house));
      },
      child: Container(
          padding: AppPaddings.tiny,
          decoration: BoxDecoration(
            boxShadow: AppStyles.boxShadow,
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              HouseImageView(
                width: 300.w,
                isPremium: true,
                productImage: widget.image,
                context: context,
              ),
              AppSizes.smallY,
              productDetails(context),
            ],
          )),
    );
  }

  Column productDetails(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          widget.name.toString(),
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: AppColors.textBlackColor,
                fontSize: 21.sp,
                fontWeight: FontWeight.w700,
              ),
        ),
        AppSizes.tinyY,
        Text(
          "\$ ${widget.price}",
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: AppColors.primaryColor,
                fontWeight: FontWeight.w600,
                fontSize: 18.sp,
              ),
        ),
        AppSizes.tinyX,
        Text(
          widget.address,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
              fontWeight: FontWeight.w500, color: AppColors.textBlackColor, fontSize: 17.sp),
        ),
      ],
    );
  }
}
