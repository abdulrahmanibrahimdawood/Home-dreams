import 'package:hive/hive.dart';
import 'package:home_dreams/constants.dart';

class SearchHistoryService {
  static final Box _box = Hive.box(kSearchHistoryBox);

  static List<String> getHistory() {
    return _box.get('history', defaultValue: <String>[])!.cast<String>();
  }

  static void addSearch(String term) {
    List<String> history = getHistory();
    history.remove(term);
    history.insert(0, term);
    if (history.length > 10) {
      history = history.sublist(0, 10);
    }
    _box.put('history', history);
  }

  static void removeSearch(String term) {
    List<String> history = getHistory();
    history.remove(term);
    _box.put('history', history);
  }

  static void clearHistory() {
    _box.put('history', []);
  }
}
