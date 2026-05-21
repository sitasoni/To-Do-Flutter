import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TodoTile extends StatelessWidget{
  TodoTile({
    super.key,
    required this.title,
    required this.isTrue,
    required this.onChange
});

  String title;
  bool isTrue;
  void Function (bool?)? onChange;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(value: isTrue, onChanged: onChange),
        Text(title)
      ],
    );
  }

}