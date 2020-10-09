import 'package:flutter/material.dart';

class ButtonColorful extends StatelessWidget {
  final Function onPressed;
  final String title;
  const ButtonColorful({
    Key key,
    @required this.onPressed,
    @required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      padding: EdgeInsets.all(0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
      onPressed: onPressed,
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.grey.shade200,
            gradient: onPressed != null
                ? LinearGradient(
                    begin: Alignment.centerRight,
                    end: Alignment.centerLeft,
                    colors: [
                      Color(0xffFF7759),
                      Color(0xffFF427A),
                    ],
                  )
                : null,
            borderRadius: BorderRadius.circular(50)),
        child: Text(
          title.toUpperCase(),
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
    );
  }
}
