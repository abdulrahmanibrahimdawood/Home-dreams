import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:home_dreams/constants.dart';

class SearchHistoryCubit extends Cubit<List<String>> {
  SearchHistoryCubit() : super([]);

  final _box = Hive.box(kSearchHistoryBox);

  void loadHistory() {
    emit(_box.get('history', defaultValue: <String>[])!.cast<String>());
  }

  void addSearch(String term) {
    List<String> history = List.from(state);

    history.remove(term);
    history.insert(0, term);

    if (history.length > 10) {
      history = history.sublist(0, 10);
    }

    _box.put('history', history);
    emit(history);
  }

  void removeSearch(String term) {
    List<String> history = List.from(state);
    history.remove(term);
    _box.put('history', history);
    emit(history);
  }

  void clearHistory() {
    _box.put('history', []);
    emit([]);
  }
}
