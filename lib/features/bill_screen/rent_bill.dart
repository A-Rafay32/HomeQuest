import 'package:flutter/material.dart';
import 'package:real_estate_app/app/themes/app_colors.dart';

import '../../app/constants/contants.dart';
import '../../utils/widgets/back_button.dart';

class RentBillScreen extends StatelessWidget {
  const RentBillScreen({
    super.key,
    required this.address,
    required this.AppBarTitle,
  });
  final String AppBarTitle;
  final String address;

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.sizeOf(context).height;
    double w = MediaQuery.sizeOf(context).width;

    return Scaffold(
        appBar: AppBar(
          leading: const BackButton(),
          title: Padding(
            padding: const EdgeInsets.only(left: 55.0),
            child: Text(
              AppBarTitle,
              style: const TextStyle(
                  fontFamily: "Raleway",
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                  fontSize: 21),
            ),
          ),
        ),
        body: FutureBuilder(
            future: HouseDBHelper.getBills(address),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: SizedBox(
                    height: 40,
                    width: 40,
                    child: Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primaryColor,
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
              if (snapshot.data?.isEmpty ?? false) {
                return Column(
                  children: [
                    const SizedBox(
                      height: 200,
                    ),
                    Center(
                      child: Text(
                        "No Bills to Show",
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
                return SizedBox(
                    height: h,
                    width: w,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        DataTable(
                            columnSpacing: 25,
                            columns: const [
                              DataColumn(
                                label: Text("Month",
                                    style: TextStyle(
                                      fontFamily: "Raleway",
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 17,
                                    )),
                              ),
                              DataColumn(
                                label: Text("Amount",
                                    style: TextStyle(
                                      fontFamily: "Raleway",
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 17,
                                    )),
                              ),
                              DataColumn(
                                label: Text("Date",
                                    style: TextStyle(
                                      fontFamily: "Raleway",
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 17,
                                    )),
                              ),
                              DataColumn(
                                label: Text("Status",
                                    style: TextStyle(
                                      fontFamily: "Raleway",
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 17,
                                    )),
                              ),
                            ],
                            rows: List.generate(
                                snapshot.data?.length ?? 0,
                                (index) => (AppBarTitle.toLowerCase() ==
                                        "${snapshot.data?[index].category.name} bills")
                                    ? DataRow(cells: [
                                        DataCell(
                                          Text(
                                              snapshot.data?[index].month ?? "",
                                              style: TextStyle(
                                                fontFamily: "Raleway",
                                                color: (snapshot.data?[index]
                                                            .status ==
                                                        Status.paid)
                                                    ? Colors.green
                                                    : (snapshot.data?[index]
                                                                .status ==
                                                            Status.missed)
                                                        ? Colors.red
                                                        : Colors.blue,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 18,
                                              )),
                                        ),
                                        DataCell(
                                          Text(
                                              "${snapshot.data?[index].amount}",
                                              style: TextStyle(
                                                fontFamily: "Raleway",
                                                color: (snapshot.data?[index]
                                                            .status ==
                                                        Status.paid)
                                                    ? Colors.green
                                                    : (snapshot.data?[index]
                                                                .status ==
                                                            Status.missed)
                                                        ? Colors.red
                                                        : Colors.blue,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 18,
                                              )),
                                        ),
                                        DataCell(
                                          Text(
                                              "${snapshot.data?[index].date["day"]}/${snapshot.data?[index].date["month"]}/${snapshot.data?[index].date["year"]}",
                                              style: TextStyle(
                                                fontFamily: "Raleway",
                                                color: (snapshot.data?[index]
                                                            .status ==
                                                        Status.paid)
                                                    ? Colors.green
                                                    : (snapshot.data?[index]
                                                                .status ==
                                                            Status.missed)
                                                        ? Colors.red
                                                        : Colors.blue,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 18,
                                              )),
                                        ),
                                        DataCell(
                                          Text(
                                              snapshot.data?[index].status
                                                      .name ??
                                                  "",
                                              style: TextStyle(
                                                fontFamily: "Raleway",
                                                color: (snapshot.data?[index]
                                                            .status ==
                                                        Status.paid)
                                                    ? Colors.green
                                                    : (snapshot.data?[index]
                                                                .status ==
                                                            Status.missed)
                                                        ? Colors.red
                                                        : Colors.blue,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 18,
                                              )),
                                        )
                                      ])
                                    : const DataRow(cells: [
                                        DataCell(Text("")),
                                        DataCell(Text("")),
                                        DataCell(Text("")),
                                        DataCell(Text(""))
                                      ])))
                      ],
                    ));
              } else {
                return const CircularProgressIndicator();
              }
            }));
  }
}
