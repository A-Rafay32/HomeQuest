import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../app/constants/contants.dart';

class ResultScreen extends StatefulWidget {
  ResultScreen({
    super.key,
    required this.status,
  });
  bool status;
  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  get size => null;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text("Status"),
        actions: [
          Container(
            height: 10,
            width: 10,
            margin: const EdgeInsets.only(top: 10, left: 10, bottom: 10),
            decoration: BoxDecoration(
                color: Colors.grey.shade300, shape: BoxShape.circle),
            child: IconButton(
              onPressed: () {
                Navigator.popUntil(context, (route) => route.isFirst);
              },
              icon: const Icon(
                  // size: 20,
                  size: 20,
                  color: Colors.white,
                  Icons.arrow_back_ios_rounded),
            ),
          ),
        ],
        bottom: PreferredSize(
            preferredSize: size * 0.01,
            child: const Divider(
              endIndent: 10,
              indent: 10,
              height: 5,
              color: primaryColor,
            )),
        titleTextStyle: const TextStyle(
            color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
      ),
      body: Container(
          height: size.height,
          width: size.width,
          padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.1, vertical: size.height * 0.07),
          child: Column(
            children: [
              if (widget.status == true) SuccessScreen(size: size),
              if (widget.status == false) FailedScreen(size: size),
            ],
          )),
    );
  }
}

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text(
            "Transaction Successful!",
            style: Theme.of(context)
                .textTheme
                .headlineMedium
                ?.copyWith(fontWeight: FontWeight.w500),
          ),
        ),
        SizedBox(
          height: size.height * 0.5,
          width: size.width,
          child: FittedBox(
              child: SvgPicture.asset(
            "assets/images/check-circle.svg",
            colorFilter: const ColorFilter.mode(primaryColor, BlendMode.srcIn),
          )),
        )
      ],
    );
  }
}

class FailedScreen extends StatelessWidget {
  const FailedScreen({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text(
            "Error!!",
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(fontWeight: FontWeight.w500, color: Colors.red),
          ),
        ),
        Center(
          child: Text(
            "Transaction Unsuccessful",
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(fontWeight: FontWeight.w500),
          ),
        ),
        SizedBox(
          height: size.height * 0.5,
          width: size.width,
          child: FittedBox(
              child: SvgPicture.asset(
            "assets/images/error.svg",
            colorFilter: const ColorFilter.mode(Colors.red, BlendMode.srcIn),
          )),
        )
      ],
    );
  }
}
