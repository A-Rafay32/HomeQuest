import 'package:ez_homes/contants.dart';
import 'package:ez_homes/view_model/house_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../model/house.dart';
import '../../../utils/dialogboxes.dart';

class RoomSizeCard extends StatefulWidget {
  const RoomSizeCard({
    super.key,
    required this.house,
  });

  final House house;

  @override
  State<RoomSizeCard> createState() => _RoomSizeCardState();
}

class _RoomSizeCardState extends State<RoomSizeCard> {
  TextEditingController roomController = TextEditingController();
  TextEditingController sizeController = TextEditingController();

  String newRoomQty = '';

  String newSize = '';

  @override
  void dispose() {
    roomController.dispose();
    sizeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
                  Provider.of<HouseProvider>(context, listen: false)
                      .updateHouseRoomSize(
                          widget.house.address, newRoomQty, newSize);
                  Navigator.of(context).pop();
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
                      newRoomQty = value;
                    },
                    controller: roomController,
                    decoration: TextFieldDecoration("Set New Room Quantity"),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    style: const TextStyle(
                      fontFamily: "Raleway",
                    ),
                    onChanged: (value) {
                      newSize = value;
                    },
                    controller: sizeController,
                    decoration: TextFieldDecoration("Set Size"),
                  )
                ],
              ),
            ),
          ),
        );
      },
      child: Consumer<HouseProvider>(builder: (context, house, child) {
        return Row(
          children: [
            Icon(
                size: 16,
                color: Colors.grey.shade700,
                Icons.bedroom_parent_rounded),
            const SizedBox(
              width: 5,
            ),
            Text(
              (widget.house.roomQty <= 1)
                  ? "${widget.house.roomQty} Room"
                  : "${widget.house.roomQty} Rooms",
              style: TextStyle(fontSize: 16, color: Colors.grey.shade700),
            ),
            Expanded(child: Container()),
            Icon(
                color: Colors.grey.shade700,
                size: 16,
                Icons.square_foot_rounded),
            const SizedBox(
              width: 5,
            ),
            Text(
              "${widget.house.sizeInFeet} square feet",
              style: TextStyle(fontSize: 16, color: Colors.grey.shade700),
            ),
          ],
        );
      }),
    );
  }
}
