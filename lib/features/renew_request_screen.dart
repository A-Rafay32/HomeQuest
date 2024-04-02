// import 'dart:io';

// import 'package:ez_homes/model/repair_house.dart';
// import 'package:ez_homes/data/database_service/house_repair_database.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
// import 'package:ez_homes/view/payment/payment_gateway.dart';
// import 'package:ez_homes/view/payment/payment_screen.dart';
// import 'package:ez_homes/view/widgets/custom_app_bar.dart';
// import 'package:ez_homes/view/widgets/custom_button.dart';
// import 'package:flutter/material.dart';
// import 'package:dropdown_button2/dropdown_button2.dart';

// import '../../utils/image_picker.dart';
// import '../../data/database_service/house_database.dart';

// class RenewRequestScreen extends StatefulWidget {
//   const RenewRequestScreen({super.key});

//   @override
//   State<RenewRequestScreen> createState() => _RenewRequestScreenState();
// }

// class _RenewRequestScreenState extends State<RenewRequestScreen> {
//   final List<String> items = [
//     'Bathroom',
//     'Livingroom',
//     'Bedroom',
//     'Kitchen',
//     'Roof',
//     'Floor',
//     'Lawn',
//   ];
//   Map<String, dynamic> categories = {
//     "Bathroom": 2500,
//     "Livingroom": 3000,
//     "Kitchen": 3500,
//     "Bedroom": 2000,
//     "Lawn": 1000,
//     "Roof": 1500,
//     "Floor": 2000
//   };
//   String? selectedValue;
//   final ImagePicker imgPicker = ImagePicker();
//   List<XFile>? imageFiles;

//   Future uploadImagesToHouseRepair() async {
//     if (imageFiles != null) {
//       for (var file in imageFiles!) {
//         try {
//           var storageRef = firebase_storage.FirebaseStorage.instance
//               .ref("/userSamples/")
//               .child(file.name);
//           await storageRef.putFile(File(file.path));
//           print('Image uploaded: ${storageRef.fullPath}');
//         } catch (e) {
//           print('Error uploading image: $e');
//         }
//       }
//     }
//   }

//   TextEditingController descController = TextEditingController();
//   TextEditingController sizeController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     double h = MediaQuery.sizeOf(context).height;
//     double w = MediaQuery.sizeOf(context).width;
//     RenewHouseRequest renewHouseRequest = RenewHouseRequest(
//         category: "", description: "", size: 0, userId: "", sampleImage: [""]);

