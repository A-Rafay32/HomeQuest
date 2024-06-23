import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:real_estate_app/app/constants/firebase_constants.dart';
import 'package:real_estate_app/app/themes/app_paddings.dart';
import 'package:real_estate_app/core/extensions/routes_extenstion.dart';
import 'package:real_estate_app/core/extensions/sizes_extensions.dart';
import 'package:real_estate_app/core/utils/loader.dart';
import 'package:real_estate_app/features/auth/screens/widgets/app_bar_white.dart';
import 'package:real_estate_app/features/auth/screens/widgets/button.dart';
import 'package:real_estate_app/features/offer/providers/offer_provider.dart';

class OfferDetailedScreen extends ConsumerWidget {
  const OfferDetailedScreen({super.key, required this.offerId});

  final String offerId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final offerFuture = ref.watch(offerFutureProvider(offerId));

    return offerFuture.when(
        error: (error, stackTrace) {
          print("error : ${error.toString()} stackTrace: $stackTrace");
          return Text("error : ${error.toString()} ", style: const TextStyle(color: Colors.white));
        },
        loading: () => const Loader(),
        data: (data) => Scaffold(
            appBar: PreferredSize(
                preferredSize: const Size.fromHeight(65),
                child: CustomAppBar(
                    onPressed: () {
                      context.pop();
                    },
                    text: data.title)),
            body: Container(
                padding: AppPaddings.tiny,
                height: context.h,
                width: context.w,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text(data.toMap().toString()),
                      const Spacer(),
                      if (data.createdBy == currentUser?.uid)
                        Button(
                          horizontal: double.infinity,
                          press: () {},
                          text: "Withdraw ",
                        )
                      else
                        Button(
                          horizontal: double.infinity,
                          press: () {},
                          text: "Accept ",
                        ),
                    ],
                  ),
                ))));
  }
}
