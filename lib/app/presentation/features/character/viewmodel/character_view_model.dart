import 'package:flutter/material.dart';
import 'package:fteam_challenge/app/domain/core/failures/failures.dart';
import 'package:fteam_challenge/app/domain/usecases/use_case_impl.dart';
import 'package:get/get.dart';

import '../../../../domain/entities/character_entity.dart';

class CharacterViewModel extends GetxController {
  final UseCaseImpl useCaseImpl;
  final isLoading = false.obs;
  final isLoadingMore = false.obs;
  final currentPage = 1.obs;
  final charactersList = <CharacterEntity>[].obs;

  final scrollController = ScrollController();

  CharacterViewModel({required this.useCaseImpl});

  @override
  void onInit() {
    //Usando o init do proprio getx para carregar os dados
    super.onInit();
    fetchCharacters();
    //Adicionando scrool para quando o usuário chegar no fim da lista
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
              scrollController.position.maxScrollExtent - 200 &&
          !isLoadingMore.value) {
        loadMore();
      }
    });
  }

  Future<void> fetchCharacters({bool isRefresh = false}) async {
    if (isLoading.value) return;

    isLoading.value = true;
    isLoadingMore.value = true;

    final result = await useCaseImpl.fetchResults(
      'character?page=${currentPage.value}',
    );
    result.fold(
      (failure) {
        //Metodo para trabalhar os erros
        _handleFailure(failure);
      },
      (results) {
        if (isRefresh) {
          //caso a variavel seja refresh venda da view como true limpa a lista
          charactersList.clear();
        }
        //Apenas adiciona os resultados na lista
        charactersList.addAll(results);
        isLoadingMore.value = false;
      },
    );
    isLoading.value = false;
  }

  void loadMore() {
    currentPage.value++;
    fetchCharacters();
  }

  void refreshCharacters() {
    currentPage.value = 1;
    fetchCharacters(isRefresh: true);
  }

  void _handleFailure(Failure failure) {
    isLoadingMore.value = false;

    if (failure is ServerFailure) {
      Get.defaultDialog(
        title: 'Erro no servidor!',
        middleText: failure.message,
      );
    } else if (failure is UnknownFailure) {
      Get.defaultDialog(
        title: 'Erro desconhecido!',
        middleText: failure.message,
      );
    }
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}
