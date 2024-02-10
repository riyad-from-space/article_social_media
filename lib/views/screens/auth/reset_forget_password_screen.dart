import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matha_nosto_project/views/global_components/back_button.dart';
import 'package:matha_nosto_project/views/global_components/submit_button.dart';
import 'package:matha_nosto_project/views/screens/auth/components/headline.dart';
import 'package:matha_nosto_project/views/screens/auth/login_password_screen.dart';

import 'package:matha_nosto_project/views/screens/auth/user_info_screen.dart';
import 'package:matha_nosto_project/views/style/k_text_style.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  bool _isContinueButtonEnabled = false;
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const CustomBackButton()),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Headline(
                headline: 'Reset Password',
                sub_headline: 'Enter your new password'),
            const SizedBox(height: 40),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                hintText: 'Your new Password',
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscurePassword ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscurePassword = !_obscurePassword;
                    });
                  },
                ),
              ),
              obscureText: _obscurePassword,
              onChanged: (value) {
                setState(() {
                  _isContinueButtonEnabled =
                      _passwordController.text.isNotEmpty &&
                          _confirmPasswordController.text.isNotEmpty;
                });
              },
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _confirmPasswordController,
              decoration: InputDecoration(
                hintText: 'Confirm Password',
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscureConfirmPassword
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureConfirmPassword = !_obscureConfirmPassword;
                    });
                  },
                ),
              ),
              obscureText: _obscureConfirmPassword,
              onChanged: (value) {
                setState(() {
                  _isContinueButtonEnabled =
                      _passwordController.text.isNotEmpty &&
                          _confirmPasswordController.text.isNotEmpty;
                });
              },
            ),
            const SizedBox(height: 60),
            Center(
              child: SubmitButton(
                submit: _isContinueButtonEnabled,
                onsubmit: () {
                  {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Password(),
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
