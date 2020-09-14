import 'package:act_tracker/style/style_color.dart';
import 'package:act_tracker/widgets/text/sub_title_text.dart';
import 'package:flutter/material.dart';

class FormInputField extends StatefulWidget {
  final Function validator;
  final String inputFieldLabel, hintText;

  const FormInputField(
      {Key key, this.validator, this.inputFieldLabel, this.hintText})
      : super(key: key);

  @override
  _FormInputFieldState createState() => _FormInputFieldState();
}

class _FormInputFieldState extends State<FormInputField> {
  FocusNode _focusNode;
  bool _focused = false;
  @override
  void initState() {
    super.initState();
    _focusNode = new FocusNode();
    _focusNode.addListener(() {
      _handleFocusNodeChange();
    });
  }

  _handleFocusNodeChange() {
    if (_focusNode.hasFocus != _focused) {
      setState(() {
        _focused = _focusNode.hasFocus;
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    _focusNode.dispose();
  }

  Color _getContainerBackgroundColor() {
    return _focusNode.hasFocus ? Colors.grey[200] : Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: _getContainerBackgroundColor(),
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 0),
            blurRadius: 2,
            color: StyleColor.shadowColor,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SubTitle(
              title: widget.inputFieldLabel,
              size: 16,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                focusNode: _focusNode,
                style: TextStyle(
                  fontSize: 20,
                ),
                validator: widget.validator,
                decoration: InputDecoration.collapsed(
                  border: InputBorder.none,
                  hintText: (widget.hintText),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
