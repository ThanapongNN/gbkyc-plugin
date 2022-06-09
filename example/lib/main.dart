import 'package:flutter/material.dart';
import 'package:gbkyc/gbkyc.dart';

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
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Test GB SDK')),
      body: Center(
        child: MaterialButton(
          height: 60,
          minWidth: double.infinity,
          color: Colors.blue,
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => Gbkyc().show())).then((v) => debugPrint('ค่าที่ได้กลับจาก SDK $v'));
            // await Gbkyc().show();
          },
          child: const Text(
            'Open GB SDK',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
