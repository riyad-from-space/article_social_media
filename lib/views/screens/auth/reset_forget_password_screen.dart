import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
  final TextEditingController _confirmPasswordController = TextEditingController();
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
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: const Color(0xffD6E5EA)),
              ),
              child: const Icon(Icons.arrow_back_ios),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Reset Password',
              style: KTextStyle.subtitle1.copyWith(
                fontFamily: GoogleFonts.openSans().fontFamily,
                fontWeight: FontWeight.w700,
                fontSize: 30,
                color: const Color(0xff17131B),
              ),
            ),
            Text(
              'Enter your new password',
              style: KTextStyle.subtitle1.copyWith(
                fontFamily: GoogleFonts.openSans().fontFamily,
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: const Color(0xff5C5D67),
              ),
            ),
            const SizedBox(height: 40),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                hintText: 'Your new Password',
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscurePassword
                        ? Icons.visibility
                        : Icons.visibility_off,
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
                  print(_isContinueButtonEnabled);
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
                  print(_isContinueButtonEnabled);
                });
              },
            ),
            const SizedBox(height: 60),
            Center(
              child: Container(
                height: 46,
                width: 290,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(36),
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    alignment: Alignment.center,
                    backgroundColor: _isContinueButtonEnabled
                        ? const Color(0xffA76FFF)
                        : const Color.fromARGB(255, 201, 176, 240),
                  ),
                  onPressed: () {
                    if (_isContinueButtonEnabled) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const  Profile(),
                        ),
                      );
                    }
                  },
                  child: Text(
                    'Continue',
                    style: KTextStyle.subtitle1.copyWith(
                      fontFamily: GoogleFonts.openSans().fontFamily,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
