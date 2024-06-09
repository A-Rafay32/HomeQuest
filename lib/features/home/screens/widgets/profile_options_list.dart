import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:real_estate_app/app/constants/firebase_constants.dart';
import 'package:real_estate_app/core/extensions/routes_extenstion.dart';
import 'package:real_estate_app/core/extensions/sizes_extensions.dart';
import 'package:real_estate_app/features/auth/repositories/user_repository.dart';

class ProfileOptionsList extends StatelessWidget {
  const ProfileOptionsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfileOptionsCard(
          onTap: () {
            UserRepository().getUser(currentUser?.uid ?? "");
          },
          icon: "assets/svgs/profile/profile.svg",
          text: "Profile",
          w: context.w,
        ),
        ProfileOptionsCard(
          onTap: () {},
          icon: "assets/svgs/profile/Bag_outlined.svg",
          text: "My Houses",
          w: context.w,
        ),
        ProfileOptionsCard(
          onTap: () {},
          icon: "assets/svgs/profile/Bag_outlined.svg",
          text: "My Bills",
          w: context.w,
        ),
        const Divider(
          color: Color.fromARGB(255, 238, 238, 238),
        ),
        ProfileOptionsCard(
          onTap: () {},
          icon: "assets/svgs/profile/seller.svg",
          text: "Become A Seller",
          w: context.w,
        ),
        const Divider(
          color: Color.fromARGB(255, 238, 238, 238),
        ),
        const Divider(
          color: Color.fromARGB(255, 238, 238, 238),
        ),
        ProfileOptionsCard(
          onTap: () {},
          icon: "assets/svgs/profile/wallet.svg",
          text: "Payments",
          w: context.w,
        ),
        ProfileOptionsCard(
          onTap: () {},
          icon: "assets/svgs/profile/privacy.svg",
          text: "Privacy & Security ",
          w: context.w,
        ),
        ProfileOptionsCard(
          onTap: () {},
          icon: "assets/svgs/profile/language.svg",
          text: "Language",
          w: context.w,
        ),
        ProfileOptionsCard(
          onTap: () {},
          icon: "assets/svgs/profile/region.svg",
          text: "Region",
          w: context.w,
        ),
        ProfileOptionsCard(
          onTap: () {},
          svgH: 15.h,
          svgW: 15.w,
          icon: "assets/svgs/profile/currency.svg",
          text: "Currency",
          w: context.w,
        ),
        ProfileOptionsCard(
          onTap: () {},
          icon: "assets/svgs/profile/help.svg",
          text: "Help Center",
          w: context.w,
        ),
        ProfileOptionsCard(
          onTap: () {},
          icon: "assets/svgs/profile/invite.svg",
          text: "Invite Friends",
          w: context.w,
        ),
        ProfileOptionsCard(
          onTap: () {},
          icon: "assets/svgs/profile/report.svg",
          text: "Report",
          w: context.w,
        ),
        ProfileOptionsCard(
          onTap: () {},
          icon: "assets/svgs/profile/terms.svg",
          text: "Terms & Conditions",
          w: context.w,
        ),
        ProfileOptionsCard(
          onTap: () {},
          icon: "assets/svgs/profile/rate.svg",
          text: "Rate us",
          w: context.w,
        ),
      ],
    );
  }
}

class ProfileOptionsCard extends StatelessWidget {
  const ProfileOptionsCard(
      {super.key,
      required this.w,
      this.svgH,
      this.svgW,
      required this.icon,
      required this.onTap,
      required this.text});

  final double w;
  final double? svgW;
  final double? svgH;
  final String icon;
  final String text;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: w,
        margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        child: Row(
          children: [
            SvgPicture.asset(
              icon, // Replace with your SVG asset path
              width: svgW ?? 25.w, // Adjust the width as needed
              height: svgH ?? 25.h, // Adjust the height as needed

              colorFilter:
                  ColorFilter.mode(text == "Logout" ? Colors.red : Colors.black, BlendMode.srcIn),
            ),
            const SizedBox(width: 10),
            Text(
              text,
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: text == "Logout" ? Colors.red : Colors.black,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                  ),
            ),
            const Spacer(),
            Icon(
              Icons.arrow_forward_ios_rounded, // Replace with your desired icon
              size: 24.h, // Adjust the size as needed
              color: Colors.black, // Adjust the color as needed
            ),
          ],
        ),
      ),
    );
  }
}
