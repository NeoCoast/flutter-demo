import 'package:flutter/material.dart';

class TopSection extends StatelessWidget {
  TopSection({
    @required this.height,
    @required this.size,
    @required this.duration
  });

  final double height;
  final double size;
  final Duration duration;

  @override
  Widget build(BuildContext context) {
    return new AnimatedContainer(
      color: Theme.of(context).colorScheme.secondary,
        duration: duration,
        height: (height * size).floorToDouble(),
        child: new Stack(
          alignment: Alignment.center,
          children: <Widget>[
            new Container(
              decoration: new BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                border: new Border.all(
                  color: Colors.transparent,
                  width: 0.0,
                ),
                borderRadius: new BorderRadius.only(
                  bottomLeft: new Radius.circular(35.0),
                ),
              ),
            ),
              new AnimatedContainer(
                duration: duration,
                height: (300).floorToDouble(),
                child: new Image.asset(
                  'assets/astronaut.png',
                ),
              ),
          ],
        ),
    );
  }
}
