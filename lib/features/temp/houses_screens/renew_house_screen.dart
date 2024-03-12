import 'package:ez_homes/model/repair_house.dart';
import 'package:ez_homes/model/user.dart';
import 'package:ez_homes/view/renew_request_screen.dart';
import 'package:ez_homes/view/houses_screens/repair_detail%20_screen.dart';
import 'package:ez_homes/view/widgets/custom_app_bar.dart';
import 'package:ez_homes/view/widgets/custom_button.dart';
import 'package:ez_homes/view/widgets/header_title.dart';
import 'package:ez_homes/view/widgets/login_sheet.dart';
import 'package:ez_homes/data/database_service/house_database.dart';
import 'package:ez_homes/data/database_service/house_repair_database.dart';
import 'package:ez_homes/data/database_service/user_database.dart';
import 'package:ez_homes/view_model/house_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../app/constants/contants.dart';
import '../../../../utils/dialogboxes.dart';
import '../../../../view_model/auth_provider.dart';
import '../../../utils/widgets/renew_house_card.dart';

class RenewHouseScreen extends StatefulWidget {
  const RenewHouseScreen({super.key});

  @override
  State<RenewHouseScreen> createState() => _RenewHouseScreenState();
}

class _RenewHouseScreenState extends State<RenewHouseScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.sizeOf(context).height;
    double w = MediaQuery.sizeOf(context).width;

    return Scaffold(
        extendBody: true,
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(60),
            child: CustomAppBar(
              title: "Renew House",
            )),
        body: SizedBox(
          height: h,
          width: w,
          child: SingleChildScrollView(
            child: Column(
              children: [
                HeaderTitle(
                    text:
                        "Renew or Repair your Houses using our Amazing Services",
                    h: h,
                    w: w),
                Row(
                  children: [
                    Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 25,
                        ),
                        child: const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Our Work",
                            style: TextStyle(
                              fontSize: 21,
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                              fontFamily: "Raleway",
                            ),
                          ),
                        )),
                    Expanded(child: Container()),
                    if (UserDBHelper.userData?.usertype == UserType.admin)
                      IconButton(
                          onPressed: () {
                            HouseRepair tempHouseRepair = HouseRepair(
                                frontImage: "",
                                description: "",
                                repair: "",
                                price: 0,
                                beforeImages: [""],
                                afterImages: [""]);
                            Utils.addServiceDialogBox(context, tempHouseRepair);
                          },
                          icon: const Icon(Icons.add))
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Consumer<HouseProvider>(builder: (context, value, child) {
                  return FutureBuilder(
                      future: value.futureRepairServices,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
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
                            child: Text(
                                "Something has gone wrong ${snapshot.error}"),
                          );
                        }
                        if (snapshot.connectionState == ConnectionState.done) {
                          return Container(
                            height: h * 0.65,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 15,
                            ),
                            child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: snapshot.data?.length ?? 0,
                              itemBuilder: (context, index) => RenewHouseCard(
                                  imageUrl: snapshot.data![index].frontImage,
                                  text: snapshot.data?[index].repair ?? "",
                                  price: snapshot.data?[index].price ?? 0,
                                  h: h,
                                  onDelete: () {
                                    HouseRepairDBHelper.deleteRepairService(
                                        snapshot.data?[index].repair ?? "");
                                    value.refreshServices();
                                  },
                                  onTap: () {
                                    (Provider.of<Auth>(context, listen: false)
                                                .isLoggedIn ==
                                            true)
                                        ? Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  RepairDetailScreen(
                                                      repairObj: snapshot
                                                              .data?[index] ??
                                                          HouseRepair(
                                                              frontImage: "",
                                                              description: "",
                                                              repair: "",
                                                              price: 0,
                                                              beforeImages: [],
                                                              afterImages: [])),
                                            ))
                                        : LoginSheet.LoginSheetFunction(
                                            context);
                                  },
                                  w: w),
                            ),
                          );
                        } else {
                          return const CircularProgressIndicator();
                        }
                      });
                }),
              ],
            ),
          ),
        ),
        floatingActionButton: CustomButton(
            w: w,
            h: h,
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RenewRequestScreen(),
                  ));
            },
            title: "Renew Now"));
  }
}
