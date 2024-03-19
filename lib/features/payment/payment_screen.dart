import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:real_estate_app/app/themes/app_colors.dart';
import 'package:real_estate_app/app/themes/app_paddings.dart';
import 'package:real_estate_app/core/exceptions/routes_extenstion.dart';
import 'package:real_estate_app/features/auth/widgets/app_bar_white.dart';
import 'package:real_estate_app/features/auth/widgets/button.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({required this.onTap, super.key, required this.price});
  // final House house;
  final int price;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.sizeOf(context).height;
    double w = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(55),
          child: CustomAppBar(
              onPressed: () {
                context.pop();
              },
              text: "Payment")),
      body: Container(
        height: h,
        width: w,
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              padding:
                  EdgeInsets.symmetric(horizontal: w * 0.1, vertical: h * 0.12),
              child: Text(
                "$price PKR",
                style: const TextStyle(
                  fontSize: 24,
                  fontFamily: "Raleway",
                  fontWeight: FontWeight.w600,
                ),
              ),
              // ${house.salePrice}
            ),
            PaymentCard(
              onTap: () {},
              h: h,
              w: w,
              image: "assets/icons/paypal.svg",
              title: "Paypal",
            ),
            PaymentCard(
              onTap: () {},
              h: h,
              w: w,
              image: "assets/icons/mastercard.svg",
              title: "Credit Card",
            ),
            const Spacer(),
            Button(press: () {}, text: "Pay"),
            AppSizes.normalY,
          ],
        ),
      ),
    );
  }
}

class PaymentCard extends StatelessWidget {
  const PaymentCard({
    super.key,
    required this.h,
    required this.w,
    required this.title,
    required this.image,
    required this.onTap,
  });

  final double h;
  final double w;
  final String title;
  final String image;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: h * 0.11,
        width: w,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              blurRadius: 10,
              color: Colors.black.withOpacity(0.20),
              offset: const Offset(10, 10))
        ], color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: Row(
          children: [
            const SizedBox(
              width: 10,
            ),
            SvgPicture.asset(height: 30, width: 30, image),
            const SizedBox(
              width: 30,
            ),
            Text(
              title,
              style: const TextStyle(
                  color: Colors.black,
                  fontFamily: "Raleway",
                  fontWeight: FontWeight.w600,
                  fontSize: 17),
            )
          ],
        ),
      ),
    );
  }
}
