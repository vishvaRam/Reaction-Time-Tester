import 'package:flutter/material.dart';
import 'package:reactiontester/Provider/lightProvider.dart';


// ignore: camel_case_types
class bottomSection extends StatelessWidget {
  const bottomSection({
    Key? key,
    required this.lightProvider,
  }) : super(key: key);

  final LightProvider lightProvider;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextButton.icon(onPressed: (){
            lightProvider.start();
          }, icon: Icon(Icons.play_arrow), label: Text("Start")),
        ),
        Expanded(
          child: TextButton.icon(onPressed: (){
            lightProvider.reset();
          }, icon: Icon(Icons.refresh), label: Text("Reset")),
        ),
      ],
    );
  }
}
