import 'package:flutter/material.dart';
import 'package:fteam_challenge/app/presentation/core/helpers/context_theme.dart';
import 'package:get/route_manager.dart';

import '../../../../domain/entities/character_entity.dart';
import '../../../ui/theme/app_colors.dart';

class DetailsCharacterView extends StatelessWidget {
  const DetailsCharacterView({super.key});

  @override
  Widget build(BuildContext context) {
    final CharacterEntity character = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          character.name,
          style: context.textTheme.titleLarge!.copyWith(
            fontWeight: FontWeight.bold,
            color: AppColors.surface,
          ),
        ),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 15,
            children: [
              Center(
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      fit: BoxFit.contain,
                      image: NetworkImage(character.image),
                    ),
                  ),
                ),
              ),
              Divider(),
              Text(
                'Details',
                style: context.textTheme.headlineSmall!.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),

              RowTextIcon(
                text: 'Name: ${character.name}',
                icon: Icons.person_2,
              ),

              RowTextIcon(
                text: 'Status: ${character.status}',
                icon: Icons.star,
              ),

              RowTextIcon(
                text: ' Species: ${character.species}',
                icon: Icons.pets_outlined,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RowTextIcon extends StatelessWidget {
  final String text;
  final IconData icon;

  const RowTextIcon({super.key, required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10,
      children: [
        Icon(icon),
        Text(text, style: context.textTheme.bodyMedium),
      ],
    );
  }
}
