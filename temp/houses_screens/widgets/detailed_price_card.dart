// import 'package:flutter/material.dart';

// class DetailedPriceCard extends StatelessWidget {
//   DetailedPriceCard({
//     super.key,
//     required this.text,
//     required this.serviceName,
//     this.alignment = Alignment.center,
//   });

//   final String text;
//   final Alignment alignment;
//   String serviceName;
//   final TextEditingController _controller = TextEditingController();
//   String newDescription = '';

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
//                   HouseRepairDBHelper.updateServicePrice(
//                       serviceName, newDescription);
//                   Navigator.of(context).pop();
//                   _controller.dispose();
//                 },
//               ),
//             ],
//             content: SizedBox(
//               height: 300,
//               width: 300,
//               child: Column(
//                 children: [
//                   TextField(
//                     style: const TextStyle(
//                       fontFamily: "Raleway",
//                     ),
//                     onChanged: (value) {
//                       newDescription = value;
//                     },
//                     controller: _controller,
//                     decoration: TextFieldDecoration("Set New Price"),
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
//         alignment: alignment,
//         child: Text(
//           text,
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
