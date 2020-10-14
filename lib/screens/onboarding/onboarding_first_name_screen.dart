import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:newtinder/provider/onboarding_user.dart';
import 'package:newtinder/screens/onboarding/onboarding_gender_screen.dart';
import 'package:newtinder/widgets/buttons/button_colorful.dart';
import 'package:provider/provider.dart';

class OnboardingFirstNameScreen extends StatefulWidget {
  @override
  _OnboardingFirstNameScreenState createState() =>
      _OnboardingFirstNameScreenState();
}

class _OnboardingFirstNameScreenState extends State<OnboardingFirstNameScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  bool isValid = false;

  @override
  Widget build(BuildContext context) {
    OnboardingUser userData =
        Provider.of<OnboardingUser>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: SvgPicture.asset(
            'assets/icons/back.svg',
            height: 25,
            color: Colors.blueGrey.shade100,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 35, right: 35, bottom: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'My first name is',
              style: TextStyle(color: Colors.blueGrey.shade800, fontSize: 50),
            ),
            Column(
              children: [
                Form(
                  key: _formKey,
                  child: TextFormField(
                    controller: _nameController,
                    validator: (value) {
                      if (value.length < 3) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        isValid = value.length > 2;
                      });
                    },
                    decoration: InputDecoration(
                        hintText: 'First Name',
                        hintStyle: TextStyle(color: Colors.blueGrey.shade100)),
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  'This is how it will appear in Tinder',
                  style: TextStyle(color: Colors.blueGrey),
                ),
              ],
            ),
            ButtonColorful(
              title: 'Continue',
              onPressed: isValid
                  ? () {
                      if (_formKey.currentState.validate()) {
                        userData.userName = _nameController.text;
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OnboardingGenderScreen(),
                          ),
                        );
                      }
                    }
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
