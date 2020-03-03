import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'home_store.dart';
import 'dart:async';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page', store: HomeStore.shared),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title, this.store}) : super(key: key);

  final String title;
  final HomeStore store;

  @override
  _MyHomePageState createState() => _MyHomePageState(store);
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter;
  HomeStore _store;

  _MyHomePageState(HomeStore store) {
    this._store = store;
    _store.counter.stream.listen((value) {
      setState(() {
        _counter = value;
      });
    });
  }

  void _incrementCounter({int increment = 1}) {
    _store.counter.add(_counter + increment);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
            RaisedButton(
              child: Text("You can increment the above number much more."),
              onPressed: () {
                _incrementCounter(increment: 65535);
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
