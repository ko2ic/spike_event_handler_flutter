import 'package:flutter/material.dart';

import 'event_handler.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
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

  LifecycleEventHandler _eventHandler;

  @override
  void initState() {
    super.initState();
    _eventHandler = LifecycleEventHandler(inactiveCallBack: () {
      print("-----------------------inactive");
      return;
    }, pauseCallBack: () {
      print("-----------------------pause");
      return;
    }, suspendingCallBack: () {
      print("-----------------------suspending");
      return;
    }, resumeCallBack: () {
      print("-----------------------resume");
      return;
    });
    WidgetsBinding.instance.addObserver(_eventHandler);

    WidgetsBinding.instance.addObserver(MetricsChangeHandler());

    WidgetsBinding.instance.addObserver(LoacaleChangeHandler());
    WidgetsBinding.instance.addObserver(TransitionHandler());
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(_eventHandler);
    super.dispose();
  }
}
