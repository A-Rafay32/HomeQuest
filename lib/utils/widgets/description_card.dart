import 'package:flutter/material.dart';
import 'package:real_estate_app/features/home/models/house.dart';

class DescriptionCard extends StatefulWidget {
  const DescriptionCard({
    super.key,
    required this.house,
  });

  final House house;

  @override
  State<DescriptionCard> createState() => _DescriptionCardState();
}

class _DescriptionCardState extends State<DescriptionCard> {
  final TextEditingController _controller = TextEditingController();
  String newDescription = '';

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _controller.text = widget.house.description;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        "${widget.house.description} ",
        style: const TextStyle(
            fontFamily: "Raleway",
            color: Colors.grey,
            fontSize: 15,
            fontWeight: FontWeight.w600),
      ),
    );
  }
}
