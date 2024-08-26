import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_estate_app/app/themes/app_colors.dart';
import 'package:real_estate_app/features/home/screens/widgets/custom_navigation_bar.dart';
import 'package:real_estate_app/features/seller/screen/widgets/store_performance_card.dart';

class SellerStoreScreen extends StatelessWidget {
  const SellerStoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double w = MediaQuery.sizeOf(context).width;
    final double h = MediaQuery.sizeOf(context).height;
    ScreenUtil.init(context, designSize: const Size(428, 926));
    return Scaffold(
      bottomNavigationBar: CustomNavigationBar(w: w),
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: SizedBox(
                width: w,
                child: SingleChildScrollView(
                    child: Column(children: [
                  // HomeAppBar(
                  //     w: w * 0.7,
                  //     onSearchTap: () {
                  //       context.push(const SearchScreen());
                  //     }),
                  StorePerformanceWidget(
                    onTap: () {},
                    title: "Store Performance",
                    allowButton: false,
                    children: const [
                      PerformanceSection(
                        title: 'Earned',
                        value: '\$ 1375.2',
                        valueColor: AppColors.primaryColor,
                      ),
                      PerformanceSection(
                        title: 'Views',
                        value: '4.3K',
                        valueColor: AppColors.primaryColor,
                      ),
                      PerformanceSection(
                          title: 'Saved',
                          value: '47',
                          valueColor: AppColors.primaryColor),
                    ],
                  ),
                  StorePerformanceWidget(
                    onTap: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: (context) => const MyProductsScreen(),
                      //     ));
                    },
                    title: "My Houses",
                    allowButton: true,
                    children: const [
                      PerformanceSection(
                        title: 'Sell',
                        value: '25',
                        valueColor: AppColors.primaryColor,
                      ),
                      PerformanceSection(
                        title: 'Rent',
                        value: '0',
                        valueColor: AppColors.primaryColor,
                      ),
                      PerformanceSection(
                        title: 'In Process',
                        value: '0',
                        valueColor: AppColors.primaryColor,
                      ),
                    ],
                  ),
                  StorePerformanceWidget(
                    onTap: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: (context) => const SellerOrdersScreen(),
                      //     ));
                    },
                    title: "Contracts",
                    allowButton: false,
                    children: const [
                      PerformanceSection(
                        title: 'Sold',
                        value: '12',
                        valueColor: AppColors.primaryColor,
                      ),
                      PerformanceSection(
                        title: 'Rented',
                        value: '0',
                        valueColor: AppColors.primaryColor,
                      ),
                      PerformanceSection(
                        title: 'Swapped',
                        value: '0',
                        valueColor: AppColors.primaryColor,
                      ),
                      PerformanceSection(
                        title: 'Returned',
                        value: '1',
                        valueColor: AppColors.primaryColor,
                      ),
                    ],
                  ),

                  // PremiumOfferCard(
                  //   textColor: const Color.fromARGB(255, 88, 76, 244),
                  //   w: w,
                  //   gradient: const LinearGradient(
                  //       begin: Alignment.centerRight,
                  //       end: Alignment.centerLeft,
                  //       colors: [
                  //         Color.fromARGB(255, 88, 76, 244),
                  //         Color.fromARGB(255, 115, 105, 248)
                  //       ]),
                  // ),
                  // const SwapOrderView(),
                ])))),
      ),
    );
  }
}
