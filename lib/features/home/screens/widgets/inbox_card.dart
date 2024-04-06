import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_estate_app/app/themes/app_colors.dart';

enum InboxType { read, Unread }

class InboxCard extends StatelessWidget {
  const InboxCard(
      {super.key,
      required this.onTap,
      required this.from,
      required this.date,
      required this.inboxType,
      required this.message});

  final String from;
  final String date;
  final String message;
  final InboxType inboxType;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: double.infinity,
        child: Card(
            color: Colors.orange.shade100,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    from,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          color: Colors.black,
                          fontSize: 19.sp,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                      text: date,
                      style:
                          Theme.of(context).textTheme.headlineMedium?.copyWith(
                                color: Colors.grey.shade600,
                                fontSize: 17.sp,
                              ),
                    ),
                    const WidgetSpan(
                        child: SizedBox(
                      width: 5,
                    )),
                    if (inboxType == InboxType.Unread)
                      TextSpan(
                        text: inboxType.name,
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium
                            ?.copyWith(
                              color: AppColors.primaryColor,
                              fontSize: 17.sp,
                            ),
                      )
                  ])),
                  SizedBox(
                    height: 8.h,
                  ),
                  Container(
                    width: 300.w,
                    padding: const EdgeInsets.all(4),
                    child: Text(
                      message,
                      textAlign: TextAlign.start,
                      style:
                          Theme.of(context).textTheme.headlineMedium?.copyWith(
                                color: inboxType == InboxType.Unread
                                    ? AppColors.primaryColor
                                    : Colors.grey.shade600,
                                fontSize: 17.sp,
                              ),
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
