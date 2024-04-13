import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_estate_app/app/themes/app_colors.dart';
import 'package:real_estate_app/app/themes/app_paddings.dart';
import 'package:real_estate_app/app/themes/app_text_field_themes.dart';
import 'package:real_estate_app/core/extensions/routes_extenstion.dart';
import 'package:real_estate_app/core/extensions/sizes_extensions.dart';
import 'package:real_estate_app/features/home/screens/chat_screen.dart';
import 'package:real_estate_app/features/home/screens/widgets/inbox_card.dart';
import 'package:real_estate_app/features/home/screens/widgets/inbox_tap_bar.dart';

class InboxScreen extends StatelessWidget {
  InboxScreen({super.key});

  int selectedTabIndex = 0;
  bool isInboxEmpty = false;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: context.h,
        width: context.w,
        padding: AppPaddings.small,
        color: AppColors.backgroundColor,
        child: SingleChildScrollView(
            child: Column(children: [
          SizedBox(
            height: 50,
            child: TextField(
              cursorHeight: 25,
              controller: TextEditingController(),
              decoration: AppTextFieldDecorations.searchFieldDecoration,
            ),
          ),
          InboxTabBar(
            selectedTabIndex: selectedTabIndex,
            w: context.w,
          ),
          if (selectedTabIndex == 0)
            (isInboxEmpty)
                ? const EmptyInboxBody()
                : InboxCard(
                    inboxType: InboxType.Unread,
                    from: "Allan Store",
                    message: "Hello, How may I help you?",
                    date: "2023/08/11",
                    onTap: () {
                      context.push(const ChatScreen(storeName: "Allan Store"));
                    },
                  )
        ])));
  }
}

class EmptyInboxBody extends StatelessWidget {
  const EmptyInboxBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: EdgeInsets.only(top: 250.h, bottom: 10),
        child: Image.asset(
          "assets/exports/empty_chat.png",
          height: 100.h,
          width: 100.h,
        ),
      ),
      Text(
        "No Messages",
        textAlign: TextAlign.left,
        style: Theme.of(context).textTheme.headlineLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.grey.shade500,
            fontSize: 22.sp),
      ),
      const SizedBox(
        height: 10,
      ),
      Text(
        "There is no chat available",
        textAlign: TextAlign.left,
        style: Theme.of(context)
            .textTheme
            .headlineLarge
            ?.copyWith(color: Colors.grey.shade600, fontSize: 17.sp),
      ),
    ]);
  }
}

class InboxSearchField extends StatelessWidget {
  const InboxSearchField({
    super.key,
    required this.w,
  });

  final double w;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 35,
        width: w * 0.9,
        decoration: BoxDecoration(
            color: Colors.grey.shade200.withOpacity(0.4),
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            const SizedBox(
              width: 10,
            ),
            SvgPicture.asset(
              "assets/exports/search.svg",
              height: 15,
              width: 15,
              colorFilter:
                  ColorFilter.mode(Colors.grey.shade600, BlendMode.srcIn),
            ),
            const SizedBox(
              width: 10,
            ),
            Container(
              height: 30,
              width: w * 0.5,
              alignment: Alignment.center,
              child: TextField(
                  cursorHeight: 12,
                  style: GoogleFonts.urbanist(
                      fontSize: 12,
                      color: AppColors.textBlackColor.withOpacity(0.8),
                      fontWeight: FontWeight.w400),
                  controller: TextEditingController(),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(bottom: 18.0),
                    border: InputBorder.none,
                    hintText: "search",
                    hintStyle: Theme.of(context)
                        .textTheme
                        .labelSmall
                        ?.copyWith(color: Colors.grey.shade600),
                  )),
            ),
          ],
        ));
  }
}
