import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:real_estate_app/app/themes/app_colors.dart';
import 'package:real_estate_app/app/themes/app_paddings.dart';
import 'package:real_estate_app/core/exceptions/routes_extenstion.dart';
import 'package:real_estate_app/features/home/models/house.dart';
import 'package:real_estate_app/features/home/screens/house_detail_screen.dart';
import 'package:real_estate_app/features/home/screens/widgets/house_image_view.dart';
import 'package:real_estate_app/features/home/screens/widgets/house_images.dart';

class HousesCardWidget extends StatefulWidget {
  const HousesCardWidget({
    super.key,
    // required this.width,
    // required this.height,
    required this.house,
    required this.OnTapFav,
  });

  // final double width;
  // final double height;
  final House house;

  final Function() OnTapFav;

  @override
  State<HousesCardWidget> createState() => _HousesCardWidgetState();
}

class _HousesCardWidgetState extends State<HousesCardWidget> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(428, 926));
    return GestureDetector(
      onTap: () {
        context.push(HouseDetailScreen(house: widget.house));
      },
      child: Container(
          padding: AppPaddings.tiny,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  blurRadius: 10,
                  color: Colors.grey.shade200.withOpacity(0.7),
                  offset: const Offset(-10, 10)),
              BoxShadow(
                  blurRadius: 10,
                  color: Colors.grey.shade200.withOpacity(0.7),
                  offset: const Offset(10, -10))
            ],
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              HouseImageView(
                  width: 300.w,
                  isPremium: true,
                  productImage: widget.house.images[0],
                  context: context,
                  houseType: widget.house.housetype),
              SizedBox(
                height: 10.h,
              ),
              ProductDetails(context, widget.OnTapFav),
            ],
          )),
    );
  }

  Column ProductDetails(BuildContext context, Function() onTapFav) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          widget.house.name,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: AppColors.textBlackColor,
                fontSize: 24.sp,
                fontWeight: FontWeight.w700,
              ),
        ),
        AppSizes.tinyY,
        Text(
          "\$${widget.house.pricePerMonth}",
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: AppColors.primaryColor,
                fontSize: 18.sp,
              ),
        ),
        AppSizes.tinyX,
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {},
              child: SvgPicture.asset(
                "assets/exports/location_filled.svg",
                height: 20,
                width: 20,
                colorFilter: const ColorFilter.mode(
                    AppColors.primaryColor, BlendMode.srcIn),
              ),
            ),
            SizedBox(
              width: 10.w,
            ),
            Text(
              widget.house.address,
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                  color: AppColors.textBlackColor,
                  fontSize: 17.sp),
            ),
            //Favourite Button Tap
          ],
        ),
      ],
    );
  }
}
