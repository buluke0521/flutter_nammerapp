import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
class MaterialAppExample extends StatefulWidget{
  @override
  _MaterialAppExampleState createState()=>_MaterialAppExampleState();
}

class _MaterialAppExampleState extends State<MaterialAppExample>{
  GlobalKey<NavigatorState> _navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: _navigatorKey,
      home: Center(
        child: Text("MaterialApp"),
      ),
    );
  }

}
