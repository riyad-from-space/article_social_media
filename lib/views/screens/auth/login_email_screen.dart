import 'package:flutter/material.dart';
import 'package:matha_nosto_project/views/global_components/back_button.dart';
import 'package:matha_nosto_project/views/global_components/submit_button.dart';
import 'package:matha_nosto_project/views/screens/auth/components/headline.dart';
import 'package:matha_nosto_project/views/screens/auth/login_password_screen.dart';

class EmailUsername extends StatefulWidget {
  const EmailUsername({Key? key}) : super(key: key);

  @override
  _EmailUsernameState createState() => _EmailUsernameState();
}

class _EmailUsernameState extends State<EmailUsername> {
  bool _isContinueButtonEnabled = false;
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const CustomBackButton(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Headline(
              headline: 'Welcome To Confect',
              sub_headline: 'Enter your username or email address',
            ),
            const SizedBox(height: 40),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                hintText: 'ahmedriyad@gmail.com',
              ),
              onChanged: (value) {
                setState(() {
                  _isContinueButtonEnabled = _isValidEmail(value);
                });
              },
            ),
            const SizedBox(height: 60),
            Center(
              child: SubmitButton(
                submit: _isContinueButtonEnabled,
                onsubmit: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Password(),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  bool _isValidEmail(String email) {
   
    String emailRegex =
        r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$';
    RegExp regex = RegExp(emailRegex);
    return regex.hasMatch(email);
  }
}
