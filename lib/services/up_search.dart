import 'package:rxdart/subjects.dart';
import 'package:rxdart/rxdart.dart';

class UpSearchService {
  final BehaviorSubject<String?> _search = BehaviorSubject.seeded(null);
  Stream get stream$ => _search.stream;
  String? get current => _search.valueWrapper?.value;

  update(newValue) {
    _search.add(newValue);
  }

  remove() {
    update("");
  }
}
