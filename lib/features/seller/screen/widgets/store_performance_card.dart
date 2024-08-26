import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:real_estate_app/app/themes/app_colors.dart';

class StorePerformanceWidget extends StatelessWidget {
  const StorePerformanceWidget({
    super.key,
    required this.allowButton,
    required this.title,
    required this.onTap,
    required this.children,
  });

  final bool allowButton;
  final String title;
  final Function() onTap;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(428, 926));
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                blurRadius: 30,
                color: Colors.grey.shade200,
                offset: const Offset(20, 20)),
            BoxShadow(
                blurRadius: 30,
                color: Colors.grey.shade200,
                offset: const Offset(-20, -20))
          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: AppColors.textBlackColor,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700),
                ),
                const Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                  color: Colors.black87,
                ),
              ],
            ),
            const SizedBox(height: 8),
            // if (allowButton)
            //   SvgCustomButton(
            //       svg: "assets/exports/add.svg",
            //       textColor: Colors.white,
            //       svgColor: Colors.white,
            //       textBold: true,
            //       width: 338.w,
            //       text: "Add Product",
            //       paddingVert: 10,
            //       backgroundColor: AppColors.primaryColor,
            //       onTap: () {}),
            // const SizedBox(height: 8),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: children),
          ],
        ),
      ),
    );
  }
}

class PerformanceSection extends StatelessWidget {
  final String title;
  final String value;
  final Color valueColor;

  const PerformanceSection(
      {Key? key,
      required this.title,
      required this.value,
      required this.valueColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Text(
            value,
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
                fontSize: 24.sp,
                color: valueColor,
                fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
                fontSize: 15.sp,
                color: AppColors.textBlackColor,
                fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}

class SvgCustomButton extends StatefulWidget {
  SvgCustomButton({
    required this.width,
    required this.text,
    this.textColor,
    this.paddingVert,
    this.fieldCheck,
    required this.backgroundColor,
    required this.svg,
    required this.svgColor,
    this.textBold,
    this.borderColor,
    this.textSize,
    this.svgSize,
    this.paddingHorz,
    required this.onTap,
    super.key,
  });

  final double width;
  bool? fieldCheck;
  final double? paddingVert;
  final double? paddingHorz;
  final String text;
  final double? svgSize;
  final String svg;
  final Color svgColor;
  Color? textColor;
  Color backgroundColor;
  Color? borderColor;
  final bool? textBold;
  final double? textSize;
  final void Function()? onTap;

  @override
  State<SvgCustomButton> createState() => _SvgCustomButtonState();
}

class _SvgCustomButtonState extends State<SvgCustomButton> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(428, 926));
    return GestureDetector(
        onTap: widget.onTap,
        child: Container(
          width: widget.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: widget.backgroundColor,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: widget.paddingHorz ?? 5,
                vertical: widget.paddingVert ?? 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  widget.svg,
                  height: widget.svgSize,
                  width: widget.svgSize,
                  colorFilter:
                      ColorFilter.mode(widget.svgColor, BlendMode.srcIn),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Text(widget.text,
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w900,
                        color: widget.textColor)),
              ],
            ),
          ),
        ));
  }
}
