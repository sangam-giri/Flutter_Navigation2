import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter Demo",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FirstPage(),
      /*Routes Map - I am using the first routing method in here. In this way we sure can set all the routes in the main.dart file but the data we pass through routes won't be dynamic. So only use for constant data*/
      routes: {
        '/second' :((context) => const SecondPage(data: 'abc')),
      },
    );
  }
}


class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Routing Page'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("First Page",style: TextStyle(fontSize: 20),),
          ElevatedButton(onPressed: (){

            Navigator.of(context).pushNamed('/second');
          }, child: Text("Go to second"),),

          ],
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
    final String data;

  const SecondPage({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Second Page",style: TextStyle(fontSize: 50),),
            Text(data,style: TextStyle(fontSize: 20),),
          ],
        ),
      ),

    );
  }
}