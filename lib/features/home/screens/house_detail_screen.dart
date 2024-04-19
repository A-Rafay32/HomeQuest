import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_estate_app/app/themes/app_paddings.dart';
import 'package:real_estate_app/core/extensions/routes_extenstion.dart';
import 'package:real_estate_app/core/extensions/sizes_extensions.dart';
import 'package:real_estate_app/features/auth/screens/widgets/button.dart';
import 'package:real_estate_app/features/home/models/house.dart';
import 'package:real_estate_app/features/home/models/rental_house.dart';
import 'package:real_estate_app/features/home/screens/buyer_profile_screen.dart';
import 'package:real_estate_app/features/home/screens/chat_screen.dart';
import 'package:real_estate_app/features/payment/payment_screen.dart';
import 'package:real_estate_app/features/profile_screen.dart';

import '../../../utils/widgets/address_card.dart';
import '../../../utils/widgets/description_card.dart';
import 'widgets/image_card.dart';
import '../../../utils/widgets/price_card.dart';
import '../../../utils/widgets/room_size_card.dart';

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
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: HouseDetailImage(
                h: context.h,
                w: context.w,
                house: widget.house,
              ),
            ),
            Expanded(
              flex: 3,
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
                    RoomSizeCard(house: widget.house),
                    AppSizes.largeY,
                    AddressCard(house: widget.house),
                    const Spacer(),
                    Row(
                      children: [
                        Button(
                          press: () {
                            context.push(const ProfileScreen());
                          },
                          text: "Contact",
                          horizontal: 60.w,
                        ),
                        const Spacer(),
                        Button(
                          horizontal: 60.w,
                          press: () {
                            context
                                .push(PaymentScreen(onTap: () {}, price: 100));
                          },
                          text: "Book Now",
                        ),
                      ],
                    ),
                    AppSizes.normalY
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
