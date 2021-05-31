import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reactiontester/Provider/lightProvider.dart';

class Lights extends StatelessWidget {
  const Lights({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var lightProvider = Provider.of<LightProvider>(context, listen: false);

    return Container(
      margin: EdgeInsets.all(15),
      padding: EdgeInsets.all(5),
      width: size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.black,
      ),
      child: Row(
        children: [
          Light(index: 0),
          Light(index: 1),
          Light(index: 2),
          Light(index: 3),
          Light(index: 4),
        ],
      ),
    );
  }
}

class Light extends StatelessWidget {
  const Light({
    Key? key, required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: AspectRatio(
          aspectRatio: 1/1,
          child: Consumer<LightProvider>(
            builder: (context,provider,_)=>Container(
              decoration: BoxDecoration(
                color: provider.light[index] == true ? Colors.redAccent : Colors.white54,
                  borderRadius: BorderRadius.circular(500)
              ),
            ),
          ),
        ),
      ),
    );
  }
}
