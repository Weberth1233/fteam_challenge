import 'package:flutter/material.dart';
import 'package:fteam_challenge/app/presentation/features/character/viewmodel/character_view_model.dart';
import 'package:fteam_challenge/app/presentation/ui/theme/app_colors.dart';
import 'package:get/get.dart';

import 'details_character_view.dart';
import 'widgets/character_list_tile.dart';

class CharacterView extends StatelessWidget {
  CharacterView({super.key});

  final CharacterViewModel controller = Get.put(
    CharacterViewModel(useCaseImpl: Get.find()),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          'APP - Rick and Morty',
          style: context.textTheme.titleLarge!.copyWith(
            fontWeight: FontWeight.bold,
            color: AppColors.surface,
          ),
        ),
      ),
      body: Obx(() {
        if (controller.charactersList.isEmpty && controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.charactersList.isEmpty && !controller.isLoading.value) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Recurso não encontrado!'),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: controller.refreshCharacters,
                  child: const Text('Tentar novamente'),
                ),
              ],
            ),
          );
        }

        return Container(
          margin: EdgeInsets.symmetric(horizontal: 2, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ListView.builder(
                  controller: controller.scrollController,
                  itemCount: controller.charactersList.length,
                  itemBuilder: (context, index) {
                    final item = controller.charactersList[index];
                    return GestureDetector(
                      onTap: () {
                        Get.to(
                          () => const DetailsCharacterView(),
                          arguments: item,
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: CharacterListTile(item: item),
                      ),
                    );
                  },
                ),
              ),
              if (controller.isLoading.value)
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: CircularProgressIndicator(),
                ),
            ],
          ),
        );
      }),
    );
  }
}
