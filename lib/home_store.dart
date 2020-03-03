import 'package:rxdart/rxdart.dart';

class HomeStore {
  static var shared = HomeStore();
  var counter = BehaviorSubject<int>.seeded(7);
}