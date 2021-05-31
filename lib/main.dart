import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reactiontester/Page/HomePage.dart';
import 'package:reactiontester/Provider/lightProvider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<LightProvider>(
      create: (context) => LightProvider(),
    )
  ], child: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Reaction Time Tester",
      home: HomePage(),
    );
  }
}
