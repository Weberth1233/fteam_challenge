import 'package:flutter/material.dart';
import 'package:fteam_challenge/app/presentation/core/helpers/context_theme.dart';
import 'package:get/route_manager.dart';

import '../../../../domain/entities/character_entity.dart';

class DetailsCharacterView extends StatelessWidget {
  const DetailsCharacterView({super.key});

  @override
  Widget build(BuildContext context) {
    final CharacterEntity character = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Details ${character.name}',
          style: context.textTheme.displayLarge,
        ),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 15,
            children: [
              Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(character.image),
                  ),
                ),
              ),
              Text(
                'Name: ${character.name}',
                style: context.textTheme.titleLarge,
              ),
              Text(
                'Status: ${character.status}',
                style: context.textTheme.titleLarge,
              ),
              Text(
                'Species: ${character.species}',
                style: context.textTheme.titleLarge,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
