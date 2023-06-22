import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'MyInheritedWidget.dart';

class InheritedWidgetExample extends StatefulWidget {
  const InheritedWidgetExample({super.key});

  @override
  State<InheritedWidgetExample> createState() => _InheritedWidgetExampleState();
}

class _InheritedWidgetExampleState extends State<InheritedWidgetExample> {
  //Local UI data
  int _count = -10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('InheritedWidgetExample'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _count++;
          });
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: Center(
        child: MyInheritedWidget(
          //here we link local data into InheritedWidget
          count: _count,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              WidgetA(),
              WidgetB(),
            ],
          ),
        ),
      ),
    );
  }
}

class WidgetA extends StatelessWidget {
  const WidgetA({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.findAncestorStateOfType<_InheritedWidgetExampleState>();
    return Text("local count from local state is :"+appState!._count.toString());
  }
}

class WidgetB extends StatelessWidget {
  const WidgetB({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      MyInheritedWidget.of(context)!.count.toString(),
      style: TextStyle(
          color: Colors.green,
          fontSize: 100
      ),
    );
  }
}


