import 'package:ez_homes/contants.dart';
import 'package:flutter/material.dart';

import '../../../model/house.dart';
import '../../../utils/dialogboxes.dart';
import '../../../data/database_service/house_database.dart';

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
                  HouseDBHelper.updateHouseDesc(
                      widget.house.address, newDescription);
                  Navigator.of(context).pop();
                  _controller.clear();
                },
              ),
            ],
            content: SizedBox(
              height: 300,
              width: 300,
              child: Column(
                children: [
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a name';
                      }
                      return null;
                    },
                    maxLines: 3,
                    style: const TextStyle(
                      fontFamily: "Raleway",
                    ),
                    onChanged: (value) {
                      newDescription = value;
                    },
                    controller: _controller,
                    decoration: TextFieldDecoration("Set New Description"),
                  )
                ],
              ),
            ),
          ),
        );
      },
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          "${widget.house.description} ",
          style: const TextStyle(
              fontFamily: "Raleway",
              color: Colors.grey,
              fontSize: 15,
              fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
