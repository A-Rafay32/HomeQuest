import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_estate_app/app/themes/app_colors.dart';
import 'package:real_estate_app/app/themes/app_paddings.dart';
import 'package:real_estate_app/core/extensions/routes_extenstion.dart';
import 'package:real_estate_app/core/extensions/sizes_extensions.dart';
import 'package:real_estate_app/core/extensions/snackbar_ext.dart';
import 'package:real_estate_app/core/utils/types.dart';
import 'package:real_estate_app/features/auth/providers/auth_notifier_provider.dart';
import 'package:real_estate_app/features/home/providers/home_state_provider.dart';
import 'package:real_estate_app/features/home/screens/widgets/log_out_bottom_sheet.dart';
import 'package:real_estate_app/features/home/screens/widgets/profile_options_list.dart';
import 'package:real_estate_app/features/home/screens/widgets/user_avatar.dart';

class BuyerProfileScreen extends ConsumerWidget {
  const BuyerProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
        height: context.h,
        width: context.w,
        color: AppColors.backgroundColor,
        padding: AppPaddings.small,
        child: SingleChildScrollView(
          child: Column(children: [
            const UserAvatar(
              userName: "Jhon Doe",
              userImage: "assets/svgs/profile/user_avatar.png",
            ),
            AppSizes.largeY,
            const ProfileOptionsList(),
            ProfileOptionsCard(
              onTap: () {
                showModalBottomSheet(
                  constraints: BoxConstraints(maxHeight: 300.h),
                  context: context,
                  builder: (context) {
                    return LogOutBottomSheet(
                        message: "",
                        abortButtonText: "Cancel",
                        continueButton: () => _signOut(ref, context),
                        continueButtonText: "Yes, Logout",
                        subtitle: "Are you sure you want to log out?",
                        title: "Logout",
                        abortButton: () {
                          context.pop();
                        },
                        context: context,
                        w: context.w);
                  },
                );
              },
              icon: "assets/svgs/profile/logout.svg",
              text: "Logout",
              w: context.w,
            ),
            AppSizes.largeY,
            AppSizes.largeY,
          ]),
        ));
  }

  void _signOut(WidgetRef ref, BuildContext context) async {
    Either0 result =
        await ref.read(authNotifier.notifier).signOut().whenComplete(() {
      context.pop();
      ref.read(homeStateProvider.notifier).state = 0;
    });
    result.fold((left) {
      context.showSnackBar(left.message.toString());
    }, (right) {
      print("success${right.message}");
    });
  }
}
