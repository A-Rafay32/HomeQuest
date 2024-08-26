import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:real_estate_app/app/constants/firebase_constants.dart';
import 'package:real_estate_app/app/themes/app_paddings.dart';
import 'package:real_estate_app/app/themes/app_text_field_themes.dart';
import 'package:real_estate_app/core/extensions/routes_extenstion.dart';
import 'package:real_estate_app/core/extensions/sizes_extensions.dart';
import 'package:real_estate_app/core/utils/gen_random_ids.dart';
import 'package:real_estate_app/features/auth/model/user_details.dart';
import 'package:real_estate_app/features/auth/providers/auth_providers.dart';
import 'package:real_estate_app/features/auth/screens/widgets/app_bar_white.dart';
import 'package:real_estate_app/features/auth/screens/widgets/button.dart';
import 'package:real_estate_app/features/auth/screens/widgets/custom_text_field.dart';
import 'package:real_estate_app/features/auth/screens/widgets/date_picker_field.dart';
import 'package:real_estate_app/features/seller/model/seller.dart';
import 'package:real_estate_app/features/seller/provider/seller_notifier.dart';

class SellerFormScreen extends ConsumerStatefulWidget {
  const SellerFormScreen({super.key});

  @override
  ConsumerState<SellerFormScreen> createState() => _SellerFormScreenState();
}

class _SellerFormScreenState extends ConsumerState<SellerFormScreen> {
  final TextEditingController addressController = TextEditingController();
  final TextEditingController storeAddressController = TextEditingController();
  final TextEditingController storeNameController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController storePhoneController = TextEditingController();
  final TextEditingController storeEmailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  void initState() {
    ref.read(currentUserDocProvider).fold((left) => null, (right) {
      addressController.text = right.userDetails.address ?? "";
      nameController.text = right.userDetails.name;
      emailController.text = right.userDetails.email;
      phoneController.text = right.userDetails.phoneNum ?? "";
    });

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final sellerNotifier = ref.watch(sellerNotifierProvider);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(55),
        child: CustomAppBar(
            onPressed: () => context.pop(), text: 'Fill Your Seller Profile'),
      ),
      body: SafeArea(
          child: Column(children: [
        Expanded(
            child: ListView(children: [
          profilePhoto(),
          contentForm(ref: ref, context: context, w: context.w),
        ]))
      ])),
    );
  }

  contentForm({required WidgetRef ref, required context, required double w}) {
    return Padding(
        padding: const EdgeInsets.only(top: 32, left: 16, right: 16),
        child: Column(children: [
          CustomTextField(
              onChanged: (value) {},
              controller: storeNameController,
              inputDecoration: AppTextFieldDecorations.genericInputDecoration(
                  label: "Store Name")),
          AppSizes.normalY,
          CustomTextField(
              onChanged: (value) {},
              controller: storeEmailController,
              inputDecoration: AppTextFieldDecorations.genericInputDecoration(
                  label: "Store Email")),
          AppSizes.normalY,
          CustomTextField(
              onChanged: (value) {},
              controller: storePhoneController,
              inputDecoration: AppTextFieldDecorations.genericInputDecoration(
                  label: "Store Phone No.")),
          AppSizes.normalY,
          CustomTextField(
              onChanged: (value) {},
              controller: storeAddressController,
              inputDecoration: AppTextFieldDecorations.genericInputDecoration(
                  label: "Store Address")),
          AppSizes.normalY,
          // CustomTextField(
          //     onChanged: (value) {},
          //     controller: nameController,
          //     inputDecoration: AppTextFieldDecorations.genericInputDecoration(
          //         label: "Full Name")),
          // AppSizes.normalY,
          // CustomTextField(
          //     onChanged: (value) {},
          //     controller: emailController,
          //     inputDecoration: AppTextFieldDecorations.genericInputDecoration(
          //         label: "Email")),
          // AppSizes.normalY,
          // CustomTextField(
          //     onChanged: (value) {},
          //     controller: phoneController,
          //     inputDecoration: AppTextFieldDecorations.genericInputDecoration(
          //         label: "Personal No.")),
          // AppSizes.normalY,
          // CustomTextField(
          //     onChanged: (value) {},
          //     controller: addressController,
          //     inputDecoration: AppTextFieldDecorations.genericInputDecoration(
          //         label: "Address")),
          // AppSizes.normalY,
          AppSizes.largeY,
          Button(
              isLoading: ref.watch(sellerNotifierProvider).isLoading,
              press: () => createSeller(),
              text: "Continue"),
          AppSizes.largeY,
        ]));
  }

  void createSeller() {
    final Seller seller = Seller(
        id: currentUser?.uid ?? "",
        userDetails: UserDetails(
          address: addressController.text.trim(),
          name: nameController.text.trim(),
          email: emailController.text.trim(),
        ),
        memberSince: DateTime.now(),
        rating: 0,
        storeName: storeNameController.text.trim(),
        storephoneNum: storePhoneController.text.trim(),
        reviews: [],
        listedHouseIds: [],
        registeredOn: null,
        contracts: [],
        offers: [],
        licenseNumber: "",
        numOfHouseSold: 0,
        numOfRentedHouses: 0);

    ref.read(sellerNotifierProvider.notifier).createSeller(seller, context);
    ref.read(authNotifier.notifier).signOut();
    context.pop();
  }

  profilePhoto() {
    return Padding(
        padding: const EdgeInsets.only(top: 24),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          SizedBox(
              width: 120,
              height: 120,
              child: Stack(children: [
                Positioned(
                    left: 0,
                    top: 0,
                    child: Container(
                        width: 120,
                        height: 120,
                        decoration: const ShapeDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  "assets/svgs/profile/user_avatar.png"),
                              fit: BoxFit.fill),
                          shape: OvalBorder(),
                        ))),
                Positioned(
                    left: 80,
                    top: 80,
                    child: Container(
                        width: 36,
                        height: 36,
                        padding: const EdgeInsets.all(3.33),
                        child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              InkWell(
                                  onTap: () {},
                                  child: Container(
                                    width: 24,
                                    height: 24,
                                    decoration: const BoxDecoration(
                                        image: DecorationImage(
                                      image: AssetImage(
                                          "assets/exports/Group.png"),
                                      fit: BoxFit.fill,
                                    )),
                                  )),
                            ])))
              ]))
        ]));
  }
}
