import 'package:flutter/material.dart';
import 'package:lol_ranked_app/function/fs.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  initializeDateFormatting().then((_) => runApp(MyApp()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int nb_pompes_tot = 0;
  int nb_pompes_rst = 0;

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
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              const Text(
                'Nombre de pompes total :',
              ),
              Text(
                '$nb_pompes_tot',
                style: Theme.of(context).textTheme.headline4,
              ),
            ]),
            SizedBox(
              height: 30,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              const Text(
                'Nombre de pompes restant :',
              ),
              Text(
                '$nb_pompes_tot',
                style: Theme.of(context).textTheme.headline4,
              ),
            ]),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton.icon(
                    label: Text("Reload database"),
                    icon: Icon(Icons.refresh),
                    onPressed: () {
                      fs().todo_update();
                    }
                ),
                ElevatedButton.icon(
                    label: Text("Reload db & constants"),
                    icon: Icon(Icons.refresh),
                    onPressed: () {
                      fs().todo_updateAll();
                    }
                ),
              ]
            ),
            SizedBox(height:100),
            /*ElevatedButton.icon(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (BuildContext context) {
                    return push_ups();
                  })
                ),
                icon: Icon(Icons.list_alt),
                label: Text("Go to push-ups calendar"),
            )*/
          ],
        ),
      ),
    );
  }
}
