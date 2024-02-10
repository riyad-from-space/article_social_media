import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matha_nosto_project/views/screens/auth/reset_forget_password_screen.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerificationCodePage extends StatefulWidget {
  const VerificationCodePage({Key? key}) : super(key: key);

  @override
  State<VerificationCodePage> createState() => _VerificationCodePageState();
}

class _VerificationCodePageState extends State<VerificationCodePage>
    with TickerProviderStateMixin {
  
  String? _code;
  int _remainingSeconds = 30;
  late Timer _timer;

  @override
  void initState() {
    super.initState();

    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingSeconds > 0) {
          _remainingSeconds--;
        } else {
      
        }
      });
    });
  }

  @override
  void dispose() {
    
    _timer.cancel();
    super.dispose();
  }

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
        padding: const EdgeInsets.only(left:20,right: 20,top: 60),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Verification Code',
              style: TextStyle(
                fontFamily: GoogleFonts.openSans().fontFamily,
                fontWeight: FontWeight.w700,
                fontSize: 30,
                color: const Color(0xff17131B),
              ),
            ),
            Text(
              'We sent code to your e-mail',
              style: TextStyle(
                fontFamily: GoogleFonts.openSans().fontFamily,
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: const Color(0xff5C5D67),
              ),
            ),
            const SizedBox(height: 50),
            Center(
              child: PinCodeTextField(
                appContext: context,
                length: 4,
                keyboardType: TextInputType.number,
                animationType: AnimationType.fade,
                onChanged: (String value) {
                  setState(() {
                    _code = value;
                  });
                },
                onCompleted: (String value) {
                  
                },
                enablePinAutofill: false,
                autoFocus: true,
                textStyle: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: Theme.of(context).primaryColor),
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.circle,
                  activeColor:Colors.yellow,
                  fieldHeight: 70,
                  fieldWidth: 70,
                  inactiveColor: Colors.grey,
                  
                  
                ),
              ),
            ),

            const SizedBox(height: 30,),
            Center(
              child: Text(
                ' Resend In $_remainingSeconds ',
                style: const TextStyle(fontSize: 16.0),
              ),
            ),
            const SizedBox(height: 40),
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
                    backgroundColor: _code != null &&
                            _code!.length == 4 &&
                            _remainingSeconds > 0
                        ? const Color(0xffA76FFF)
                        : const Color.fromARGB(255, 201, 176, 240),
                  ),
                  onPressed: () {
                    if (_code != null &&
                        _code!.length == 4 &&
                        _remainingSeconds > 0) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ResetPassword(),
                        ),
                      );
                    }
                  },
                  child: Text(
                    'Continue',
                    style: TextStyle(
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