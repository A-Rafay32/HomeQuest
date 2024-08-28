import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:real_estate_app/app/constants/app_images.dart';
import 'package:real_estate_app/app/constants/firebase_constants.dart';
import 'package:real_estate_app/app/themes/app_paddings.dart';
import 'package:real_estate_app/app/themes/app_text_field_themes.dart';
import 'package:real_estate_app/core/enums/house_status.dart';
import 'package:real_estate_app/core/enums/house_type.dart';
import 'package:real_estate_app/core/extensions/routes_extenstion.dart';
import 'package:real_estate_app/core/extensions/sizes_extensions.dart';
import 'package:real_estate_app/core/extensions/snackbar_ext.dart';
import 'package:real_estate_app/core/utils/gen_random_ids.dart';
import 'package:real_estate_app/features/auth/providers/auth_providers.dart';
import 'package:real_estate_app/features/auth/screens/widgets/app_bar_white.dart';
import 'package:real_estate_app/features/auth/screens/widgets/button.dart';
import 'package:real_estate_app/features/auth/screens/widgets/custom_field_drop_down.dart';
import 'package:real_estate_app/features/auth/screens/widgets/custom_text_field.dart';
import 'package:real_estate_app/features/home/models/house_details.dart';
import 'package:real_estate_app/features/home/models/house_location.dart';
import 'package:real_estate_app/features/home/models/rental_house.dart';
import 'package:real_estate_app/features/home/models/seller_house.dart';
import 'package:real_estate_app/features/home/providers/home_providers.dart';
import 'package:real_estate_app/features/home/providers/seller_home_notifier.dart';
import 'package:real_estate_app/features/seller/provider/seller_notifier.dart';

enum addHouseEnum { Rental, Seller }

class AddRentalHomeScreen extends ConsumerStatefulWidget {
  const AddRentalHomeScreen({super.key});

  @override
  ConsumerState<AddRentalHomeScreen> createState() =>
      _AddRentalHomeScreenState();
}

class _AddRentalHomeScreenState extends ConsumerState<AddRentalHomeScreen> {
  TextEditingController houseNameController = TextEditingController();
  TextEditingController bathroomQtyController = TextEditingController();
  TextEditingController roomQtyController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController sizeController = TextEditingController();
  TextEditingController rentController = TextEditingController();
  TextEditingController purchasePriceController = TextEditingController();
  TextEditingController mortgageCostController = TextEditingController();
  TextEditingController mortgageInterestController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  String selectedValue = addHouseEnum.Seller.name;

