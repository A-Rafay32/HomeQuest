import 'package:ez_homes/model/user.dart';
import 'package:ez_homes/view/widgets/custom_button.dart';
import 'package:ez_homes/view/payment/payment_screen.dart';
import 'package:ez_homes/data/database_service/house_database.dart';
import 'package:ez_homes/data/database_service/user_database.dart';
import 'package:flutter/material.dart';

import '../../../model/house.dart';
import '../../../utils/dialogboxes.dart';
import '../payment/payment_gateway.dart';
import '../../utils/widgets/address_card.dart';
import '../../utils/widgets/contact_buttons.dart';
import '../../utils/widgets/description_card.dart';
import '../../utils/widgets/image_card.dart';
import '../../utils/widgets/price_card.dart';
import '../../utils/widgets/room_size_card.dart';

class HouseDetailScreen extends StatefulWidget {
  const HouseDetailScreen({
    super.key,
    required this.house,
  });

  final House house;

  @override
  State<HouseDetailScreen> createState() => _HouseDetailScreenState();
}

class _HouseDetailScreenState extends State<HouseDetailScreen> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.sizeOf(context).height;
    double w = MediaQuery.sizeOf(context).width;
    return Scaffold(
      extendBody: true,
      body: SizedBox(
        height: h,
        width: w,
        child: Column(
          children: [
            ImageCard(
              h: h,
              w: w,
              house: widget.house,
            ),
            Container(
              height: h * 0.65,
              width: w,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    PriceCard(house: widget.house),
                    const SizedBox(height: 20),
                    DescriptionCard(house: widget.house),
                    const SizedBox(height: 20),
                    RoomSizeCard(house: widget.house),
                    const SizedBox(
                      height: 15,
                    ),
                    AddressCard(house: widget.house),
                    const SizedBox(
                      height: 15,
                    ),
                    (widget.house.housetype == houseType.forRent &&
                            UserDBHelper.userData?.usertype == UserType.user)
                        ? Column(
                            children: [
                              ContactButtons(w: w, h: h, house: widget.house),
                              CustomButton(
                                  w: w,
                                  h: h,
                                  onTap: () {
                                    Utils.addUserInfo(
                                        context,
                                        () => Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  PaymentScreen(
                                                      onTap: () {
                                                        Navigator.of(context)
                                                            .push(
                                                                MaterialPageRoute(
                                                          builder: (BuildContext
                                                                  context) =>
                                                              paypalGateway(
                                                            price: widget.house
                                                                .pricePerMonth,
                                                            onSuccess:
                                                                (Map params) {
                                                              print(
                                                                  "onSuccess : $params");
                                                              HouseDBHelper
                                                                  .updateHouseTypetoRented(
                                                                      widget
                                                                          .house
                                                                          .address);
                                                              UserDBHelper
                                                                  .addUserHouse(
                                                                      widget
                                                                          .house
                                                                          .address);
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            productName: widget
                                                                .house.name,
                                                          ),
                                                        ));
                                                      },
                                                      price: widget
                                                          .house.pricePerMonth),
                                            )));
                                  },
                                  title: "Book Now"),
                            ],
                          )
                        : (widget.house.housetype == houseType.Owned)
                            ? Column(children: [
                                const SizedBox(
                                  height: 30,
                                ),
                                CustomButton(
                                    w: w,
                                    h: h,
                                    onTap: () {
                                      Utils.BillBottomSheet(
                                          context, w, h, widget.house);
                                    },
                                    title: "Show Bills")
                              ])
                            : (widget.house.housetype == houseType.Rented)
                                ? Column(children: [
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    CustomButton(
                                      w: w,
                                      h: h,
                                      onTap: () {},
                                      title: "Sold",
                                      buttonColor: Colors.green,
                                    )
                                  ])
                                : (UserDBHelper.userData?.usertype ==
                                        UserType.admin)
                                    ? Column(
                                        children: [
                                          ContactButtons(
                                              w: w, h: h, house: widget.house),
                                          CustomButton(
                                              w: w,
                                              h: h,
                                              onTap: () {
                                                Utils.BillBottomSheet(context,
                                                    w, h, widget.house);
                                              },
                                              title: "See Bills"),
                                        ],
                                      )
                                    : Column(children: [
                                        ContactButtons(
                                            w: w, h: h, house: widget.house),
                                        CustomButton(
                                          w: w,
                                          h: h,
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder:
                                                      (context) =>
                                                          PaymentScreen(
                                                              onTap: () {
                                                                Navigator.of(
                                                                        context)
                                                                    .push(
                                                                        MaterialPageRoute(
                                                                  builder: (BuildContext
                                                                          context) =>
                                                                      paypalGateway(
                                                                          onSuccess: (Map
                                                                              params) {
                                                                            print("onSuccess : $params ");
                                                                            HouseDBHelper.updateHouseTypetoOwned(widget.house.address);
                                                                            UserDBHelper.addUserHouse(widget.house.address);
                                                                            Navigator.pop(context);
                                                                          },
                                                                          productName: widget
                                                                              .house
                                                                              .name,
                                                                          price: widget
                                                                              .house
                                                                              .pricePerMonth),
                                                                ));
                                                              },
                                                              price: widget
                                                                  .house
                                                                  .salePrice),
                                                ));
                                          },
                                          title: "Buy",
                                        )
                                      ])
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
