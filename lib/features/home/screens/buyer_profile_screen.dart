import 'package:either_dart/either.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:real_estate_app/app/themes/app_colors.dart';
import 'package:real_estate_app/core/extensions/routes_extenstion.dart';
import 'package:real_estate_app/features/auth/exceptions/auth_exceptions.dart';
import 'package:real_estate_app/features/auth/providers/auth_notifier.dart';
import 'package:real_estate_app/features/auth/providers/auth_notifier_provider.dart';
import 'package:real_estate_app/features/auth/screens/widgets/app_bar_white.dart';
import 'package:real_estate_app/features/auth/screens/widgets/button.dart';

class BuyerProfileScreen extends StatelessWidget {
  const BuyerProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double w = MediaQuery.sizeOf(context).width;
    final double h = MediaQuery.sizeOf(context).height;
    ScreenUtil.init(context, designSize: const Size(428, 926));

    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(64),
          child: CustomAppBar(
            onPressed: () {
              context.pop();
            },
            text: "Profile",
          ),
        ),
        body: SafeArea(
            child: Container(
                height: h,
                width: w,
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
                child: SingleChildScrollView(
                  child: Column(children: [
                    UserProfileImageWidget(
                      h: h,
                      w: w,
                      numOfFav: 118,
                      numOfOrders: 28,
                      userName: "Jhon Doe",
                      userImage: "assets/svgs/profile/user_avatar.png",
                    ),
                    ProfileOptionsCard(
                      onTap: () {},
                      icon: "assets/svgs/profile/profile.svg",
                      text: "Profile",
                      w: w,
                    ),
                    ProfileOptionsCard(
                      onTap: () {},
                      icon: "assets/svgs/profile/Bag_outlined.svg",
                      text: "My Orders",
                      w: w,
                    ),
                    ProfileOptionsCard(
                      onTap: () {},
                      icon: "assets/svgs/profile/Chat.svg",
                      text: "Inbox",
                      w: w,
                    ),
                    ProfileOptionsCard(
                      onTap: () {},
                      icon: "assets/svgs/profile/heart.svg",
                      text: "Saved",
                      w: w,
                    ),
                    ProfileOptionsCard(
                      onTap: () {},
                      icon: "assets/svgs/profile/notification.svg",
                      text: "Notification",
                      w: w,
                    ),
                    const Divider(
                      color: Color.fromARGB(255, 238, 238, 238),
                    ),
                    ProfileOptionsCard(
                      onTap: () {},
                      icon: "assets/svgs/profile/seller.svg",
                      text: "Become A Seller",
                      w: w,
                    ),
                    const Divider(
                      color: Color.fromARGB(255, 238, 238, 238),
                    ),
                    ProfileOptionsCard(
                      onTap: () {},
                      icon: "assets/svgs/profile/diamond.svg",
                      text: "Membership Plans",
                      w: w,
                    ),
                    const Divider(
                      color: Color.fromARGB(255, 238, 238, 238),
                    ),
                    ProfileOptionsCard(
                      onTap: () {},
                      icon: "assets/svgs/profile/wallet.svg",
                      text: "Payments",
                      w: w,
                    ),
                    ProfileOptionsCard(
                      onTap: () {},
                      icon: "assets/svgs/profile/privacy.svg",
                      text: "Privacy & Security ",
                      w: w,
                    ),
                    ProfileOptionsCard(
                      onTap: () {},
                      icon: "assets/svgs/profile/language.svg",
                      text: "Language",
                      w: w,
                    ),
                    ProfileOptionsCard(
                      onTap: () {},
                      icon: "assets/svgs/profile/region.svg",
                      text: "Region",
                      w: w,
                    ),
                    ProfileOptionsCard(
                      onTap: () {},
                      svgH: 15.h,
                      svgW: 15.w,
                      icon: "assets/svgs/profile/currency.svg",
                      text: "Currency",
                      w: w,
                    ),
                    ProfileOptionsCard(
                      onTap: () {},
                      icon: "assets/svgs/profile/help.svg",
                      text: "Help Center",
                      w: w,
                    ),
                    ProfileOptionsCard(
                      onTap: () {},
                      icon: "assets/svgs/profile/invite.svg",
                      text: "Invite Friends",
                      w: w,
                    ),
                    ProfileOptionsCard(
                      onTap: () {},
                      icon: "assets/svgs/profile/report.svg",
                      text: "Report",
                      w: w,
                    ),
                    ProfileOptionsCard(
                      onTap: () {},
                      icon: "assets/svgs/profile/terms.svg",
                      text: "Terms & Conditions",
                      w: w,
                    ),
                    ProfileOptionsCard(
                      onTap: () {},
                      icon: "assets/svgs/profile/rate.svg",
                      text: "Rate us",
                      w: w,
                    ),
                    Consumer(builder: (context, ref, child) {
                      return ProfileOptionsCard(
                        onTap: () {
                          showModalBottomSheet(
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(240),
                                    topRight: Radius.circular(240))),
                            constraints: BoxConstraints(maxHeight: 300.h),
                            context: context,
                            builder: (context) {
                              return LogOutBottomSheet(
                                  message: "",
                                  abortButtonText: "Cancel",
                                  continueButton: () {
                                    Future<
                                            Either<FirebaseAuthException,
                                                Success>> result =
                                        ref.read(authNotifier).signOut();
                                    result.fold((left) {
                                      print("exception :${left.message}");
                                    }, (right) {
                                      print("success${right.message}");
                                    });
                                  },
                                  continueButtonText: "Yes, Logout",
                                  subtitle: "Are you sure you want to log out?",
                                  title: "Logout",
                                  abortButton: () {},
                                  context: context,
                                  w: w);
                            },
                          );
                        },
                        icon: "assets/svgs/profile/logout.svg",
                        text: "Logout",
                        w: w,
                      );
                    }),
                  ]),
                ))));
  }
}