  void clearControllers() {
    houseNameController.clear();
    bathroomQtyController.clear();
    roomQtyController.clear();
    addressController.clear();
    sizeController.clear();
    rentController.clear();
    descriptionController.clear();
    mortgageCostController.clear();
    purchasePriceController.clear();
    mortgageInterestController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(65),
          child: CustomAppBar(
              onPressed: () {
                context.pop();
              },
              text: "Add ${selectedValue.toString()} Home")),
      body: SizedBox(
          height: context.h,
          width: context.w,
          child: SingleChildScrollView(
            child: Column(
              children: [
                // CustomFieldDropDown(
                //     hint: "Rental",
                //     selectedValue: selectedValue,
                //     onChanged: (String? value) {
                //       selectedValue = value!;
                //       setState(() {});
                //     },
                //     dropdownItems:
                //         addHouseEnum.values.map((e) => e.toString()).toList()),
                CustomTextField(
                    validator: (value) {
                      return value == null ? "Field can't be empty" : null;
                    },
                    controller: houseNameController,
                    inputDecoration:
                        AppTextFieldDecorations.genericInputDecoration(
                            label: "House Name")),
                AppSizes.normalY,
                CustomTextField(
                    validator: (value) {
                      return value == null ? "Field can't be empty" : null;
                    },
                    controller: addressController,
                    inputDecoration:
                        AppTextFieldDecorations.genericInputDecoration(
                            label: "Address")),
                AppSizes.normalY,
                CustomTextField(
                    validator: (value) {
                      return value == null ? "Field can't be empty" : null;
                    },
                    controller: bathroomQtyController,
                    inputDecoration:
                        AppTextFieldDecorations.genericInputDecoration(
                            label: "No. of Bathrooms")),
                AppSizes.normalY,
                CustomTextField(
                    validator: (value) {
                      return value == null ? "Field can't be empty" : null;
                    },
                    controller: sizeController,
                    inputDecoration:
                        AppTextFieldDecorations.genericInputDecoration(
                            label: "Size in feet")),
                AppSizes.normalY,
                CustomTextField(
                    validator: (value) {
                      return value == null ? "Field can't be empty" : null;
                    },
                    controller: roomQtyController,
                    inputDecoration:
                        AppTextFieldDecorations.genericInputDecoration(
                            label: "No. of Rooms")),
                AppSizes.normalY,
                CustomTextField(
                    validator: (value) {
                      return value == null ? "Field can't be empty" : null;
                    },
                    controller: descriptionController,
                    inputDecoration:
                        AppTextFieldDecorations.genericInputDecoration(
                            label: "Description")),
                AppSizes.normalY,
                selectedValue == addHouseEnum.Rental.name
                    ? Column(
                        children: [
                          CustomTextField(
                              validator: (value) {
                                return value == null
                                    ? "Field can't be empty"
                                    : null;
                              },
                              controller: rentController,
                              inputDecoration: AppTextFieldDecorations
                                  .genericInputDecoration(
                                      label: "\$ Rent Per Month ")),
                          AppSizes.normalY,
                        ],
                      )
                    : Column(children: [
                        CustomTextField(
                            validator: (value) {
                              return value == null
                                  ? "Field can't be empty"
                                  : null;
                            },
                            controller: purchasePriceController,
                            inputDecoration:
                                AppTextFieldDecorations.genericInputDecoration(
                                    label: "\$ Purchase Price ")),
                        AppSizes.normalY,
                        CustomTextField(
                            validator: (value) {
                              return value == null
                                  ? "Field can't be empty"
                                  : null;
                            },
                            controller: mortgageCostController,
                            inputDecoration:
                                AppTextFieldDecorations.genericInputDecoration(
                                    label: "\$ Mortgage/month ")),
                        AppSizes.normalY,
                        CustomTextField(
                            validator: (value) {
                              return value == null
                                  ? "Field can't be empty"
                                  : null;
                            },
                            controller: mortgageInterestController,
                            inputDecoration:
                                AppTextFieldDecorations.genericInputDecoration(
                                    label: "\$ Interest/year ")),
                        AppSizes.normalY,
                      ]),
                AppSizes.normalY,
                Button(
                    isLoading: ref.watch(rentalHomeNotifierProvider).isLoading,
                    press: () => selectedValue == addHouseEnum.Rental.name
                        ? addRentalHouse(ref, context)
                        : addSellerHouse(ref, context),
                    text: "Add House"),
                AppSizes.largeY,
              ],
            ),
          )),
    );
  }

  void addSellerHouse(WidgetRef ref, BuildContext context) {
    String? ownerId = ref.read(currentUserProvider)?.uid;
    String? ownerName = ref.read(currentUserProvider)?.displayName;

    SellerHouse sellerHouse = SellerHouse(
        id: generateId(),
        houseDetails: HouseDetails(
          balconyQty: 2,
          bathroomQty: 3,
          floors: 1,
          hasGarage: true,
          hasTerrace: false,
          kitchen: 1,
          livingRoomQty: 1,
          parkingSpaces: 1,
          roomQty: 3,
          sizeInFeet: 100,
        ),
        houseLocation: HouseLocation(
          address: addressController.text.trim(),
        ),
        name: houseNameController.text.trim().toString(),
        description: descriptionController.text.trim(),
        constructedOn: DateTime.now(),
        ownerId: ownerId,
        images: AppImages.houseImages,
        isFurnished: true,
        houseStatus: HouseStatus.Sale,
        houseType: HouseType.House,
        isAvailable: true,
        isFeatured: false,
        listedBy: currentUser?.uid ?? "",
        isApproved: true,
        propertyTax: 300,
        boughtFrom: null,
        currentOwner: ownerName.toString(),
        listedOn: DateTime.now(),
        purchasePrice: 10000000,
        monthlyMortgageCost: 1999,
        mortgageInterest: 0.2

        // purchasePrice: double.parse(purchasePriceController.toString()),
        // monthlyMortgageCost: double.parse(mortgageCostController.toString()),
        // mortgageInterest: double.parse(mortgageInterestController.toString())
        );
    ref
        .read(sellerHomeNotifierProvider.notifier)
        .addSellerHouse(sellerHouse, context);
    clearControllers();
  }

  void addRentalHouse(WidgetRef ref, BuildContext context) async {
    String? ownerId = ref.read(currentUserProvider)?.uid;
    print(ownerId);
    RentalHouse rentalhouse = RentalHouse(
        id: "",
        houseDetails: HouseDetails(
          balconyQty: 2,
          bathroomQty: 3,
          floors: 1,
          hasGarage: true,
          hasTerrace: false,
          kitchen: 1,
          livingRoomQty: 1,
          parkingSpaces: 1,
          roomQty: 3,
          sizeInFeet: 100,
        ),
        houseLocation: HouseLocation(
          address: addressController.text.trim(),
        ),
        name: houseNameController.text.trim().toString(),
        description: descriptionController.text.trim(),
        constructedOn: DateTime.now(),
        ownerId: ownerId,
        images: AppImages.houseImages,
        isFurnished: true,
        houseStatus: HouseStatus.Rent,
        houseType: HouseType.House,
        isAvailable: true,
        isFeatured: false,
        listedBy: currentUser?.uid ?? "",
        isApproved: true,
        propertyTax: 300,
        rentPerMonth: double.parse(rentController.text.trim()));
    ref.read(rentalHomeNotifierProvider.notifier).addRentalHouse(
        rentalHouse: rentalhouse, ownerId: ownerId, context: context);
    clearControllers();
  }
}
