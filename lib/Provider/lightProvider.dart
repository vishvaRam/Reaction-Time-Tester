import 'dart:async';
import 'dart:math';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';

class LightProvider extends ChangeNotifier {
  StopWatchTimer? stopWatchTimer;
  LightProvider(this.stopWatchTimer);
  List<bool> _light = [false, false, false, false, false];
  List<bool> get light => _light;
  Timer? _timer;

  void start() async{
  _timer = Timer.periodic(Duration(seconds: 1), (timer) {
     print("Started");
      if (timer.tick == 1) {
        _light[0] = true;
        notifyListeners();
        print(_light[0].toString()+ " : 0");
      }
      if (timer.tick  == 2) {
        _light[1] = true;
        notifyListeners();
        print(_light[1].toString()+ " : 1");
      }
      if (timer.tick  == 3) {
        _light[2] = true;
        notifyListeners();
        print(_light[2].toString()+ " : 2");
      }
      if (timer.tick  == 4) {
        _light[3] = true;
        notifyListeners();
        print(_light[3].toString()+ " : 3");
      }
      if (timer.tick  == 5) {
        _light[4] = true;
        notifyListeners();
        print(_light[4].toString()+ " : 4");
      }
      if(timer.tick == 6){
        Future.delayed(Duration(milliseconds: Random().nextInt(500)),(){
          for (int i = 0; i < 5; i++) {
            _light[i] = false;
            notifyListeners();
            print(_light);
          }
          stopWatchTimer!.onExecute.add(StopWatchExecute.start);
          _timer?.cancel();
        });
      }
    });
  }

  void reset() async {
    _timer?.cancel();
    stopWatchTimer?.onExecute.add(StopWatchExecute.reset);
    for (int i =0; i<5 ; i++) {
       _light[i] = false;
      notifyListeners();
      print(_light);
    }
  }
}
