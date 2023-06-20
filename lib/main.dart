import 'package:flutter/material.dart';
// import 'package:flutter_code/InheritedWidget/InheritedCount.dart';
import 'package:namer_app/MaterialAppExample/MaterialAppExample.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  //this widget is the root of your application
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demos',
      //this is the Theme of your application
      theme: ThemeData(
        //toolbar color
        primarySwatch: Colors.blue,
        //adapter to the platform you run
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(
          title:'Flutter Demos'
      ),
    );
  }
  
}

//This widget is our home page . It is stateful,
// meaning that it has a State Object that contains fields that affect how it looks
class MyHomePage extends StatefulWidget{
  MyHomePage({Key? key,required this.title}) : super(key:key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

//this class is the configuration for the state
class _MyHomePageState extends State<MyHomePage>{
  //we can use one list but two , to maintain title and page info
  List _pageList = [
    MaterialAppExample(),
  ];
  List _titleList = [
    "MaterialAppExample",
  ];

  //This method is return every time SetState is called
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //here we take value from MyHomePage
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
          itemBuilder: (context,index){
            return TextButton(
                onPressed: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => _pageList[index]
                      ),
                  );
                },
                child: Text(_titleList[index]),
            );
          },
        itemCount: _titleList.length,
      ),
    );
  }
}