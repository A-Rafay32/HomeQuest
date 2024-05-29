import 'package:flutter/material.dart';
import 'package:real_estate_app/features/home/models/house.dart';

class HouseDetailsCard extends StatefulWidget {
  const HouseDetailsCard({
    super.key,
    required this.house,
  });

  final House house;

  @override
  State<HouseDetailsCard> createState() => _HouseDetailsCardState();
}

class _HouseDetailsCardState extends State<HouseDetailsCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("House Details",
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  fontFamily: "Raleway",
                )),
        const SizedBox(height: 5),
        DetailCard(
          icon1: Icons.bedroom_parent_rounded,
          info1: (widget.house.roomQty <= 1)
              ? "${widget.house.roomQty} Bedroom"
              : "${widget.house.roomQty} Bedrooms",
          icon2: Icons.square_foot_outlined,
          info2: "${widget.house.sizeInFeet} square feet",
        ),
        DetailCard(
          icon1: Icons.bathtub,
          info1: (widget.house.bathroomQty <= 1)
              ? "${widget.house.bathroomQty} Bathroom "
              : "${widget.house.bathroomQty} Bathrooms ",
          icon2: Icons.living_rounded,
          info2: (widget.house.bathroomQty <= 1)
              ? "${widget.house.bathroomQty} Living Room"
              : "${widget.house.bathroomQty} Living Rooms",
        ),
        DetailCard(
          icon1: Icons.balcony,
          info1: "${widget.house.bathroomQty} Balcony ",
          icon2: Icons.kitchen,
          info2: "${widget.house.bathroomQty} Kitchen ",
        ),
      ],
    );
  }
}

class DetailCard extends StatelessWidget {
  const DetailCard({
    super.key,
    required this.icon1,
    required this.icon2,
    required this.info1,
    required this.info2,
  });

  final IconData icon1;
  final IconData icon2;
  final String info1;
  final String info2;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(size: 16, color: Colors.grey.shade700, icon1),
        const SizedBox(
          width: 5,
        ),
        Text(
          info1,
          style: TextStyle(
              fontFamily: "Raleway", fontSize: 16, color: Colors.grey.shade700),
        ),
        Expanded(child: Container()),
        Icon(color: Colors.grey.shade700, size: 16, icon2),
        const SizedBox(width: 5),
        Text(
          info2,
          style: TextStyle(
            fontFamily: "Raleway",
            fontSize: 16,
            color: Colors.grey.shade700,
          ),
        )
      ],
    );
  }
}
