library ffr_pwd_input_field;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class FFRPwdInputField extends StatefulWidget {
  const FFRPwdInputField({
    Key key,
    @required this.backgroundColor,
    @required this.icon,
    @required this.fieldKey,
    @required this.isError,
    @required this.validate,
    @required this.textStyle,
    @required this.errorColor,
    @required this.hidePwd,
    @required this.showPwd,
    @required this.hintText,
    this.autofocus = false,
    this.onFieldSubmitted,
    this.focusNode,
  }) : super(key: key);

  final Color backgroundColor;
  final TextStyle textStyle;
  final Color errorColor;
  final Icon icon;
  final Function validate;
  final Key fieldKey;
  final bool isError;
  final Icon showPwd;
  final Icon hidePwd;
  final String hintText;
  final bool autofocus;
  final Function onFieldSubmitted;
  final FocusNode focusNode;

  @override
  _FFRPwdInputFieldState createState() => _FFRPwdInputFieldState();
}

class _FFRPwdInputFieldState extends State<FFRPwdInputField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: kIsWeb ? 400 : 350,
      height: 50,
      padding: const EdgeInsets.only(left: 20, right: 20),
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: widget.isError ? widget.errorColor : widget.backgroundColor,
        ),
        borderRadius: BorderRadius.circular(35),
        color: widget.backgroundColor,
      ),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              focusNode: widget.focusNode,
              onFieldSubmitted: widget.onFieldSubmitted,
              autofocus: widget.autofocus,
              obscureText: _obscureText,
              validator: widget.validate,
              key: widget.fieldKey,
              style: widget.textStyle,
              decoration: InputDecoration(
                hintText: widget.hintText,
                hintStyle: widget.textStyle,
                border: InputBorder.none,
                icon: widget.icon,
              ),
            ),
          ),
          GestureDetector(
            child: _obscureText ? widget.hidePwd : widget.showPwd,
            onTap: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
          )
        ],
      ),
    );
  }
}
