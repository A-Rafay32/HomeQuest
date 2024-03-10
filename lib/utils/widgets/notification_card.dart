import 'package:flutter/material.dart';

class NotficationCard extends StatelessWidget {
  const NotficationCard({
    required this.text,
    required this.title,
    super.key,
  });

  final String title;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: h*0.15,
      // width: w ,
      margin: const EdgeInsets.all(13.0),
      padding: const EdgeInsets.all(13),
      decoration: BoxDecoration(
          color: Colors.grey.shade200, borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          Container(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                title,
                style: const TextStyle(
                    fontFamily: "Raleway",
                    fontSize: 17,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              text,
              style: const TextStyle(
                  fontFamily: "Raleway",
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
          )
        ],
      ),
    );
  }
}
