import 'package:ez_homes/model/house.dart';
import 'package:ez_homes/view/widgets/back_button.dart';
import 'package:ez_homes/view/widgets/house_list_card.dart';
import 'package:ez_homes/data/database_service/house_database.dart';
import 'package:ez_homes/data/database_service/user_database.dart';
import 'package:ez_homes/view_model/house_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../app/constants/contants.dart';
import '../../../model/user.dart';
import '../../../utils/dialogboxes.dart';

class RentalHomeScreen extends StatefulWidget {
  const RentalHomeScreen({super.key});

  @override
  State<RentalHomeScreen> createState() => _RentalHomeScreenState();
}

class _RentalHomeScreenState extends State<RentalHomeScreen> {
  @override
  void initState() {
    // UserDBHelper.getUserInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.sizeOf(context).height;
    double w = MediaQuery.sizeOf(context).width;

    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const Padding(
          padding: EdgeInsets.only(left: 55.0),
          child: Text(
            "Rental Homes",
            style: TextStyle(
                fontFamily: "Raleway",
                fontWeight: FontWeight.w600,
                color: Colors.black,
                fontSize: 21),
          ),
        ),
      ),
      body: Consumer<HouseProvider>(builder: (context, value, child) {
        return FutureBuilder(
            future: value.futureHouses,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: SizedBox(
                    height: 40,
                    width: 40,
                    child: Center(
                      child: CircularProgressIndicator(
                        color: primaryColor,
                      ),
                    ),
                  ),
                );
              }
              if (snapshot.hasError) {
                return Center(
                  child: Text("Something has gone wrong ${snapshot.error}"),
                );
              }
              if (snapshot.connectionState == ConnectionState.done) {
                return Column(
                  children: [
                    Container(
                      height: h * 0.12,
                      width: w,
                      margin: const EdgeInsets.all(10),
                      padding: const EdgeInsets.all(10),
                      child: const Text(
                        textAlign: TextAlign.center,
                        "Rent our beautiful houses at reasonable prices",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                          fontFamily: "Raleway",
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                          itemCount: snapshot.data?.length ?? 0,
                          // RentHouseList.length,
                          itemBuilder: (context, index) =>
                              (snapshot.data?[index].housetype ==
                                      houseType.forRent)
                                  ? HouseListCard(
                                      house: snapshot.data?[index] ??
                                          House(
                                              name: "",
                                              description: "",
                                              images: [],
                                              pricePerMonth: 1,
                                              roomQty: 1,
                                              sizeInFeet: 1,
                                              salePrice: 1,
                                              address: "",
                                              email: "",
                                              phoneNum: 0,
                                              housetype: houseType.forRent))
                                  : Container()),
                    )
                  ],
                );
              } else {
                return const CircularProgressIndicator();
              }
            });
      }),
      // }),
      floatingActionButton: (UserDBHelper.userData?.usertype == UserType.admin)
          ? FloatingActionButton(
              onPressed: () {
                House tempRentalHouse = House(
                    name: "",
                    description: "",
                    images: [""],
                    pricePerMonth: 0,
                    roomQty: 0,
                    sizeInFeet: 0,
                    salePrice: 0,
                    email: "",
                    phoneNum: 0,
                    address: "",
                    housetype: houseType.forRent);
                Utils.AddHouseDialogBox(context, tempRentalHouse);
              },
              child: const Icon(Icons.add),
            )
          : Container(),
    );
  }
}
