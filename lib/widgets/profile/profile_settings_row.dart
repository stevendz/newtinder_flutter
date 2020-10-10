import 'package:flutter/material.dart';
import 'package:newtinder/widgets/buttons/button_floating_description.dart';

class ProfileSettingsRow extends StatelessWidget {
  const ProfileSettingsRow({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 50),
          child: ButtonFloatingDescription(
            icon: 'settings',
            title: 'settings',
            onPressed: () {
              print('settings clicked');
            },
          ),
        ),
        ButtonFloatingDescription(
          big: true,
          icon: 'camera',
          title: 'add media',
          onPressed: () {
            print('add media clicked');
          },
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 50),
          child: ButtonFloatingDescription(
            icon: 'secure',
            title: 'safety',
            onPressed: () {
              print('safety clicked');
            },
          ),
        ),
      ],
    );
  }
}
