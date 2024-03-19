import 'package:flutter/material.dart';
import 'package:real_estate_app/app/themes/app_colors.dart';
import 'package:real_estate_app/app/themes/app_paddings.dart';

class HouseImages extends StatelessWidget {
  const HouseImages({
    super.key,
    required this.houseImages,
    required this.name,
    required this.price,
    required this.onTap,
  });

  final String houseImages;
  final String name;
  final String price;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                houseImages,
                fit: BoxFit.cover,
                width: context.w * 0.7,
                height: context.h,
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: context.w * 0.7,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: AppColors.imageGradient,
                ),
              ),
            ),
            const Positioned(top: 20, right: 10, child: FavIcon()),
            Positioned(
              bottom: 10,
              left: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                  ),
                  // AppSizes.tinyY,
                  Text(
                    price,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                  ),
                  AppSizes.tinyY,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const IconCard(icon: Icons.bed_outlined),
                      Text(
                        "123",
                        style: context.textTheme.bodyMedium
                            ?.copyWith(color: Colors.white),
                      ),
                      const IconCard(icon: Icons.bathtub_outlined),
                      Text(
                        "123",
                        style: context.textTheme.bodyMedium
                            ?.copyWith(color: Colors.white),
                      ),
                      const IconCard(icon: Icons.star_border_rounded),
                      Text(
                        "123",
                        style: context.textTheme.bodyMedium
                            ?.copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FavIcon extends StatelessWidget {
  const FavIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return const Card(
      elevation: 5.0,
      color: Colors.white,
      shape: CircleBorder(),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Icon(
          Icons.favorite_outline_rounded,
          color: Colors.black,
          size: 20,
        ),
      ),
    );
  }
}

class IconCard extends StatelessWidget {
  const IconCard({super.key, required this.icon});

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      color: Colors.white,
      shape: const CircleBorder(),
      child: Padding(
        padding: AppPaddings.tiny,
        child: Icon(
          icon,
          color: Colors.black,
          size: 20,
        ),
      ),
    );
  }
}
