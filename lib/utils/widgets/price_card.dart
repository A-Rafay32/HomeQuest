import 'package:ez_homes/contants.dart';
import 'package:ez_homes/model/house.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../utils/dialogboxes.dart';
import '../../../view_model/house_provider.dart';

class PriceCard extends StatefulWidget {
  PriceCard({
    super.key,
    required this.house,
  });

  House house;

  @override
  State<PriceCard> createState() => _PriceCardState();
}

class _PriceCardState extends State<PriceCard> {
  String newPrice = "";
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onDoubleTap: () {
          EditPrice(context);
        },
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            (widget.house.housetype == houseType.forRent ||
                    widget.house.housetype == houseType.Rented)
                ? "${widget.house.pricePerMonth} USD Per Month "
                : "${widget.house.salePrice} USD ",
            style: const TextStyle(
                fontFamily: "Raleway",
                fontSize: 21,
                fontWeight: FontWeight.w600),
          ),
        ));
  }

  Future<dynamic> EditPrice(BuildContext context) {
    return showDialog(
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
              widget.house.housetype == houseType.forRent
                  ? Provider.of<HouseProvider>(context, listen: false)
                      .updateRentPrice(
                          widget.house.address, int.parse(newPrice))
                  : Provider.of<HouseProvider>(context, listen: false)
                      .updateSalePrice(
                          widget.house.address, int.parse(newPrice));
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
              TextFormField(
                validator: (value) {
                  final numericValue = int.tryParse(value.toString());
                  if (numericValue == null || numericValue < 0) {
                    return 'Value must be a positive number';
                  }
                  return null;
                },
                style: const TextStyle(
                  fontFamily: "Raleway",
                ),
                onChanged: (value) {
                  widget.house.housetype == houseType.forRent
                      ? newPrice = value
                      : newPrice = value;
                },
                controller: _controller,
                decoration: TextFieldDecoration("Set New Price"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
