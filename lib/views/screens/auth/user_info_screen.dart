import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matha_nosto_project/views/screens/social_media_screens/posts_feed_screen.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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
              'Start Your Profile',
              style: TextStyle(
                fontFamily: GoogleFonts.openSans().fontFamily,
                fontWeight: FontWeight.w700,
                fontSize: 30,
                color: const Color(0xff17131B),
              ),
            ),
            Text(
              'This is how you’re displayed in the community',
              style: TextStyle(
                fontFamily: GoogleFonts.openSans().fontFamily,
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: const Color(0xff5C5D67),
              ),
            ),
            const SizedBox(height: 40),
            Row(
              children: [
                const CircleAvatar(
                  backgroundColor: Color(0xffF1F1F1),
                  radius: 50,
                  child: Icon(Icons.person, size: 70, color: Color(0xffB3B3B3)),
                ),
                const SizedBox(width: 30),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 200, // Adjust the width as needed
                      child: TextFormField(
                        initialValue: 'Adom Shafi',
                        style: TextStyle(
                          fontFamily: GoogleFonts.openSans().fontFamily,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: const Color(0xff17131B),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      width: 200, // Adjust the width as needed
                      child: TextFormField(
                        initialValue: '@adom007',
                        style: TextStyle(
                          fontFamily: GoogleFonts.openSans().fontFamily,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: const Color(0xff17131B),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
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
                    backgroundColor: const Color(0xffA76FFF),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Home(),
                      ),
                    );
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
