import 'package:home_dreams/features/search/domain/entities/keyword_entity.dart';

class KeywordModel {
  final String searchKeyWord;
  KeywordModel({required this.searchKeyWord});

  factory KeywordModel.fromEntity(KeywordEntity keywordEntity) =>
      KeywordModel(searchKeyWord: keywordEntity.searchKeyWord);

  KeywordEntity toEntity() {
    return KeywordEntity(searchKeyWord: searchKeyWord);
  }

  toJson() => {'searchKeyWord': searchKeyWord};

  factory KeywordModel.fromJson(Map<String, dynamic> json) =>
      KeywordModel(searchKeyWord: json['searchKeyWord']);
}
