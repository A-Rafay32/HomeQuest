import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:real_estate_app/app/constants/firebase_constants.dart';
import 'package:real_estate_app/app/themes/app_paddings.dart';
import 'package:real_estate_app/app/themes/app_text_field_themes.dart';
import 'package:real_estate_app/core/extensions/routes_extenstion.dart';
import 'package:real_estate_app/core/extensions/sizes_extensions.dart';
import 'package:real_estate_app/core/utils/gen_random_ids.dart';
import 'package:real_estate_app/features/auth/screens/widgets/app_bar_white.dart';
import 'package:real_estate_app/features/auth/screens/widgets/button.dart';
import 'package:real_estate_app/features/auth/screens/widgets/custom_text_field.dart';
import 'package:real_estate_app/features/offer/model/offer.dart';
import 'package:real_estate_app/features/offer/providers/offer_notifier.dart';

class CreateOfferScreen extends ConsumerStatefulWidget {
  const CreateOfferScreen(
      {super.key, required this.sellerId, required this.amount});

  final String sellerId;
  final double amount;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CreateOfferDialogState();
}

class _CreateOfferDialogState extends ConsumerState<CreateOfferScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController statementController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  OfferPurpose offerPurpose = OfferPurpose.visit;

  void clear() {
    titleController.clear();
    statementController.clear();
  }

  @override
  void initState() {
    amountController.text = widget.amount.toString();
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
              text: "Submit your offer")),
      body: Container(
          height: context.h,
          width: context.w,
          padding: AppPaddings.small,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
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
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: CustomTextField(
                      validator: (value) {
                        return value == null ? "Field can't be empty" : null;
                      },
                      controller: emailController,
                      inputDecoration:
                          AppTextFieldDecorations.genericInputDecoration(
                              label: "Email")),
                ),
                AppSizes.normalY,
                CustomTextField(
                    validator: (value) {
                      return value == null ? "Field can't be empty" : null;
                    },
                    controller: titleController,
                    inputDecoration:
                        AppTextFieldDecorations.genericInputDecoration(
                            label: "Title")),
                AppSizes.normalY,
                CustomTextField(
                    maxLines: 4,
                    controller: statementController,
                    inputDecoration:
                        AppTextFieldDecorations.genericInputDecoration(
                            label: "(Optional) I want to ...")),
                AppSizes.normalY,
                if (offerPurpose == OfferPurpose.buy)
                  CustomTextField(
                      keyBoardType: TextInputType.number,
                      controller: amountController,
                      inputDecoration:
                          AppTextFieldDecorations.genericInputDecoration(
                              label: "For Amount")),
                AppSizes.normalY,
                Text(
                  "I want to",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                AppSizes.tinyY,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        const Text("Visit"),
                        Radio(
                            value: OfferPurpose.visit,
                            groupValue: offerPurpose,
                            onChanged: (OfferPurpose? value) {
                              offerPurpose = value!;
                              setState(() {});
                            }),
                      ],
                    ),
                    Column(
                      children: [
                        const Text("Buy"),
                        Radio(
                            value: OfferPurpose.buy,
                            groupValue: offerPurpose,
                            onChanged: (OfferPurpose? value) {
                              offerPurpose = value!;
                              setState(() {});
                            }),
                      ],
                    ),
                  ],
                ),
                AppSizes.normalY,
                Button(
                    isLoading: ref.watch(offerNotifierProvider).isLoading,
                    press: () => _createOffer(),
                    text: "Continue"),
                AppSizes.normalY,
              ],
            ),
          )),
    );
  }

  _createOffer() {
    Offer offer = Offer(
        id: generateId(),
        title: titleController.text.trim(),
        senderName: nameController.text.trim(),
        senderEmail: emailController.text.trim(),
        createdBy: currentUser?.uid ?? "",
        sentTo: widget.sellerId,
        offerStatus: OfferStatus.pending,
        createdAt: DateTime.now(),
        offeredMoney: amountController.text.trim().isEmpty
            ? null
            : double.parse(amountController.text.trim()),
        settledMoney: null,
        statement: statementController.text.trim(),
        purpose: offerPurpose);
    ref.read(offerNotifierProvider.notifier).createOffer(offer, context);
  }
}
