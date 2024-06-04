// import 'package:ez_homes/contants.dart';
// import 'package:ez_homes/model/repair_house.dart';
// import 'package:ez_homes/view/houses_screens/widgets/detailed_price_card.dart';
// import 'package:ez_homes/view/houses_screens/widgets/service_description.dart';
// import 'package:ez_homes/view/widgets/custom_app_bar.dart';

// import 'package:flutter/material.dart';

// import '../../utils/dialogboxes.dart';
// import '../../data/database_service/house_database.dart';

// class RepairDetailScreen extends StatelessWidget {
//   const RepairDetailScreen({
//     super.key,
//     required this.repairObj,
//   });
//   final HouseRepair repairObj;

//   @override
//   Widget build(BuildContext context) {
//     double h = MediaQuery.sizeOf(context).height;
//     double w = MediaQuery.sizeOf(context).width;
//     return Scaffold(
//       appBar: PreferredSize(
//           preferredSize: const Size.fromHeight(60),
//           child: CustomAppBar(title: "${repairObj.repair} Repair")),
//       body: SizedBox(
//         height: h,
//         width: w,
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               const SizedBox(
//                 height: 10,
//               ),
//               ServiceDescription(
//                   text: repairObj.description, serviceName: repairObj.repair),
//               const SizedBox(
//                 height: 5,
//               ),
//               const Title(text: "Price"),
//               DetailedPriceCard(
//                 serviceName: repairObj.repair,
//                 alignment: Alignment.centerLeft,
//                 text: " USD  ${repairObj.price} ",
//               ),
//               const Title(text: "Before"),
//               Padding(
//                 padding: const EdgeInsets.only(left: 15.0),
//                 child: ImageRow(
//                   w: w,
//                   itemCount: repairObj.beforeImages.length,
//                   image: repairObj.beforeImages,
//                 ),
//               ),
//               const Title(text: "After"),
//               Padding(
//                 padding: const EdgeInsets.only(left: 15.0),
//                 child: ImageRow(
//                   w: w,
//                   itemCount: repairObj.afterImages.length,
//                   image: repairObj.afterImages,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class ImageRow extends StatelessWidget {
//   const ImageRow({
//     super.key,
//     required this.w,
//     required this.image,
//     required this.itemCount,
//   });

//   final double w;
//   final int itemCount;
//   final List<String> image;

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 80,
//       width: w,
//       child: ListView.builder(
//         scrollDirection: Axis.horizontal,
//         itemCount: itemCount,
//         itemBuilder: (context, index) => Row(
//           children: [
//             DisplayImage(
//               imageAsset: image[index],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class DisplayImage extends StatelessWidget {
//   const DisplayImage({
//     super.key,
//     required this.imageAsset,
//   });
//   final String imageAsset;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 70,
//       height: 70,
//       margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
//       child: AspectRatio(
//         aspectRatio: 1,
//         child: ClipRRect(
//           borderRadius: BorderRadius.circular(15),
//           child: Image.network(
//             imageAsset,
//             fit: BoxFit.cover,
//           ),
//         ),
//       ),
//     );
//   }
// }

// class Title extends StatelessWidget {
//   const Title({
//     super.key,
//     required this.text,
//   });
//   final String text;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       // padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//       margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//       alignment: Alignment.centerLeft,
//       child: Text(
//         text,
//         style: const TextStyle(
//             fontFamily: "Raleway",
//             color: Colors.black,
//             fontSize: 19,
//             fontWeight: FontWeight.w600),
//       ),
//     );
//   }
// }
