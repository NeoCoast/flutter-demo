import 'package:flutter/material.dart';

import 'package:flutter_demo/screens/login/widgets/top_section.dart';
import 'package:flutter_demo/screens/login/widgets/bottom_section.dart';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  _LoginState createState() {
    return new _LoginState();
  }
}

class _LoginState extends State<Login> {
  double _size = 0.9;

  void onPressed() {
    setState(() {
      if (_size == 0.9) {
        _size = 0.4;
      } else {
        _size = 0.9;
      }
    });
  }

  @override
  Widget build(BuildContext context) =>
    new Scaffold(
      body: content(context),
    );

  Widget content(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    Duration _duration = Duration(milliseconds: 300);

    return Center(
      child: Stack(
        children: <Widget>[
          Container(
            height: _height/2,
            color: Theme.of(context).colorScheme.primary,
          ),
          Container(
            margin: EdgeInsets.only(
              top: _height/2,
            ),
            height: _height/2,
            color: Theme.of(context).colorScheme.secondary,
          ),
          SafeArea(
            child: LayoutBuilder(
              builder: (BuildContext ctx, BoxConstraints constraints) {
                return new ListView(
                  children: <Widget>[
                    TopSection(
                      duration: _duration,
                      height: constraints.maxHeight,
                      size: _size,
                    ),
                    BottomSection(
                      duration: _duration,
                      height: constraints.maxHeight,
                      onPressed: this.onPressed,
                      size: _size,
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

