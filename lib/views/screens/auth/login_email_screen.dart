import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matha_nosto_project/views/screens/auth/login_password_screen.dart';
import 'package:matha_nosto_project/views/style/k_text_style.dart';

class EmailUsername extends StatefulWidget {
  const EmailUsername({Key? key}) : super(key: key);

  @override
  _EmailUsernameState createState() => _EmailUsernameState();
}

class _EmailUsernameState extends State<EmailUsername> {
 
  bool _isContinueButtonEnabled = false;

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
              'Welcome To Confect',
              style: KTextStyle.subtitle1.copyWith(
                fontFamily: GoogleFonts.openSans().fontFamily,
                fontWeight: FontWeight.w700,
                fontSize: 30,
                color: const Color(0xff17131B),
              ),
            ),
            Text(
              'Enter your username or email address',
              style: KTextStyle.subtitle1.copyWith(
                fontFamily: GoogleFonts.openSans().fontFamily,
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: const Color(0xff5C5D67),
              ),
            ),
            const SizedBox(height: 40),
            TextField(
              
              decoration: const InputDecoration(
                hintText: 'Username or Email',
                
              ),
              onChanged: (value) {
                setState(() {
                  _isContinueButtonEnabled = value.isNotEmpty;
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
                    backgroundColor: _isContinueButtonEnabled
                        ? const Color(0xffA76FFF)
                        : const Color.fromARGB(255, 201, 176, 240),
                  ),
                  onPressed: () {
                    if (_isContinueButtonEnabled) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Password(),
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