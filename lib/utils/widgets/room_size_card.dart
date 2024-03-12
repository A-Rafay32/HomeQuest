import 'package:flutter/material.dart';
import 'package:real_estate_app/features/home/models/house.dart';

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
  @override
  Widget build(BuildContext context) {
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
        Icon(color: Colors.grey.shade700, size: 16, Icons.square_foot_rounded),
        const SizedBox(
          width: 5,
        ),
        Text(
          "${widget.house.sizeInFeet} square feet",
          style: TextStyle(fontSize: 16, color: Colors.grey.shade700),
        ),
      ],
    );
  }
}
