import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:real_estate_app/app/themes/app_paddings.dart';
import 'package:real_estate_app/app/themes/app_text_field_themes.dart';
import 'package:real_estate_app/core/extensions/routes_extenstion.dart';
import 'package:real_estate_app/core/extensions/sizes_extensions.dart';
import 'package:real_estate_app/core/utils/gen_random_ids.dart';
import 'package:real_estate_app/features/auth/providers/auth_providers.dart';
import 'package:real_estate_app/features/auth/screens/widgets/app_bar_white.dart';
import 'package:real_estate_app/features/auth/screens/widgets/button.dart';
import 'package:real_estate_app/features/auth/screens/widgets/custom_field_drop_down.dart';
import 'package:real_estate_app/features/auth/screens/widgets/custom_text_field.dart';
import 'package:real_estate_app/features/auth/screens/widgets/date_picker_field.dart';
import 'package:real_estate_app/features/bill/model/bill.dart';
import 'package:real_estate_app/features/bill/provider/bill_notifier.dart';
import 'package:real_estate_app/features/offer/providers/offer_notifier.dart';
import 'package:real_estate_app/features/seller/provider/seller_provider.dart';

class CreateBillScreen extends ConsumerStatefulWidget {
  const CreateBillScreen({
    super.key,
    required this.sellerId,
    this.tenantId,
    // required this.rentAmount,
  });

  final String sellerId;
  final String? tenantId;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CreateBillScreenState();
}

class _CreateBillScreenState extends ConsumerState<CreateBillScreen> {
  TextEditingController amountController = TextEditingController();
  TextEditingController ownerController = TextEditingController();
  TextEditingController tenantController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  BillCategory selectedBillCategory = BillCategory.rent;

  @override
  Widget build(BuildContext context) {
    final ownerValue = ref.watch(getSellerProvider(widget.sellerId));
    final tenantValue =
        ref.watch((getUserProvider(widget.tenantId.toString())));

    ownerValue.when(
      data: (data) => ownerController.text = data.userDetails.name,
      error: (error, stackTrace) => null,
      loading: () => "......",
    );

    tenantValue.when(
      data: (data) => tenantController.text = data.userDetails.name,
      error: (error, stackTrace) => null,
      loading: () => "......",
    );

    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(65),
          child: CustomAppBar(
              onPressed: () {
                context.pop();
              },
              text: "Add Bills")),
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
                    controller: ownerController,
                    inputDecoration:
                        AppTextFieldDecorations.genericInputDecoration(
                            label: "Owner")),
                AppSizes.normalY,
                CustomTextField(
                    validator: (value) {
                      return value == null ? "Field can't be empty" : null;
                    },
                    controller: tenantController,
                    inputDecoration:
                        AppTextFieldDecorations.genericInputDecoration(
                            label: "Tenant")),
                AppSizes.normalY,
                CustomTextField(
                    validator: (value) {
                      return value == null ? "Field can't be empty" : null;
                    },
                    controller: amountController,
                    inputDecoration:
                        AppTextFieldDecorations.genericInputDecoration(
                            label: "Amount")),
                AppSizes.normalY,
                CustomFieldDropDown(
                  onChanged: (String? value) {},
                  hint: "Bill Category",
                  dropdownItems: BillCategory.values
                      .map((e) => e.name.toString())
                      .toList(),
                  selectedValue: BillCategory.rent.name,
                ),
                AppSizes.normalY,
                DatePickerField(
                    label: "Due Date",
                    hint:
                        "${DateTime.now().day}/${DateTime.now().month}/ ${DateTime.now().year}",
                    controller: dateController),
                AppSizes.normalY,
                AppSizes.normalY,
                AppSizes.normalY,
                AppSizes.normalY,
                Button(
                    isLoading: ref.watch(offerNotifierProvider).isLoading,
                    press: () => _createBill(),
                    text: "Continue"),
                AppSizes.normalY,
              ],
            ),
          )),
    );
  }

  _createBill() {
    // if (double.parse(amountController.text.toString()) > 111 && ) {
    Bill bill = Bill(
        id: generateId(),
        houseId: widget.sellerId,
        amount: double.parse(amountController.text.trim()),
        category: selectedBillCategory,
        dateCreated: DateTime.now(),
        dueDate: DateTime.now(),
        paidDate: DateTime.now(),
        status: BillStatus.due,
        tenantId: widget.tenantId!);
    ref.read(billNotifierProvider.notifier).createBill(bill, context);
    // }
  }
}
