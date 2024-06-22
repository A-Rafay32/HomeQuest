import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_estate_app/app/themes/app_paddings.dart';
import 'package:real_estate_app/core/extensions/routes_extenstion.dart';
import 'package:real_estate_app/core/extensions/sizes_extensions.dart';
import 'package:real_estate_app/features/auth/screens/widgets/button.dart';
import 'package:real_estate_app/features/home/models/rental_house.dart';
import 'package:real_estate_app/features/payment/payment_screen.dart';
import 'package:real_estate_app/features/profile_screen.dart';

import 'widgets/address_card.dart';
import 'widgets/description_card.dart';
import 'widgets/image_card.dart';
import 'widgets/price_card.dart';
import 'widgets/room_size_card.dart';

class HouseDetailScreen extends StatefulWidget {
  const HouseDetailScreen({
    super.key,
    required this.house,
  });

  final RentalHouse house;

  @override
  State<HouseDetailScreen> createState() => _HouseDetailScreenState();
}

class _HouseDetailScreenState extends State<HouseDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: SizedBox(
        height: context.h,
        width: context.w,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: context.h * 0.4,
                width: context.w,
                child: HouseDetailImage(
                  h: context.h,
                  w: context.w,
                  house: widget.house,
                ),
              ),
              SizedBox(
                height: context.h * 0.8,
                width: context.w,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      PriceCard(house: widget.house),
                      AppSizes.normalY,
                      DescriptionCard(house: widget.house),
                      AppSizes.normalY,
                      HouseDetailsCard(house: widget.house),
                      AppSizes.largeY,
                      AddressCard(house: widget.house),
                      AppSizes.smallY,
                      const Spacer(),
                      AppSizes.normalY
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: SizedBox(
          height: 60.0,
          width: 200.0,
          child: Button(
            horizontal: 60.w,
            press: () {
              context.push(PaymentScreen(onTap: () {}, price: 100));
            },
            text: "Request a visit",
          ),
        ),
      ),
    );
  }
}
