import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:real_estate_app/app/constants/app_images.dart';
import 'package:real_estate_app/app/themes/app_paddings.dart';
import 'package:real_estate_app/app/themes/app_text_field_themes.dart';
import 'package:real_estate_app/core/extensions/routes_extenstion.dart';
import 'package:real_estate_app/core/extensions/sizes_extensions.dart';
import 'package:real_estate_app/core/extensions/snackbar_ext.dart';
import 'package:real_estate_app/features/auth/providers/auth_providers.dart';
import 'package:real_estate_app/features/auth/screens/widgets/app_bar_white.dart';
import 'package:real_estate_app/features/auth/screens/widgets/button.dart';
import 'package:real_estate_app/features/auth/screens/widgets/custom_text_field.dart';
import 'package:real_estate_app/features/home/models/rental_house.dart';
import 'package:real_estate_app/features/home/providers/rental_home_notifier.dart';

class AddRentalHomeScreen extends ConsumerWidget {
  AddRentalHomeScreen({super.key});

  TextEditingController nameController = TextEditingController();
  TextEditingController bathroomQtyController = TextEditingController();
  TextEditingController roomQtyController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController sizeController = TextEditingController();
  TextEditingController rentController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(65),
          child: CustomAppBar(
              onPressed: () {
                context.pop();
              },
              text: "Add Home")),
      body: SizedBox(
          height: context.h,
          width: context.w,
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomTextField(
                    validator: (value) {
                      return value == null ? "Field can't be empty" : null;
                    },
                    controller: nameController,
                    inputDecoration:
                        AppTextFieldDecorations.genericInputDecoration(
                            label: "Name")),
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

                // SizedBox(
                //   height: 100,
                //   width: context.w,
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //     children: [

                //     ],
                //   ),
                // ),
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
                    controller: rentController,
                    inputDecoration:
                        AppTextFieldDecorations.genericInputDecoration(
                            label: "\$ Rent Per Month ")),
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
                Button(
                    isLoading: ref.watch(rentalHomeNotifierProvider).isLoading,
                    press: () => addHouse(ref, context),
                    text: "Add House"),
                AppSizes.largeY,
              ],
            ),
          )),
    );
  }

  void addHouse(WidgetRef ref, BuildContext context) async {
    String? ownerId = ref.read(currentUserProvider)?.uid;
    print(ownerId);
    RentalHouse rentalhouse = RentalHouse(
        bathroomQty: int.parse(bathroomQtyController.text.trim().toString()),
        description: descriptionController.text.trim(),
        roomQty: int.parse(roomQtyController.text.trim().toString()),
        sizeInFeet: int.parse(sizeController.text.trim().toString()),
        address: addressController.text.trim(),
        constructedOn: DateTime.now(),
        ownerId: ownerId,
        images: AppImages.houseImages,
        isFurnished: true,
        rentPerMonth: double.parse(rentController.text.trim().toString()));
    final result = await ref
        .read(rentalHomeNotifierProvider.notifier)
        .addRentalHouse(rentalHouse: rentalhouse, ownerId: ownerId);
    result.fold((left) {
      context.showSnackBar(left.message.toString());
    }, (right) {
      context.showSnackBar(right.message.toString());
    });
  }
}