//     return Scaffold(
//       // backgroundColor: kbackgroundColor,
//       // Colors.grey.shade100,
//       extendBody: true,
//       resizeToAvoidBottomInset: true,
//       appBar: const PreferredSize(
//           preferredSize: Size.fromHeight(60),
//           child: CustomAppBar(
//             // backgroundColor: Colors.grey.shade100,
//             title: "Renew Request",
//           )),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             const SizedBox(
//               height: 10,
//             ),
//             Container(
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: 25,
//                 ),
//                 child: const Align(
//                   alignment: Alignment.centerLeft,
//                   child: Text(
//                     "Categories",
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.w500,
//                       color: Colors.black,
//                       fontFamily: "Raleway",
//                     ),
//                   ),
//                 )),
//             const SizedBox(
//               height: 10,
//             ),
//             DropdownButtonHideUnderline(
//               child: DropdownButton2<String>(
//                 isExpanded: true,
//                 hint: Row(
//                   children: [
//                     Expanded(
//                       child: Text(
//                         'Select Category',
//                         style: TextStyle(
//                           fontFamily: "Raleway",
//                           fontSize: 14,
//                           // fontWeight: FontWeight.bold,
//                           color: Colors.grey.shade600,
//                         ),
//                         overflow: TextOverflow.ellipsis,
//                       ),
//                     ),
//                   ],
//                 ),
//                 items: items
//                     .map((String item) => DropdownMenuItem<String>(
//                           value: item,
//                           child: Text(
//                             item,
//                             style: const TextStyle(
//                               fontFamily: "Raleway",
//                               fontSize: 16,
//                               color: Colors.black,
//                             ),
//                             overflow: TextOverflow.ellipsis,
//                           ),
//                         ))
//                     .toList(),
//                 value: selectedValue,
//                 onChanged: (String? value) {
//                   setState(() {
//                     selectedValue = value;
//                     renewHouseRequest.category = value.toString();
//                   });
//                 },
//                 buttonStyleData: ButtonStyleData(
//                   height: h * 0.07,
//                   width: w * 0.9,
//                   padding: const EdgeInsets.only(left: 14, right: 14),
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(14),
//                       border: Border.all(
//                         color: Colors.black26,
//                       ),
//                       color: Colors.white),
//                   elevation: 0,
//                 ),
//                 dropdownStyleData: DropdownStyleData(
//                   padding: const EdgeInsets.symmetric(horizontal: 20),
//                   maxHeight: 200,
//                   width: 200,
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(14),
//                       color: Colors.white),
//                   offset: const Offset(10, -8),
//                   scrollbarTheme: ScrollbarThemeData(
//                     radius: const Radius.circular(40),
//                     thickness: MaterialStateProperty.all<double>(6),
//                     thumbVisibility: MaterialStateProperty.all<bool>(true),
//                   ),
//                 ),
//                 menuItemStyleData: const MenuItemStyleData(
//                   height: 40,
//                   padding: EdgeInsets.only(left: 14, right: 14),
//                 ),
//               ),
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             Container(
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: 25,
//                 ),
//                 child: const Align(
//                   alignment: Alignment.centerLeft,
//                   child: Text(
//                     "Size",
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.w500,
//                       color: Colors.black,
//                       fontFamily: "Raleway",
//                     ),
//                   ),
//                 )),
//             Container(
//                 margin: const EdgeInsets.all(10),
//                 height: h * 0.07,
//                 width: w * 0.9,
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: TextField(
//                   style: const TextStyle(
//                     fontFamily: "Raleway",
//                   ),
//                   controller: sizeController,
//                   onChanged: (value) {
//                     renewHouseRequest.size = value as int;
//                     renewHouseRequest.userId =
//                         FirebaseAuth.instance.currentUser?.uid ?? '';
//                   },
//                   decoration: InputDecoration(
//                     enabledBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10),
//                         borderSide: const BorderSide(color: Colors.black26)),
//                     focusedBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10),
//                         borderSide: const BorderSide(color: Colors.black26)),
//                     contentPadding: const EdgeInsets.all(10),
//                   ),
//                 )),
//             Container(
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: 25,
//                 ),
//                 child: const Align(
//                   alignment: Alignment.centerLeft,
//                   child: Text(
//                     "Description",
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.w500,
//                       color: Colors.black,
//                       fontFamily: "Raleway",
//                     ),
//                   ),
//                 )),
//             Container(
//                 margin: const EdgeInsets.all(10),
//                 height: h * 0.15,
//                 width: w * 0.9,
//                 decoration: BoxDecoration(
//                   border: Border.all(
//                     color: Colors.black26,
//                   ),
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: TextField(
//                   style: const TextStyle(
//                     fontFamily: "Raleway",
//                   ),
//                   controller: descController,
//                   onChanged: (value) {
//                     renewHouseRequest.description = value.toString();
//                   },
//                   decoration: InputDecoration(
//                       enabledBorder: InputBorder.none,
//                       focusedBorder: InputBorder.none,
//                       contentPadding: const EdgeInsets.all(10),
//                       hintText: "Describe the problem",
//                       hintStyle: TextStyle(
//                           color: Colors.grey.shade600,
//                           fontSize: 16,
//                           fontFamily: "Raleway")),
//                 )),
//             GestureDetector(
//               onTap: () {
//                 PickImage().pickRequestSampleImage();
//               },
//               child: Container(
//                   margin: const EdgeInsets.all(10),
//                   height: h * 0.24,
//                   width: w,
//                   decoration: BoxDecoration(
//                       color: Colors.grey.shade200,
//                       borderRadius: BorderRadius.circular(20)),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Icon(
//                         Icons.add_photo_alternate_outlined,
//                         size: h * 0.1,
//                         color: Colors.black,
//                       ),
//                       Text(
//                         "Upload Image",
//                         style: TextStyle(
//                           fontSize: h * 0.03,
//                           fontWeight: FontWeight.w600,
//                           color: Colors.black,
//                           fontFamily: "Raleway",
//                         ),
//                       ),
//                     ],
//                   )),
//             ),
//             CustomButton(
//                 w: w,
//                 h: h,
//                 onTap: () {
//                   if (selectedValue == null) {
//                     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//                       content: Text(
//                         "Select Category First",
//                         style: TextStyle(
//                           fontFamily: "Raleway",
//                           color: Colors.red,
//                           fontSize: 24,
//                         ),
//                       ),
//                     ));
//                   } else {
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => PaymentScreen(
//                               onTap: () {
//                                 Navigator.of(context).push(MaterialPageRoute(
//                                   builder: (BuildContext context) =>
//                                       paypalGateway(
//                                           onSuccess: (Map params) {
//                                             print("onSuccess : $params ");

//                                             HouseRepairDBHelper.addRenewRequest(
//                                                 renewHouseRequest);

//                                             print("onSuccess : $params");
//                                           },
//                                           productName: "$selectedValue Repair",
//                                           price: categories[selectedValue]),
//                                 ));
//                               },
//                               price: categories[selectedValue]),
//                         ));
//                   }
//                 },
//                 title: (selectedValue == null)
//                     ? "Renew House"
//                     : "Renew with PKR ${categories[selectedValue]}")
//           ],
//         ),
//       ),
//     );
//   }
// }
