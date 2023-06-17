import 'package:flutter/material.dart';
import 'package:flutter_counter/Bloc/counter_bloc.dart';

/// Flutter code sample for [Scaffold].

void main() => runApp(const ScaffoldExampleApp());

final Counterbloc = CounterBloc();

class ScaffoldExampleApp extends StatelessWidget {
  const ScaffoldExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ScaffoldExample(),
    );
  }
}

class ScaffoldExample extends StatefulWidget {
  const ScaffoldExample({super.key});

  @override
  State<ScaffoldExample> createState() => _ScaffoldExampleState();
}

class _ScaffoldExampleState extends State<ScaffoldExample> {

  // int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sample Code'),
      ),
      body: Center(
          child: StreamBuilder <int >(
            stream: Counterbloc.count$,
              builder: ( context, snapshot) {
            print('snapshot.data ${snapshot.data}');
            if(snapshot.hasData){
              return Text('You have pressed the button ${snapshot.data} times.');
            } else {
              return const CircularProgressIndicator();
            }
          }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            Counterbloc.addCounter();
          });
        },
        tooltip: 'Increment Counter',
        child: const Icon(Icons.add),
      ),
    );
  }
}

