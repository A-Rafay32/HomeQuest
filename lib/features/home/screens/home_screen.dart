import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:real_estate_app/app/themes/app_colors.dart';
import 'package:real_estate_app/app/themes/app_paddings.dart';
import 'package:real_estate_app/app/themes/app_text_field_themes.dart';
import 'package:real_estate_app/core/extensions/routes_extenstion.dart';
import 'package:real_estate_app/core/extensions/sizes_extensions.dart';
import 'package:real_estate_app/core/utils/loader.dart';
import 'package:real_estate_app/features/home/providers/home_providers.dart';
import 'package:real_estate_app/features/home/providers/home_state_provider.dart';
import 'package:real_estate_app/features/home/screens/add_home_screen.dart';
import 'package:real_estate_app/features/home/screens/buyer_profile_screen.dart';
import 'package:real_estate_app/features/home/screens/explore_screen.dart';
import 'package:real_estate_app/features/home/screens/favourites_screen..dart';
import 'package:real_estate_app/features/home/screens/house_detail_screen.dart';
import 'package:real_estate_app/features/home/screens/inbox_screen.dart';
import 'package:real_estate_app/features/home/screens/widgets/app_bars.dart';
import 'package:real_estate_app/features/home/screens/widgets/categories_tab_nav.dart';
import 'package:real_estate_app/features/home/screens/widgets/custom_navigation_bar.dart';
import 'package:real_estate_app/features/home/screens/widgets/featured_house_images.dart';

class HomeScreen extends ConsumerWidget {
  HomeScreen({
    super.key,
  });

  int currentScreen = 0;
  final List<Widget> screens = [
    const HomeScreenWidget(),
    const ExploreScreen(),
    const FavouriteScreen(),
    InboxScreen(),
    const BuyerProfileScreen(),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int currentScreen = ref.watch(homeStateProvider);

    return Scaffold(
      extendBody: true,
      backgroundColor: AppColors.primaryColor,
      appBar:
          PreferredSize(preferredSize: const Size.fromHeight(65), child: appBars[currentScreen]),
      body: screens[currentScreen],
      bottomNavigationBar: CustomNavigationBar(
        w: context.w,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryColor,
        onPressed: () {
          context.push(const AddRentalHomeScreen());
        },
        child: const Icon(
          Icons.add,
          color: AppColors.backgroundColor,
        ),
      ),
    );
  }
}

class HomeScreenWidget extends ConsumerStatefulWidget {
  const HomeScreenWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenWidgetState();
}

class _HomeScreenWidgetState extends ConsumerState<HomeScreenWidget> {
  @override
  Widget build(BuildContext context) {
    final streamValue = ref.watch(availableRentalHomeStreamProvider);

    return SizedBox(
      height: context.h,
      width: context.w,
      child: streamValue.when(
        error: (error, stackTrace) {
          print("error : ${error.toString()} stackTrace: $stackTrace");
          return Text("error : ${error.toString()} ", style: const TextStyle(color: Colors.white));
        },
        loading: () => const Loader(),
        data: (data) => RefreshIndicator(
          color: Colors.white,
          onRefresh: () async {
            return;
          },
          child: Stack(
            children: [
              Column(children: [
                Container(
                  height: 50,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextField(
                    cursorHeight: 25,
                    controller: TextEditingController(),
                    decoration: AppTextFieldDecorations.searchFieldDecoration,
                  ),
                ),
                AppSizes.normalY,
                CatogoriesTabNav(w: context.w),
              ]),
              Positioned(
                top: context.h * 0.17,
                child: Container(
                  height: context.h * 0.72,
                  width: context.w,
                  padding: AppPaddings.normal,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(45), topRight: Radius.circular(45)),
                  ),
                  child: Column(
                    children: [
                      AppSizes.normalY,
                      Row(
                        children: [
                          Text(
                            "Top Property",
                            style: Theme.of(context).textTheme.headlineLarge,
                          ),
                          const Spacer(),
                          const Text("View All"),
                        ],
                      ),
                      AppSizes.normalY,
                      Expanded(
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: data.length,
                            itemBuilder: (context, index) => FeaturedHouseImages(
                                  onTap: () {
                                    context.push(HouseDetailScreen(house: data[index]));
                                  },
                                  house: data[index],
                                )),
                      ),
                      AppSizes.normalY,
                      AppSizes.normalY,
                      AppSizes.normalY,
                      AppSizes.normalY,
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
