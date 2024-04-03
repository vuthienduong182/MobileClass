import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:ch4_starter_exercise/pages/home.dart';


void main() {
  runApp(MaterialApp(
    home: SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue,
            title: const Text("App vớ vẩn"),
          ),
          body: MyWidget()
      ),
    ),
    debugShowCheckedModeBanner: false,
  ));
}

class MyWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                  onPressed: null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.blue,
                  ),
                  child: Column(
                    children: [
                      Icon(Icons.call,color: Colors.blue,),
                      Text("Call", style: TextStyle(
                        color: Colors.blue,
                      ),),
                    ],
                  ),
              )
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                onPressed: null,
                child: Column(
                  children: [
                    Icon(Icons.route, color: Colors.blue),
                    Text("Route", style: TextStyle(
                     color: Colors.blue,
                    ),
                    )
                  ],
                ),
              )
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                onPressed: null,
                child: Column(
                  children: [
                    Icon(Icons.share, color: Colors.blue),
                    Text("Share", style: TextStyle(
                      color: Colors.blue,
                    ),)
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

//
// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context){
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Starter Template',
//       theme: ThemeData(
//         primarySwatch: Colors.lightGreen,
//         appBarTheme: AppBarTheme(
//           iconTheme: IconThemeData(color: Colors.black),
//           color: Colors.lightGreen,
//         )
//       ),
//       home: Home(),
//     );
//   }
// }