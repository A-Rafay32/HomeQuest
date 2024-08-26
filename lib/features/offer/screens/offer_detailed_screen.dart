import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:real_estate_app/app/constants/firebase_constants.dart';
import 'package:real_estate_app/app/themes/app_paddings.dart';
import 'package:real_estate_app/core/extensions/routes_extenstion.dart';
import 'package:real_estate_app/core/extensions/sizes_extensions.dart';
import 'package:real_estate_app/core/utils/loader.dart';
import 'package:real_estate_app/features/auth/screens/widgets/app_bar_white.dart';
import 'package:real_estate_app/features/auth/screens/widgets/button.dart';
import 'package:real_estate_app/features/home/screens/chat_screen.dart';
import 'package:real_estate_app/features/home/screens/inbox_screen.dart';
import 'package:real_estate_app/features/offer/model/offer.dart';
import 'package:real_estate_app/features/offer/providers/offer_notifier.dart';
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
          return Text("error : ${error.toString()} ",
              style: const TextStyle(color: Colors.white));
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
                padding: AppPaddings.small,
                height: context.h,
                width: context.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Sender Name",
                        style: Theme.of(context).textTheme.titleLarge),
                    AppSizes.smallY,
                    Text(data.senderName),
                    AppSizes.normalY,
                    Text("Statement",
                        style: Theme.of(context).textTheme.titleLarge),
                    AppSizes.smallY,
                    Text(data.statement ?? ""),
                    AppSizes.normalY,
                    Text("Purpose",
                        style: Theme.of(context).textTheme.titleLarge),
                    AppSizes.smallY,
                    Text(data.purpose.toString()),
                    AppSizes.normalY,
                    if (data.offeredMoney == null)
                      Column(children: [
                        Text("Offered Amount",
                            style: Theme.of(context).textTheme.titleLarge),
                        AppSizes.smallY,
                        Text(data.offeredMoney?.toStringAsFixed(2) ?? ""),
                        AppSizes.normalY,
                      ]),
                    const Spacer(),
                    if (data.createdBy == currentUser?.uid &&
                        data.offerStatus == OfferStatus.pending)
                      Align(
                        alignment: Alignment.center,
                        child: Button(
                          press: () => ref
                              .read(offerNotifierProvider.notifier)
                              .deleteOffer(offerId, context),
                          text: "Withdraw ",
                        ),
                      )
                    else
                      Align(
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (data.offerStatus == OfferStatus.accepted)
                              Button(
                                  isLoading:
                                      ref.read(offerNotifierProvider).isLoading,
                                  press: () => context
                                      .push(ChatScreen(sentTo: data.sentTo)),
                                  text: "Message"),
                            if (data.offerStatus == OfferStatus.pending)
                              Button(
                                  isLoading:
                                      ref.read(offerNotifierProvider).isLoading,
                                  press: () => ref
                                      .read(offerNotifierProvider.notifier)
                                      .updateOffer(
                                          offerId,
                                          {
                                            "offerStatus": OfferStatus
                                                .accepted.name
                                                .toString()
                                          },
                                          context),
                                  text: "Accept "),
                            if (data.offerStatus == OfferStatus.pending)
                              Button(
                                  isLoading:
                                      ref.read(offerNotifierProvider).isLoading,
                                  press: () => ref
                                      .read(offerNotifierProvider.notifier)
                                      .updateOffer(
                                          offerId,
                                          {
                                            "offerStatus": OfferStatus
                                                .rejected.name
                                                .toString()
                                          },
                                          context),
                                  text: "Reject "),
                          ],
                        ),
                      ),
                  ],
                ))));
  }
}
