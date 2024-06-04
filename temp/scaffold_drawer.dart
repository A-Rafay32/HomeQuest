// import 'package:ez_homes/model/user.dart';
// import 'package:ez_homes/view/home_screen/home_screen.dart';
// import 'package:ez_homes/view/notification_screen.dart';
// import 'package:ez_homes/view_model/auth_provider.dart';
// import 'package:ez_homes/data/database_service/house_database.dart';
// import 'package:ez_homes/data/database_service/user_database.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:provider/provider.dart';

// import '../lib/app/constants/contants.dart';
// import '../utils/dialogboxes.dart';
// import 'houses_screens/your_house.dart';

// class ScaffoldDrawer extends StatelessWidget {
//   ScaffoldDrawer({
//     super.key,
//     required this.h,
//   });

//   final double h;
//   final TextEditingController emailController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Container(
//         color: primaryColor,
//         child: ListTileTheme(
//           textColor: Colors.white,
//           iconColor: Colors.white,
//           child: Column(
//             mainAxisSize: MainAxisSize.max,
//             children: [
//               SizedBox(
//                 height: h * 0.4,
//               ),
//               ListTile(
//                 onTap: () {
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => const HomeScreen(),
//                       ));
//                 },
//                 leading: SvgPicture.asset(
//                     colorFilter:
//                         const ColorFilter.mode(Colors.white, BlendMode.srcIn),
//                     height: 25,
//                     width: 25,
//                     "assets/icons/account.svg"),
//                 title: const Padding(
//                   padding: EdgeInsets.only(left: 25.0),
//                   child: Text(
//                     'Home',
//                     style: TextStyle(fontFamily: "Raleway"),
//                   ),
//                 ),
//               ),
//               ListTile(
//                 onTap: () {
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => NotificationScreen(),
//                       ));
//                 },
//                 leading: SvgPicture.asset(
//                     colorFilter:
//                         const ColorFilter.mode(Colors.white, BlendMode.srcIn),
//                     height: 25,
//                     width: 25,
//                     "assets/icons/notification.svg"),
//                 title: const Padding(
//                   padding: EdgeInsets.only(left: 25.0),
//                   child: Text(
//                     'Notifications',
//                     style: TextStyle(fontFamily: "Raleway"),
//                   ),
//                 ),
//               ),
//               ListTile(
//                 onTap: () {
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => const YourHouseScreen(),
//                       ));
//                 },
//                 leading: SvgPicture.asset(
//                     colorFilter:
//                         const ColorFilter.mode(Colors.white, BlendMode.srcIn),
//                     height: 30,
//                     width: 30,
//                     "assets/icons/your-house.svg"),
//                 title: const Padding(
//                   padding: EdgeInsets.only(left: 20.0),
//                   child: Text(
//                     'Your Houses',
//                     style: TextStyle(fontFamily: "Raleway"),
//                   ),
//                 ),
//               ),
//               ListTile(
//                 onTap: () {
//                   Provider.of<Auth>(context, listen: false).logOut();
//                 },
//                 leading: SvgPicture.asset(
//                     colorFilter:
//                         const ColorFilter.mode(Colors.white, BlendMode.srcIn),
//                     height: 23,
//                     width: 23,
//                     "assets/icons/logout.svg"),
//                 title: const Padding(
//                   padding: EdgeInsets.only(left: 25.0),
//                   child: Text(
//                     'Log Out',
//                     style: TextStyle(fontFamily: "Raleway"),
//                   ),
//                 ),
//               ),
//               if (UserDBHelper.userData?.usertype == UserType.admin)
//                 ListTile(
//                   onTap: () {
//                     showDialog(
//                       context: context,
//                       builder: (context) => AlertDialog(
//                         actions: [
//                           TextButton(
//                               onPressed: () {
//                                 Auth().changeAdminEmail(emailController.text);
//                                 emailController.clear();
//                               },
//                               child: const Text("Change")),
//                           TextButton(
//                               onPressed: () {
//                                 Auth().addAdminEmail(emailController.text);
//                                 emailController.clear();
//                               },
//                               child: const Text("Add")),
//                           TextButton(
//                               onPressed: () {
//                                 Navigator.pop(context);
//                                 emailController.clear();
//                               },
//                               child: const Text("Cancel"))
//                         ],
//                         content: SizedBox(
//                             height: 200,
//                             width: 300,
//                             child: Container(
//                               margin: const EdgeInsets.symmetric(
//                                   vertical: 10, horizontal: 5),
//                               child: TextField(
//                                 style: const TextStyle(
//                                   fontFamily: "Raleway",
//                                 ),
//                                 onChanged: (value) {
//                                   emailController.text =
//                                       value.toString().trim();
//                                 },
//                                 controller: emailController,
//                                 decoration: TextFieldDecoration(
//                                     "Enter name of the house"),
//                               ),
//                             )),
//                       ),
//                     );
//                   },
//                   title: const Padding(
//                     padding: EdgeInsets.only(left: 25.0),
//                     child: Text(
//                       'Change Admin Email Address',
//                       style: TextStyle(fontFamily: "Raleway"),
//                     ),
//                   ),
//                 ),
//               const Spacer(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
