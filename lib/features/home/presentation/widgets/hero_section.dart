import 'package:flutter/material.dart';
import 'package:tejas_palyekar_portfolio/features/home/domain/models/home_model.dart';

class HeroSection extends StatelessWidget {
  final HomeModel data;

  const HeroSection({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 80,
          backgroundImage: AssetImage('assets/images/profile_image.jpeg'),
        ),
        const SizedBox(height: 16),
        Text(
          data.name,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        const SizedBox(height: 8),
        Text(
          data.role,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 16),
        Text(
          data.description,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ],
    );
  }
}
