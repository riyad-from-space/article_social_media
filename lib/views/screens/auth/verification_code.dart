import 'dart:async';
import 'package:flutter/material.dart';
import 'package:matha_nosto_project/views/global_components/back_button.dart';
import 'package:matha_nosto_project/views/global_components/submit_button.dart';
import 'package:matha_nosto_project/views/screens/auth/components/headline.dart';
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
        } else {}
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
            child: const CustomBackButton()),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 60),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Headline(
                headline: 'Verification Code',
                sub_headline:
                    'We send code to hellobesnik@gmail.comsub_headline'),
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
                onCompleted: (String value) {},
                enablePinAutofill: false,
                autoFocus: true,
                textStyle: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: Theme.of(context).primaryColor),
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.circle,
                  activeColor: Colors.yellow,
                  fieldHeight: 70,
                  fieldWidth: 70,
                  inactiveColor: Colors.grey,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Center(
              child: Text(
                ' Resend In $_remainingSeconds ',
                style: const TextStyle(fontSize: 16.0),
              ),
            ),
            const SizedBox(height: 40),
            Center(
              child: SubmitButton(
                submit:
                    _code != null && _code!.length == 4 && _remainingSeconds > 0
                        ? true
                        : false,
                onsubmit: () {
                  {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ResetPassword(),
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
