import 'package:ez_homes/contants.dart';
import 'package:flutter/material.dart';

import '../../../model/house.dart';
import '../../../utils/dialogboxes.dart';
import '../../../data/database_service/house_database.dart';

class AddressCard extends StatefulWidget {
  const AddressCard({
    super.key,
    required this.house,
  });

  final House house;

  @override
  State<AddressCard> createState() => _AddressCardState();
}

class _AddressCardState extends State<AddressCard> {
  String newAddress = '';
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Align(
          alignment: Alignment.centerLeft,
          child: Text("Address",
              style: TextStyle(
                color: Colors.black,
                fontFamily: "Raleway",
                fontWeight: FontWeight.w600,
                fontSize: 18,
              )),
        ),
        const SizedBox(
          height: 5,
        ),
        GestureDetector(
          onDoubleTap: () {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                actions: [
                  TextButton(
                    child: const Text('Cancel'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  TextButton(
                    child: const Text('Update'),
                    onPressed: () {
                      HouseDBHelper.updateHouseAddress(
                          widget.house.address, newAddress);
                      Navigator.of(context).pop();
                      dispose();
                    },
                  ),
                ],
                content: SizedBox(
                  height: 300,
                  width: 300,
                  child: Column(
                    children: [
                      TextField(
                        style: const TextStyle(
                          fontFamily: "Raleway",
                        ),
                        onChanged: (value) {
                          newAddress = value;
                        },
                        controller: _controller,
                        decoration: TextFieldDecoration("Set New Address"),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(widget.house.address,
                style: const TextStyle(
                  color: Colors.grey,
                  fontFamily: "Raleway",
                  fontSize: 15,
                )),
          ),
        ),
      ],
    );
  }
}
