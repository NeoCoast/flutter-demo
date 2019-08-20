import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  CustomFormField({
    @required this.focusNode,
    @required this.imageUrl,
    @required this.onFieldSubmitted,
    @required this.onSaved,
    @required this.placeholder,
    this.inputAction = TextInputAction.next,
    this.obscure = false,
  });

  final String imageUrl;
  final String placeholder;
  final bool obscure;
  final TextInputAction inputAction;
  final Function onFieldSubmitted;
  final Function onSaved;
  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 60.0,
      child: new Row(
        children: <Widget>[
          Container(
            height: 40.0,
            child: Image.asset(imageUrl),
          ),
          Container(
            width: 30.0,
          ),
          Flexible(
            child: new TextFormField(
              autocorrect: false,
              cursorColor: Colors.white,
              decoration: InputDecoration(
                hasFloatingPlaceholder: true,
                labelText: placeholder,
                fillColor: Colors.white,
              ),
              focusNode: focusNode,
              keyboardType: TextInputType.text,
              obscureText: obscure,
              onFieldSubmitted: onFieldSubmitted,
              onSaved: onSaved,
              style: new TextStyle(
                color: Colors.white,
              ),
              textInputAction: inputAction,
            ),
          ),
        ],
      ),
    );
  }
}
