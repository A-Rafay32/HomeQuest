import 'package:flutter/material.dart';
import 'package:real_estate_app/core/enums/house_type.dart';
import 'package:real_estate_app/features/home/models/house.dart';

class PriceCard extends StatefulWidget {
  const PriceCard({
    super.key,
    required this.house,
  });

  final House house;

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
        child: Align(
      alignment: Alignment.centerLeft,
      child: Text(
        (widget.house.housetype == HouseType.Rent ||
                widget.house.housetype == HouseType.Rented)
            ? "${widget.house.pricePerMonth} USD Per Month "
            : "${widget.house.salePrice} USD ",
        style: const TextStyle(
            fontFamily: "Raleway", fontSize: 21, fontWeight: FontWeight.w600),
      ),
    ));
  }
}
