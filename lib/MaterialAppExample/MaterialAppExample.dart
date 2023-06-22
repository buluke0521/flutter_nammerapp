import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/**
 * this example show MaterialApp
 * it is a StatefulWidget, means it contains a state object
 */
class MaterialAppExample extends StatefulWidget{
  @override
  _MaterialAppExampleState createState()=>_MaterialAppExampleState();
}

// this is the State Object
class _MaterialAppExampleState extends State<MaterialAppExample>{
  GlobalKey<NavigatorState> _navigatorKey = GlobalKey();
  GlobalKey<ScaffoldMessengerState> _scaffoldMessengerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: _navigatorKey,
      scaffoldMessengerKey: _scaffoldMessengerKey,
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // show dialog with context;
            // showDialog(
            //     context: context,
            //     builder: (_)=>AlertDialog(
            //       title: Text("alert_title"),
            //     ));
            // Dialog with out context;
            // showDialog(
            //     context: _navigatorKey.currentState!.overlay!.context,
            //     builder: (_)=>AlertDialog(
            //       title: Text("alert_title"),
            //     ));
            // SnackBar with out context
            _scaffoldMessengerKey.currentState?.showSnackBar(
                SnackBar(
                    content: Text('ScaffoldMessenger')
                )
            );
          },
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        appBar: AppBar(
          title: Text('MaterialApp'),
        ),
        body: Center(child: Text('this is center'),
        ),
      ),
      routes: {
        "/A": (_)=>A(),
        "/B": (_)=>B(),
      },
      initialRoute: "/A",
      //when can not find router,we can give a default page
      onGenerateRoute: (setting){
        print(setting.name);
        print(setting.arguments);
        return MaterialPageRoute(builder: (_)=>B());
      },
      navigatorObservers: [
        MyObserver(),
      ],
    );
  }
}

class A extends StatefulWidget {
  const A({super.key});

  @override
  State<A> createState() => _AState();
}

class _AState extends State<A> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("A-title")),
      body: Center(
        child: TextButton(
          onPressed: () {
            Navigator.pushNamed(context, "/B");
          },
          child: Text("Click-Jump2-B"),
        ),
      ),
    );
  }
}

class B extends StatefulWidget {
  const B({super.key});

  @override
  State<B> createState() => _BState();
}

class _BState extends State<B> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("B-title")),
      body: Center(
        child: TextButton(
          onPressed: () {
            Navigator.pushNamed(context, "/CC");
          },
          child: Text("Click-Jump2-CC"),
        ),
      ),
    );
  }
}

//Observer used to watch Navigator actions
class MyObserver extends NavigatorObserver{

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    print("==========");
    print(previousRoute);
    print(route);
    print("==========");
    super.didPush(route, previousRoute);
  }

}



