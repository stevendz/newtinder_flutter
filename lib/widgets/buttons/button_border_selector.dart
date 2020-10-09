import 'package:flutter/material.dart';

class ButtonBorderSelector extends StatelessWidget {
  final Function setSelected;
  final String value;
  final String currentValue;
  const ButtonBorderSelector({
    Key key,
    @required this.value,
    @required this.currentValue,
    @required this.setSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
      borderSide: BorderSide(
        width: 2,
        color:
            value == currentValue ? Colors.redAccent : Colors.blueGrey.shade200,
      ),
      padding: EdgeInsets.all(10),
      onPressed: () {
        setSelected(value);
      },
      child: Center(
        child: Text(
          value.toUpperCase(),
          style: TextStyle(
            fontSize: 16,
            color: value == currentValue
                ? Colors.redAccent
                : Colors.blueGrey.shade300,
          ),
        ),
      ),
    );
  }
}
