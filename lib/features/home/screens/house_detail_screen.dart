import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_estate_app/app/themes/app_paddings.dart';
import 'package:real_estate_app/core/exceptions/routes_extenstion.dart';
import 'package:real_estate_app/features/auth/widgets/button.dart';
import 'package:real_estate_app/features/home/models/house.dart';
import 'package:real_estate_app/features/home/screens/chat_screen.dart';

import '../../../utils/widgets/address_card.dart';
import '../../../utils/widgets/description_card.dart';
import '../../../utils/widgets/image_card.dart';
import '../../../utils/widgets/price_card.dart';
import '../../../utils/widgets/room_size_card.dart';

class HouseDetailScreen extends StatefulWidget {
  const HouseDetailScreen({
    super.key,
    required this.house,
  });

  final House house;

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
            ImageCard(
              h: context.h,
              w: context.w,
              house: widget.house,
            ),
            Container(
              height: context.h * 0.65,
              width: context.w,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
                          context.push(const ChatScreen(storeName: "Daniel"));
                        },
                        text: "Contact",
                        horizontal: 60.w,
                      ),
                      const Spacer(),
                      Button(
                        horizontal: 60.w,
                        press: () {},
                        text: "Book Now",
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
