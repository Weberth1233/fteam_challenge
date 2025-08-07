import 'package:flutter/material.dart';
import 'package:fteam_challenge/app/domain/entities/character_entity.dart';
import 'package:get/get.dart';

import '../../../../ui/theme/app_colors.dart';

class CharacterListTile extends StatelessWidget {
  final CharacterEntity item;
  const CharacterListTile({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(90),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(
                alpha: 0.2,
              ), // cor da sombra com opacidade
              spreadRadius: 2, // quanto a sombra se espalha
              blurRadius: 2, // o quão borrada é a sombra
              offset: Offset(0.6, 3), // deslocamento horizontal e vertical
            ),
          ],
          image: DecorationImage(image: NetworkImage(item.image)),
        ),
      ),
      title: Text(
        item.name,
        style: context.textTheme.bodyMedium!.copyWith(
          fontWeight: FontWeight.w600,
          color: AppColors.textSecondary,
        ),
      ),
    );
  }
}
