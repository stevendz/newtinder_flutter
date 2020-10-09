import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:newtinder/provider/current_user.dart';
import 'package:newtinder/services/auth_service.dart';
import 'package:provider/provider.dart';

class ButtonSocialLogin extends StatelessWidget {
  final String social;
  const ButtonSocialLogin({
    Key key,
    @required this.social,
  }) : super(key: key);

  String buttonText() {
    switch (social) {
      case 'google':
        return 'Login with Google';
      case 'phone':
        return 'Login with Phonenumber';
    }
    return 'No Social';
  }

  String buttonIcon() {
    switch (social) {
      case 'google':
        return 'assets/icons/google.svg';
      case 'phone':
        return 'assets/icons/phone.svg';
    }
    return 'assets/icons/loading.svg';
  }

  Future<void> onButtonPressed(context) async {
    switch (social) {
      case 'google':
        await AuthService().signInWithGoogle();
        Provider.of<CurrentUser>(context, listen: false).setUser();
        break;
      case 'phone':
        await AuthService().signInWithPhone(context);
        Provider.of<CurrentUser>(context, listen: false).setUser();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
      padding: EdgeInsets.all(10),
      color: Colors.white,
      onPressed: () async {
        onButtonPressed(context);
      },
      child: Center(
        child: Row(
          children: [
            SvgPicture.asset(
              buttonIcon(),
              height: 25,
            ),
            Expanded(
              child: Text(
                buttonText().toUpperCase(),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
