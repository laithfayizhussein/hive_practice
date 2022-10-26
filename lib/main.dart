import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  runApp(const MyApp());
  await Hive.initFlutter();
  await Hive.openBox('db');
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const HivePractice(),
    );
  }
}

class HivePractice extends StatefulWidget {
  const HivePractice({Key? key}) : super(key: key);

  @override
  State<HivePractice> createState() => _HivePracticeState();
}

class _HivePracticeState extends State<HivePractice> {
  final db = Hive.box('db');
  var tot = '';

  void write() {
    db.put(1, 'HELLO');
    db.put(2, 'HI');
    db.put(3, 'HELLO THERE ');
  }

  void read() {
    var text = db.get(1);
    tot = text.toString();
    print(text);
  }

  void delete() {
    db.delete(1);
    var printo = db.get(1);
    print(printo);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('hive'),
      ),
      body: Center(
        child: Column(
          children: [
            Text('${tot}'),
            TextButton(onPressed: write, child: Text('Write')),
            TextButton(onPressed: read, child: Text('Read')),
            TextButton(onPressed: delete, child: Text('Delete')),
          ],
        ),
      ),
    );
  }
}
