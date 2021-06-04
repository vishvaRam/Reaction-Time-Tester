import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reactiontester/Provider/lightProvider.dart';
import 'package:reactiontester/Widgets/BottomSection.dart';
import 'package:reactiontester/Widgets/Lights.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class HomePage extends StatelessWidget {

  final StopWatchTimer? stopWatchTimer;
  final int? timing;
  final String? sec;
  final String? milliSec;
  const HomePage({Key? key, this.stopWatchTimer, this.timing, this.sec, this.milliSec}) : super(key: key);

  void printList(List<bool> formLightProvider) {
    for (int i = 0; i < 5; i++) {
      print("Light  = : $i :" + formLightProvider[i].toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var lightProvider = Provider.of<LightProvider>(context, listen: false);
    printList(lightProvider.light);
    return SafeArea(
      child: Scaffold(
          body: Container(
        height: size.height,
        width: size.width,
        child: Column(
          children: [
            Expanded(flex: 3, child: Lights()),
            Expanded(
                flex: 2,
                child: Container(
                    child: Center(
                  child: FittedBox(
                    child: Text(
                      sec == null ? "00": sec!+":"+ milliSec!,
                      style: TextStyle(fontSize: 44),
                    ),
                  ),
                ))),
            Expanded(
                flex: 10,
                child: Theme(
                  data: ThemeData(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                  ),
                  child: InkWell(
                    highlightColor: Colors.transparent,
                    onTap: () {
                      print("clicked");
                      stopWatchTimer?.onExecute
                          .add(StopWatchExecute.stop);
                    },
                    child: Container(),
                  ),
                )),
            Expanded(
                flex: 2, child: bottomSection(lightProvider: lightProvider,sec: sec,milliSec: milliSec,)),
          ],
        ),
      )),
    );
  }
}

// ignore: camel_case_types
