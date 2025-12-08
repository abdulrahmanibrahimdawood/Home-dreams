import 'package:home_dreams/features/search/domain/entities/keyword_entity.dart';

class KeywordModel {
  final String searchKeyWord;
  KeywordModel({required this.searchKeyWord});

  factory KeywordModel.fromEntity(KeywordEntity keywordEntity) =>
      KeywordModel(searchKeyWord: keywordEntity.searchKeyWord);

  toJson() => {'searchKeyWord': searchKeyWord};
}
