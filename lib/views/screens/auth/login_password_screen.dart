import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matha_nosto_project/views/global_components/back_button.dart';
import 'package:matha_nosto_project/views/global_components/submit_button.dart';
import 'package:matha_nosto_project/views/screens/auth/components/headline.dart';
import 'package:matha_nosto_project/views/screens/auth/reset_forget_password_screen.dart';
import 'package:matha_nosto_project/views/screens/auth/user_info_screen.dart';
import 'package:matha_nosto_project/views/screens/auth/verification_code.dart';
import 'package:matha_nosto_project/views/style/k_text_style.dart';

class Password extends StatefulWidget {
  const Password({Key? key}) : super(key: key);

  @override
  _PasswordState createState() => _PasswordState();
}

class _PasswordState extends State<Password> {
  bool _isContinueButtonEnabled = false;
  final TextEditingController _passwordController = TextEditingController();

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
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ResetPassword(),
                  ),
                );
              },
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const VerificationCodePage(),
                    ),
                  );
                },
                child: Text(
                  'Forgotten Password?',
                  style: KTextStyle.subtitle1.copyWith(
                    fontFamily: GoogleFonts.openSans().fontFamily,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: const Color(0xffA76FFF),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Headline(
              headline: 'Welcome To Confect',
              sub_headline: 'Enter your password',
            ),
            const SizedBox(height: 40),
            TextField(
              controller: _passwordController,
              obscureText: true,
              keyboardType: TextInputType.number,
              maxLength: 6, 
              decoration: const InputDecoration(
                hintText: 'Your Password',
              ),
              onChanged: (value) {
                setState(() {
                  _isContinueButtonEnabled = _isValidPassword(value);
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
                      builder: (context) => const UserInfo(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool _isValidPassword(String password) {
  
    return int.tryParse(password) != null && password.length == 6;
  }
}
