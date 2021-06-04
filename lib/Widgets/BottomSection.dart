import 'package:flutter/material.dart';
import 'package:reactiontester/Provider/lightProvider.dart';


// ignore: camel_case_types, must_be_immutable
class bottomSection extends StatefulWidget {
  String? sec;
  String? milliSec;
  bottomSection({
    Key? key,
    required this.lightProvider, this.sec, this.milliSec,
  }) : super(key: key);

  final LightProvider lightProvider;

  @override
  _bottomSectionState createState() => _bottomSectionState();
}

class _bottomSectionState extends State<bottomSection> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextButton.icon(onPressed: (){
            widget.lightProvider.start();
          }, icon: Icon(Icons.play_arrow), label: Text("Start")),
        ),
        Expanded(
          child: TextButton.icon(onPressed: (){
            widget.lightProvider.reset();
            setState(() {
              widget.milliSec = "000";
            });
          }, icon: Icon(Icons.refresh), label: Text("Reset")),
        ),
      ],
    );
  }
}
