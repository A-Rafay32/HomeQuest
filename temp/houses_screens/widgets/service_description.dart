// import 'package:ez_homes/contants.dart';
// import 'package:ez_homes/data/database_service/house_database.dart';
// import 'package:ez_homes/data/database_service/house_repair_database.dart';
// import 'package:flutter/material.dart';

// class ServiceDescription extends StatefulWidget {
//   ServiceDescription({
//     super.key,
//     required this.text,
//     required this.serviceName,
//     this.alignment = Alignment.center,
//   });

//   final String text;
//   final Alignment alignment;
//   String serviceName;

//   @override
//   State<ServiceDescription> createState() => _ServiceDescriptionState();
// }

// class _ServiceDescriptionState extends State<ServiceDescription> {
//   final TextEditingController _controller = TextEditingController();

//   String newDescription = '';

//   @override
//   void initState() {
//     _controller.text = widget.text;
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onDoubleTap: () {
//         showDialog(
//           context: context,
//           builder: (context) => AlertDialog(
//             actions: [
//               TextButton(
//                 child: const Text('Cancel'),
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//               ),
//               TextButton(
//                 child: const Text('Update'),
//                 onPressed: () {
//                   HouseRepairDBHelper.updateServiceDesc(
//                       widget.serviceName, newDescription);
//                   Navigator.of(context).pop();
//                   _controller.clear();
//                 },
//               ),
//             ],
//             content: SizedBox(
//               height: 300,
//               width: 300,
//               child: Column(
//                 children: [
//                   TextFormField(
//                     // initialValue: widget.text,
//                     maxLines: 3,
//                     style: const TextStyle(
//                       fontFamily: "Raleway",
//                     ),
//                     onChanged: (value) {
//                       newDescription = value;
//                     },

//                     controller: _controller,
//                     decoration: TextFieldDecoration("Set New Description"),
//                   )
//                 ],
//               ),
//             ),
//           ),
//         );
//       },
//       child: Container(
//         margin: const EdgeInsets.symmetric(
//           horizontal: 20,
//         ),
//         alignment: widget.alignment,
//         child: Text(
//           widget.text,
//           style: const TextStyle(
//               fontFamily: "Raleway",
//               color: Colors.grey,
//               fontSize: 15,
//               fontWeight: FontWeight.w600),
//         ),
//       ),
//     );
//   }
// }
