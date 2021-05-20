import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frosh_link_task_1/providers/model.dart';
import 'package:frosh_link_task_1/screens/home.dart';
import 'package:frosh_link_task_1/screens/model_detailed_screen.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(ChangeNotifierProvider(
    create: (ctx) => Models(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Frosh Link Task 1',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: Home.routeName,
      routes: {
        Home.routeName: (ctx) => Home(),
        ModelDetailedScreen.routeName: (ctx) => ModelDetailedScreen()
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
