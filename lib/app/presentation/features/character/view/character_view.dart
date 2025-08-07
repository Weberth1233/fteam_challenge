import 'package:flutter/material.dart';
import 'package:fteam_challenge/app/presentation/features/character/viewmodel/character_view_model.dart';
import 'package:get/get.dart';

import '../../../../domain/usecases/use_case_impl.dart';
import 'details_character_view.dart';

class CharacterView extends StatefulWidget {
  const CharacterView({super.key});

  @override
  State<CharacterView> createState() => _CharacterViewState();
}

class _CharacterViewState extends State<CharacterView> {
  final _controller = CharacterViewModel(useCaseImpl: Get.find<UseCaseImpl>());
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.fethCharacters();

    //Criando um listener para o scroll para quando chegar no final da lista ele carregar os de mais itens
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 200) {
        if (_controller.isLoadingMore.value) {
          _controller.initial.value += 1;
          _controller.fethCharacters();
        }
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          'APP - Rick and Morty',
          style: context.textTheme.displayLarge,
        ),
      ),
      body: Obx(
        () => _controller.isLoadingMore.value
            ? Column(
                children: [
                  Expanded(
                    child: ListView(
                      controller: _scrollController,
                      children: _controller.charactersLits
                          .map(
                            (item) => GestureDetector(
                              onTap: () {
                                Get.to(
                                  () => const DetailsCharacterView(),
                                  arguments: item,
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 8,
                                ),
                                child: ListTile(
                                  leading: Image.network(
                                    item.image,
                                    height: 120,
                                    width: 70,
                                    fit: BoxFit.fill,
                                  ),
                                  title: Text(
                                    item.name,
                                    style: context.textTheme.bodyMedium,
                                  ),
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                  _controller.isLoading.value
                      ? Center(child: CircularProgressIndicator())
                      : Container(),
                ],
              )
            : Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Recurso não encontrado!'),
                    ElevatedButton(
                      onPressed: () {
                        _controller.initial.value = 1;
                        _controller.charactersLits.clear();
                        _controller.fethCharacters();
                      },
                      child: Text('Tentar novamente'),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}

// Obx(
//         () => _controller.isLoading.value
//             ? Center(child: CircularProgressIndicator())
//             : ListView(
//                 controller: _scrollController,
//                 children: _controller.charactersLits
//                     .map(
//                       (item) => GestureDetector(
//                         onTap: () {
//                           Get.to(
//                             () => const DetailsCharacterView(),
//                             arguments: item,
//                           );
//                         },
//                         child: Padding(
//                           padding: const EdgeInsets.symmetric(vertical: 8),
//                           child: ListTile(
//                             leading: Image.network(item.image, scale: 1.2),
//                             title: Text(item.name),
//                           ),
//                         ),
//                       ),
//                     )
//                     .toList(),
//               ),
//       ),
