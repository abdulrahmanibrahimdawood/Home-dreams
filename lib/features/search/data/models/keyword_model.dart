import 'package:home_dreams/features/search/domain/entities/keyword_entity.dart';

class KeywordModel {
  final List<String> searchKeyWords;

  KeywordModel({required this.searchKeyWords});

  factory KeywordModel.fromEntity(KeywordEntity keywordEntity) => KeywordModel(
    searchKeyWords: List<String>.from(keywordEntity.searchKeyWordList),
  );

  KeywordEntity toEntity() {
    return KeywordEntity(searchKeyWordList: List<String>.from(searchKeyWords));
  }

  Map<String, dynamic> toJson() => {
    "searchKeywords": List<String>.from(searchKeyWords),
  };

  factory KeywordModel.fromJson(Map<String, dynamic> json) => KeywordModel(
    searchKeyWords: List<String>.from(json["searchKeywords"] ?? []),
  );
}
