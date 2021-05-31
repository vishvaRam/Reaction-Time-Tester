import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reactiontester/Provider/lightProvider.dart';
import 'package:reactiontester/Widgets/BottomSection.dart';
import 'package:reactiontester/Widgets/Lights.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
            Expanded(flex: 2, child: Lights()),
            Expanded(
              flex: 6,
                child: InkWell(
                  onTap: (){
                    print("clicked");
                  },
                  child: Container(),
                )),
            Expanded(
                flex: 1,
                child: bottomSection(lightProvider: lightProvider)),
          ],
        ),
      )),
    );
  }
}

// ignore: camel_case_types

