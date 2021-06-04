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
  String sec = "00";
  String milliSec = "000";

  void onChangeFun(value){
    print('onChange $value');
    setState(() {
      timing = value;
    });
    if(timing==0){
      print("it is zero");
      setState(() {
        sec= "00";
        milliSec = "000";
      });
    }else

    if(timing < 10){
      print("00"+timing.toString());
      setState(() {
        sec= "00";
        milliSec = "00"+timing.toString();
      });

    }else

    if(timing < 100){
      print("0"+timing.toString());
      setState(() {
        sec= "00";
        milliSec = "0"+timing.toString();
      });
    }else
    if(timing < 1000){
      print(timing.toString());
      setState(() {
        sec= "00";
        milliSec = timing.toString();
      });
    }

    if(timing > 1000){
      var res = timing / 1000;
      String unFormatted = res.toString();
      setState(() {
        sec = unFormatted.split('.').first.padLeft(2,"0");
        milliSec = unFormatted.split('.').last;
      });
      print("Sec : $res");
    }

    if(int.parse(sec) > 9){
      setState(() {
        sec ="00";
        milliSec ="000";
      });
      stopWatchTimer!.onExecute.add(StopWatchExecute.stop);
      stopWatchTimer!.onExecute.add(StopWatchExecute.reset);
    }

  }

  @override
  void initState() {
    stopWatchTimer = StopWatchTimer(
      mode: StopWatchMode.countUp,
      onChange: onChangeFun,
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
        home: HomePage(stopWatchTimer: stopWatchTimer,timing: timing,sec: sec,milliSec: milliSec,),
      ),
    );
  }
}