class UserProfileImageWidget extends StatelessWidget {
  const UserProfileImageWidget({
    super.key,
    required this.h,
    required this.w,
    required this.numOfOrders,
    required this.numOfFav,
    required this.userName,
    required this.userImage,
  });

  final double h;
  final double w;
  final int numOfOrders;
  final int numOfFav;
  final String userName;
  final String userImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      // height: h * 0.45,
      decoration: const BoxDecoration(
          // color: Colors.red.shade100,
          ),
      width: w,
      child: Column(
        children: [
          CircleAvatar(
              backgroundColor: Colors.white,
              radius: 50,
              backgroundImage: Image.asset(userImage).image),
          const SizedBox(
            height: 20,
          ),
          Text(
            userName,
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  fontSize: 32.sp,
                  color: AppColors.textBlackColor,
                  fontWeight: FontWeight.w700,
                ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text(
                    numOfOrders.toString(),
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                          fontSize: 32.sp,
                          color: AppColors.textBlackColor,
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Total Orders",
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textBlackColor,
                        ),
                  ),
                ],
              ),
              Container(
                height: 70.h,
                width: 1,
                color: const Color.fromARGB(255, 238, 238, 238),
              ),
              Column(
                children: [
                  Text(
                    numOfFav.toString(),
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                          fontSize: 32.sp,
                          color: AppColors.textBlackColor,
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Favourites",
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textBlackColor,
                        ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 24.h,
          ),
          const Divider(
            color: Color.fromARGB(255, 238, 238, 238),
          ),
        ],
      ),
    );
  }
}

class LogOutBottomSheet extends StatelessWidget {
  const LogOutBottomSheet(
      {super.key,
      required this.context,
      required this.w,
      required this.abortButton,
      required this.abortButtonText,
      required this.continueButton,
      required this.continueButtonText,
      required this.subtitle,
      required this.title,
      required this.message});

  final BuildContext context;
  final double w;
  final String title;
  final String subtitle;
  final String message;
  final String abortButtonText;
  final String continueButtonText;
  final Function() abortButton;
  final Function() continueButton;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50), color: Colors.white),
      padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 15.h),
      child: Column(
        children: [
          SizedBox(
            height: 10.h,
          ),
          Container(
            height: 2,
            width: 40,
            color: Colors.grey.shade200,
          ),
          SizedBox(
            height: 30.h,
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                fontSize: 24.sp,
                color: Colors.red,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20.h),
          Divider(
            color: Colors.grey.shade100,
          ),
          SizedBox(height: 30.h),
          Text(
            subtitle,
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: AppColors.textBlackColor,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                ),
          ),
          SizedBox(height: 12.h),
          Expanded(child: Container()),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Button(
                press: abortButton,
                text: "Cancel",
              ),
              Button(
                press: continueButton,
                text: "Continue",
              ),
            ],
          ),
          SizedBox(height: 10.h),
        ],
      ),
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
        // color: Colors.green.shade100,
        margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        child: Row(
          children: [
            // SVG asset on the left end
            SvgPicture.asset(
              icon, // Replace with your SVG asset path
              width: svgW ?? 25.w, // Adjust the width as needed
              height: svgH ?? 25.h, // Adjust the height as needed

              colorFilter: ColorFilter.mode(
                  text == "Logout" ? Colors.red : Colors.black,
                  BlendMode.srcIn),
            ),
            const SizedBox(width: 10), // Add spacing between SVG and text

            // Text in the middle
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
