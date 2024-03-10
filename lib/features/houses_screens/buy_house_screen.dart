import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ez_homes/utils/image_picker.dart';
import 'package:ez_homes/view/widgets/back_button.dart';
import 'package:ez_homes/data/database_service/house_database.dart';
import 'package:ez_homes/data/database_service/user_database.dart';
import 'package:ez_homes/view_model/house_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../app/constants/contants.dart';
import '../../../model/house.dart';
import '../../../model/user.dart';
import '../../../utils/dialogboxes.dart';
import '../../utils/widgets/house_list_card.dart';

class BuyHomeScreen extends StatefulWidget {
  const BuyHomeScreen({super.key});

  @override
  State<BuyHomeScreen> createState() => _BuyHomeScreenState();
}

class _BuyHomeScreenState extends State<BuyHomeScreen> {
  CollectionReference house = FirebaseFirestore.instance.collection("house");

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.sizeOf(context).height;
    double w = MediaQuery.sizeOf(context).width;

    return Scaffold(
      appBar: AppBar(
        actions: const [],
        leading: const BackButton(),
        title: const Padding(
          padding: EdgeInsets.only(left: 55.0),
          child: Text(
            "Buy House",
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
                return Column(children: [
                  Container(
                    height: h * 0.12,
                    width: w,
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(10),
                    child: const Text(
                      textAlign: TextAlign.center,
                      "Buy our beautiful houses at reasonable prices",
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
                          itemBuilder: (context, index) =>
                              (snapshot.data?[index].housetype ==
                                      houseType.forSale)
                                  ? HouseListCard(house: snapshot.data![index])
                                  : Container()))
                ]);
              }
              return const Center(
                child: SizedBox(
                    height: 40,
                    width: 40,
                    child: CircularProgressIndicator(
                      color: primaryColor,
                    )),
              );
            });
      }),
      floatingActionButton: (UserDBHelper.userData?.usertype == UserType.admin)
          ? FloatingActionButton(
              onPressed: () {
                House tempBuyHouse = House(
                    name: "",
                    description: "",
                    images: [""],
                    pricePerMonth: 0,
                    roomQty: 0,
                    sizeInFeet: 0,
                    salePrice: 0,
                    address: "",
                    email: "",
                    phoneNum: 0,
                    housetype: houseType.forSale);
                Utils.AddHouseDialogBox(context, tempBuyHouse);
              },
              child: const Icon(Icons.add),
            )
          : Container(),
    );
  }
}
