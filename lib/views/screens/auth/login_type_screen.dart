import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matha_nosto_project/views/screens/auth/login_email_screen.dart';
import 'package:matha_nosto_project/views/screens/auth/components/social_login_button_component.dart';
import 'package:matha_nosto_project/views/style/k_colors.dart';
import 'package:matha_nosto_project/views/style/k_text_style.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 154, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/Logo.png',
              height: 50,
              width: 50,
            ),
            const SizedBox(height: 30),
            Text(
              'We Are Preparing Something Great For You!',
              style: KTextStyle.subtitle1.copyWith(
                fontFamily: GoogleFonts.openSans().fontFamily,
                fontWeight: FontWeight.w700,
                fontSize: 30,
                color: const Color(0xff17131B),
              ),
            ),
            const SizedBox(height: 30),
            InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const EmailUsername()), // Use EmailUsername instead of EmailUSername
                  );
                },
                child: SocialLoginButton(
                  background_color: KColor.black,
                  provider_name: "Apple",
                  icon: const Icon(
                    Icons.apple,
                    color: Colors.white,
                    size: 30,
                  ),
                )),
            const SizedBox(height: 30),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const EmailUsername()), // Use EmailUsername instead of EmailUSername
                );
              },
              child: SocialLoginButton(
                background_color: KColor.backgrounforGoogle,
                provider_name: "Google",
                icon: const Icon(Icons.apple),
                isGoogle: true,
                image: Image.asset("assets/images/Logo (3).png"),
              ),
            ),
            const SizedBox(height: 30),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const EmailUsername()), // Use EmailUsername instead of EmailUSername
                );
              },
              child: SocialLoginButton(
                background_color: KColor.backgrounforEmail,
                provider_name: "Email",
                icon: const Icon(
                  Icons.email,
                  size: 28,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an account?',
                  style: KTextStyle.subtitle1.copyWith(
                    fontFamily: GoogleFonts.openSans().fontFamily,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: const Color(0xff5C5D67),
                  ),
                ),
                const SizedBox(width: 2),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const EmailUsername()),
                    );
                  },
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const EmailUsername()),
                      );
                    },
                    child: Text(
                      'Log In',
                      style: KTextStyle.subtitle1.copyWith(
                        fontFamily: GoogleFonts.openSans().fontFamily,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: const Color(0xffA76FFF),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Text(
              'By continuing, you accept the Terms Of Use and Privacy Policy.',
              style: KTextStyle.subtitle1.copyWith(
                fontFamily: GoogleFonts.openSans().fontFamily,
                fontWeight: FontWeight.w400,
                fontSize: 12,
                color: const Color(0xff5C5D67),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
