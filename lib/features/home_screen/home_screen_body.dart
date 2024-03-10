import 'package:flutter/material.dart';
import 'package:real_estate_app/app/themes/app_paddings.dart';

import '../../utils/widgets/custom_button.dart';
import '../auth/screens/login_screen.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.h,
      width: context.w,
      child: const SingleChildScrollView(
        child: Column(children: []),
      ),
    );
  }
}
