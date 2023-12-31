import 'package:rxdart/rxdart.dart';
class CounterBloc {
  int _count = 0;

  // 카운터앱을 모니터링하기 위해서
  final _countSubject = BehaviorSubject.seeded(0);

  // Stream 추가
  Stream<int> get count$ => _countSubject.stream;

  void addCounter(){
    _count++;
    _countSubject.add(_count); // BehaviorSubject 위해서 마지막 카운트 값을 출력한다.
    _countSubject.value++;
  }

}
