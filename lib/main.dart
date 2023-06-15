import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
          appBar: AppBar(
            title: Text('카운터'),
          ),
          body: Counter()),
    );
  }
}

class Counter extends StatefulWidget {
  const Counter({Key? key}) : super(key: key);

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
final counterSubject = BehaviorSubject<int>();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ElevatedButton(
            child: Text('add'),
            onPressed: () {},
          ),
          StreamBuilder<int>(
            stream: counterSubject.stream, // 카운터서브젝틀를
            builder: (context, snapshot){
              if(!snapshot.hasData){
                return Text(
                  '$snapshot.data',
                  style: TextStyle(fontSize: 30),
                );
              }
            }
          ),
        ],
      ),
    );
  }
}
