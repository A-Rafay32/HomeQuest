import 'package:flutter/material.dart';
import 'package:real_estate_app/app/themes/app_paddings.dart';
import 'package:real_estate_app/app/themes/app_text_field_themes.dart';
import 'package:real_estate_app/core/extensions/routes_extenstion.dart';
import 'package:real_estate_app/features/auth/screens/widgets/app_bar_white.dart';
import 'package:real_estate_app/features/auth/screens/widgets/button.dart';
import 'package:real_estate_app/features/auth/screens/widgets/custom_text_field.dart';
import 'package:real_estate_app/features/auth/screens/widgets/cutom_drop_down.dart';
import 'package:real_estate_app/features/auth/screens/widgets/date_picker_field.dart';

class SetupBuyerProfileScreen extends StatefulWidget {
  const SetupBuyerProfileScreen({super.key});

  @override
  State<SetupBuyerProfileScreen> createState() =>
      _SetupBuyerProfileScreenState();
}

class _SetupBuyerProfileScreenState extends State<SetupBuyerProfileScreen> {
  FocusNode nameFocus = FocusNode();
  FocusNode genderFocus = FocusNode();
  FocusNode dateFocus = FocusNode();
  FocusNode phoneFocus = FocusNode();
  FocusNode locationFocus = FocusNode();

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController locationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(55),
        child: CustomAppBar(
          onPressed: () {
            context.pop();
          },
          text: 'Fill Your Profile',
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
                child: ListView(
              children: [
                profilePhoto(),
                contentForm(context: context, w: context.w),
              ],
            ))
          ],
        ),
      ),
    );
  }

  contentForm({required context, required double w}) {
    // final context = navigatorKey!.currentContext!;
    return Padding(
      padding: const EdgeInsets.only(top: 32, left: 16, right: 16),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextField(
            onChanged: (value) {},
            controller: nameController,
            inputDecoration: AppTextFieldDecorations.genericInputDecoration(
                label: "Full Name"),
          ),
          AppSizes.normalY,
          CustomFieldDropDown(onTap: () {}, focus: genderFocus, hint: 'Gender'),
          AppSizes.normalY,
          DatePickerField(hint: 'Date of Birth', controller: dateController),
          AppSizes.normalY,
          // CountryTextField(
          //   controller: phoneController,
          //   focus: phoneFocus,
          //   onTap: () {
          //     setState(() {});
          //   },
          // ),
          AppSizes.normalY,
          CustomTextField(
            onChanged: (value) {},
            controller: locationController,
            inputDecoration: AppTextFieldDecorations.genericInputDecoration(
                label: "Location"),
          ),
          AppSizes.largeY,
          Button(press: () {}, text: "Continue")
        ],
      ),
    );
  }

  profilePhoto() {
    return Padding(
      padding: const EdgeInsets.only(
        top: 24,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 120,
            height: 120,
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  top: 0,
                  child: Container(
                    width: 120,
                    height: 120,
                    decoration: const ShapeDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/exports/Ellipse-2.png"),
                        fit: BoxFit.fill,
                      ),
                      shape: OvalBorder(),
                    ),
                  ),
                ),
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
                                image: AssetImage("assets/exports/Group.png"),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
