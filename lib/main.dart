import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reactiontester/Page/HomePage.dart';
import 'package:reactiontester/Provider/lightProvider.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  StopWatchTimer? stopWatchTimer;
  int timing = 0000;

  @override
  void initState() {
    stopWatchTimer = StopWatchTimer(
      mode: StopWatchMode.countUp,
      onChange: (value){
        print('onChange $value');
        setState(() {
          timing = value;
        });
      },
      onChangeRawSecond: (value) => print('onChangeRawSecond $value'),
      onChangeRawMinute: (value) => print('onChangeRawMinute $value'),
    );
    super.initState();
  }

  @override
  void dispose() async {
    super.dispose();
    await stopWatchTimer?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<LightProvider>(
          create: (context) => LightProvider(stopWatchTimer),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Reaction Time Tester",
        home: HomePage(stopWatchTimer: stopWatchTimer,timing: timing,),
      ),
    );
  }
}
