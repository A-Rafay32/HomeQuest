import 'package:ez_homes/model/house.dart';
import 'package:ez_homes/view/widgets/house_list_card.dart';
import 'package:ez_homes/data/database_service/user_database.dart';
import 'package:ez_homes/view_model/house_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../app/constants/contants.dart';
import '../../../data/database_service/house_database.dart';
import '../../utils/widgets/back_button.dart';

class YourHouseScreen extends StatelessWidget {
  const YourHouseScreen({
    super.key,
    // required this.house,
  });

  // final House house;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const BackButton(),
          title: const Padding(
            padding: EdgeInsets.only(left: 65.0),
            child: Text(
              "House List",
              style: TextStyle(
                  fontFamily: "Raleway",
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 21),
            ),
          ),
        ),
        body: Consumer<HouseProvider>(builder: (context, value, child) {
          return FutureBuilder(
              future: value.futureUserHouses,
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
                if (snapshot.data?.isEmpty ??
                    false || UserDBHelper.userData?.userHouseIds == []) {
                  return Column(
                    children: [
                      const SizedBox(
                        height: 200,
                      ),
                      Center(
                        child: Text(
                          "Book or Buy a House First",
                          style: TextStyle(
                              fontFamily: "Raleway",
                              fontWeight: FontWeight.w500,
                              fontSize: 22,
                              color: Colors.grey.shade600),
                        ),
                      ),
                    ],
                  );
                }
                if (snapshot.connectionState == ConnectionState.done) {
                  return ListView.builder(
                    itemCount: snapshot.data?.length,
                    itemBuilder: (context, index) =>
                        (snapshot.data?[index].housetype == houseType.Rented ||
                                snapshot.data?[index].housetype ==
                                    houseType.Owned)
                            ? HouseListCard(
                                house: snapshot.data![index],
                              )
                            : Container(),
                  );
                } else {
                  return const CircularProgressIndicator();
                }
              });
        }));
  }
}
