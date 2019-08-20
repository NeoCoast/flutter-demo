import 'package:flutter/material.dart';
import 'package:flutter_demo/screens/login/widgets/login_form.dart';

class BottomSection extends StatelessWidget {
  BottomSection({
    @required this.height,
    @required this.size,
    @required this.duration,
    @required this.onPressed,
  });

  final double height;
  final double size;
  final Duration duration;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      color: Theme.of(context).colorScheme.primary,
      duration: duration,
      height: (height - (height * size).floorToDouble()).toDouble(),
      child: new Stack(
        children: <Widget>[
          new Container(
            decoration: new BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              border: new Border.all(
                color: Colors.transparent,
                width: 0.0,
              ),
              borderRadius: new BorderRadius.only(
                topRight: new Radius.circular(35.0),
              ),
            ),
          ),
          new ListView(
            physics: NeverScrollableScrollPhysics(),
            children: <Widget>[
              new ButtonTheme(
                minWidth: MediaQuery.of(context).size.width,
                height: (height * 0.1).floorToDouble(),
                child: new FlatButton(
                  onPressed: onPressed,
                  color: Colors.transparent,
                  textColor: Colors.white,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  child: Text(
                    'Login to Your Account',
                    style: new TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
              AnimatedOpacity(
                duration: Duration(milliseconds: 500),
                opacity: size == 0.9 ? 0 : 1,
                child: LoginForm(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
