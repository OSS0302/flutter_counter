import 'package:flutter/material.dart';

class Counter with ChangeNotifier{

  int _count =0;

  int get count => _count; // 카운트를 getter 추가히기

  void increment(){
    _count++;
    notifyListeners(); // 상태가 변할때 다른곳에서 감지 하도록 한다.
  }
}
