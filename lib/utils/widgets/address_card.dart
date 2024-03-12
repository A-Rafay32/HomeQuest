import 'package:flutter/material.dart';
import 'package:real_estate_app/features/home/models/house.dart';

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
        Align(
          alignment: Alignment.centerLeft,
          child: Text(widget.house.address,
              style: const TextStyle(
                color: Colors.grey,
                fontFamily: "Raleway",
                fontSize: 15,
              )),
        ),
      ],
    );
  }
}
