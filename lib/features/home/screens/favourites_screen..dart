import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_estate_app/app/themes/app_colors.dart';
import 'package:real_estate_app/app/themes/app_paddings.dart';
import 'package:real_estate_app/core/extensions/sizes_extensions.dart';
import 'package:real_estate_app/core/utils/loader.dart';
import 'package:real_estate_app/features/auth/providers/user_notifier.dart';
import 'package:real_estate_app/features/home/screens/widgets/popular_houses_card.dart';

class FavouriteScreen extends ConsumerStatefulWidget {
  const FavouriteScreen({super.key});

  @override
  ConsumerState<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends ConsumerState<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    final favourites = ref.watch(favouritesProvider);

    return Container(
        color: AppColors.backgroundColor,
        height: context.h,
        width: context.w,
        padding: AppPaddings.small,
        child: SingleChildScrollView(
            child: favourites.when(
          loading: () => const Loader(),
          error: (error, stackTrace) => Text(
            error.toString(),
            style: const TextStyle(color: Colors.white),
          ),
          data: (data) => Column(children: [
            AppSizes.normalY,
            GridView.builder(
                physics: const ClampingScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 10,
                    childAspectRatio: 0.8.h),
                itemCount: data.right.length,
                itemBuilder: (context, index) {
                  Map house = data.right[index].data() as Map;
                  return HousesCardWidget(
                    onTapFav: () {},
                    image: house["images"][0] ?? "",
                    address: house["address"] ?? "",
                    name: house["name"] ?? "",
                    price: house["price"] ?? "",
                  );
                }),
          ]),
        )));
  }

  // Padding EmptyCollectionScreen(double w, BuildContext context) {
  //   return Padding(
  //     padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
  //     child: Column(
  //       children: [
  //         const SizedBox(
  //           height: 60,
  //         ),
  //         Image.asset(
  //           "assets/exports/empty.png",
  //           height: 200,
  //           width: w * 0.6,
  //         ),
  //         const SizedBox(
  //           height: 20,
  //         ),
  //         Text(
  //           "Empty List",
  //           style: Theme.of(context).textTheme.headlineMedium?.copyWith(
  //                 color: AppColors.textBlackColor,
  //                 fontSize: 20,
  //                 fontWeight: FontWeight.w700,
  //               ),
  //         ),
  //         const SizedBox(
  //           height: 20,
  //         ),
  //         Padding(
  //           padding: const EdgeInsets.symmetric(horizontal: 10),
  //           child: Text(
  //             "You don’t have on going orders at this time. Start searching for items now by clicking the button below.",
  //             textAlign: TextAlign.center,
  //             style: Theme.of(context).textTheme.labelMedium?.copyWith(
  //                   color: AppColors.textBlackColor,
  //                 ),
  //           ),
  //         ),
  //         const SizedBox(
  //           height: 20,
  //         ),
  //         CustomButton(
  //           width: w * 0.7,
  //           text: "Search Now",
  //           textColor: AppColors.textWhiteColor,
  //           paddingVert: 15,
  //           backgroundColor: AppColors.orangePrimaryColor,
  //           onTap: () {},
  //           textBold: true,
  //         )
  //       ],
  //     ),
  //   );
  // }
}
