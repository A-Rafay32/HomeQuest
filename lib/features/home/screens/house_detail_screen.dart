import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:real_estate_app/app/themes/app_paddings.dart';
import 'package:real_estate_app/core/extensions/routes_extenstion.dart';
import 'package:real_estate_app/core/extensions/sizes_extensions.dart';
import 'package:real_estate_app/core/utils/loader.dart';
import 'package:real_estate_app/features/auth/screens/widgets/button.dart';
import 'package:real_estate_app/features/home/models/rental_house.dart';
import 'package:real_estate_app/features/offer/screens/create_offers_screen.dart';
import 'package:real_estate_app/features/seller/provider/seller_provider.dart';
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
                    h: context.h, w: context.w, house: widget.house),
              ),
              SizedBox(
                height: context.h * 0.8,
                width: context.w,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
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
                      AppSizes.largeY,
                      SellerCard(sellerId: widget.house.listedBy),
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FAButton(
        title: "Request a visit",
        onTap: () =>
            context.push(CreateOfferScreen(sellerId: widget.house.listedBy)),
      ),
    );
  }
}

class SellerCard extends ConsumerWidget {
  const SellerCard({required this.sellerId, super.key});

  final String sellerId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sellerValue = ref.watch(getSellerProvider(sellerId));

    return sellerValue.when(
      data: (data) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("About Seller",
              style: Theme.of(context).textTheme.headlineSmall),
          AppSizes.smallY,
          Row(
            children: [
              const CircleAvatar(backgroundImage: NetworkImage(""), radius: 20),
              const SizedBox(width: 10),
              Text(
                data.userDetails.name,
                style: Theme.of(context).textTheme.titleLarge,
              )
            ],
          ),
        ],
      ),
      error: (error, stackTrace) =>
          Text(error.toString() + stackTrace.toString()),
      loading: () => const Loader(),
    );
  }
}
