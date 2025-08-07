// data/models/info_model.dart

import 'package:fteam_challenge/app/domain/entities/info_entity.dart';

class InfoModel {
  final int count;
  final int pages;
  final String? next;
  final String? prev;

  factory InfoModel.fromJson(Map<String, dynamic> json) {
    return InfoModel(
      count: json['count'],
      pages: json['pages'],
      next: json['next'],
      prev: json['prev'],
    );
  }

  InfoModel({
    required this.count,
    required this.pages,
    required this.next,
    required this.prev,
  });

  Map<String, dynamic> toJson() {
    return {'count': count, 'pages': pages, 'next': next, 'prev': prev};
  }

  InfoEntity toEntity() {
    return InfoEntity(null, count: count, pages: pages, next: next, prev: prev);
  }
}
