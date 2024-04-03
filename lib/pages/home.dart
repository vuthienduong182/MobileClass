import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: (){},
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
        // flexibleSpace: SafeArea(
        //   child: Icon(
        //     Icons.photo_camera,
        //     size: 75.0,
        //     color: Colors.white70,
        //   ),
        // ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                const ContainerWithBoxDecorationWidget(),
              ],
            ),
          ),
        ),
      ),
      // body: SafeArea(
      //   child: SingleChildScrollView(
      //     child: Padding(
      //       padding: EdgeInsets.all(16.0),
      //       child: Column(
      //         children: <Widget>[
      //           buildRow(),
      //           Padding(padding: EdgeInsets.all(16.0),),
      //           buildRow(),
      //           Padding(padding: EdgeInsets.all(16.0),),
      //           _build_Row_single(),
      //           _build_Row_single_2(),
      //         ],
      //       ),
      //     ),
      //   ),
      // ),
    );
  }

  Row _build_Row_single_2() {
    return Row(
                children: <Widget>[
                  CircleAvatar(
                    backgroundColor: Colors.lightGreen,
                    radius: 100,
                    child: Stack(
                      children: <Widget>[
                        Container(
                          height: 100.0,
                          width: 100.0,
                          color: Colors.yellow,
                        ),
                        Container(
                          height: 60.0,
                          width: 60.0,
                          color: Colors.amber,
                        ),
                        Container(
                          height: 40.0,
                          width: 40.0,
                          color: Colors.brown,
                        ),
                      ],
                    ),
                  ),
                ],
              );
  }

  Row _build_Row_single() {
    return Row(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Container(
                        color: Colors.yellow,
                        height: 60.0,
                        width: 60.0,
                      ),
                      Padding(padding: EdgeInsets.all(16.0),),
                      Container(
                        color: Colors.amber,
                        height: 40.0,
                        width: 40.0,
                      ),
                      Padding(padding: EdgeInsets.all(16.0),),
                      Container(
                        color: Colors.brown,
                        height: 20.0,
                        width: 20.0,
                      ),
                      Divider(),
                      Row(
                        children: <Widget>[
                        // Next step we'll add more widgets
                        ],
                      ),
                      Divider(),
                      Text('End of the Line'),
                    ],
                  )
                ],
              );
  }

  Row buildRow() {
    return Row(
                children: <Widget>[
                  Container(
                    color: Colors.yellow,
                    height: 40.0,
                    width: 40.0,
                  ),
                  Padding(padding: EdgeInsets.all(16.0),),
                  Expanded(child: Container(
                    color: Colors.amber,
                    height: 40.0,
                    width: 40.0,
                  ),
                  ),
                  Padding(padding: EdgeInsets.all(16.0),),
                  Container(
                    color: Colors.brown,
                    height: 40.0,
                    width: 40.0,
                  ),
                ],
      );
    }
}

class ContainerWithBoxDecorationWidget extends StatelessWidget {
  const ContainerWithBoxDecorationWidget({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
      Container(
      height: 100.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(100.0),
          bottomRight: Radius.circular(10.0),
        ),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.white,
            Colors.lightGreen.shade500,
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 10.0,
            offset: Offset(0.0, 10.0),
          ),
        ],
      ),
          child: Center(
            child: RichText(
              text: TextSpan(
                text: 'Flutter World',
                style: TextStyle(
                  fontSize: 24.0,
                  color: Colors.deepPurple,
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.deepPurpleAccent,
                  decorationStyle: TextDecorationStyle.dotted,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.normal,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: ' for',
                  ),
                  TextSpan(
                    text: ' Mobile',
                    style: TextStyle(
                        color: Colors.deepOrange,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          )
      ),
      ],
    );
  }
}