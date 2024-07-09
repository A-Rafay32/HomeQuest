import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_estate_app/app/themes/app_colors.dart';
import 'package:real_estate_app/app/themes/app_paddings.dart';
import 'package:real_estate_app/app/themes/app_text_field_themes.dart';
import 'package:real_estate_app/core/extensions/routes_extenstion.dart';
import 'package:real_estate_app/core/extensions/sizes_extensions.dart';
import 'package:real_estate_app/core/utils/loader.dart';
import 'package:real_estate_app/features/home/screens/widgets/inbox_card.dart';
import 'package:real_estate_app/features/home/screens/widgets/inbox_tap_bar.dart';
import 'package:real_estate_app/features/offer/model/offer.dart';
import 'package:real_estate_app/features/offer/providers/offer_provider.dart';
import 'package:real_estate_app/features/offer/screens/offer_detailed_screen.dart';

class InboxScreen extends ConsumerStatefulWidget {
  const InboxScreen({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _InboxScreenState();
}

class _InboxScreenState extends ConsumerState<InboxScreen> {
  int selectedTabIndex = 0;
  bool isInboxEmpty = false;
  List<String> tabs = ["Your Offers", "Offers for you"];

  @override
  Widget build(BuildContext context) {
    final offersByUserStream = ref.watch(offersByUserProvider);
    final offersForUserStream = ref.watch(offersForUserProvider);
    AsyncValue<List<Offer>> selectedStream = offersByUserStream;

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
          Container(
            margin: const EdgeInsets.symmetric(vertical: 8),
            height: 40,
            width: context.w,
            child: Row(
              children: List.generate(
                tabs.length,
                (index) => HomeTabNavigationItem(
                  isTagSelected: selectedTabIndex == index ? true : false,
                  onTap: () {
                    setState(() {
                      selectedTabIndex = index;
                      selectedStream == offersForUserStream
                          ? selectedStream = offersByUserStream
                          : selectedStream = offersForUserStream;
                    });
                  },
                  text: tabs[index],
                ),
              ),
            ),
          ),
          // InboxTabBar(
          //   selectedTabIndex: selectedTabIndex,
          //   w: context.w,
          // ),
          if (selectedTabIndex == 0)
            selectedStream.when(
              data: (data) => data.isEmpty
                  ? const EmptyInboxBody()
                  : SizedBox(
                      height: context.h * 0.6,
                      width: context.w,
                      child: ListView.builder(
                        physics: const ClampingScrollPhysics(),
                        itemCount: data.length,
                        itemBuilder: (context, index) => InboxCard(
                          inboxType: InboxType.Unread,
                          from: data[index].title,
                          message: data[index].statement ?? "",
                          date: data[index].createdAt.toString(),
                          onTap: () {
                            context.push(OfferDetailedScreen(
                                offerId: data[index].id ?? ""));
                          },
                        ),
                      ),
                    ),
              error: (error, stackTrace) {
                print("error : ${error.toString()} stackTrace: $stackTrace");
                return Text("error : ${error.toString()} ");
              },
              loading: () => const Loader(),
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
          "assets/svgs/empty_chat.png",
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
