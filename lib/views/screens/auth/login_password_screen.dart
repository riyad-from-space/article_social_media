import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matha_nosto_project/views/screens/auth/verification_code.dart';
import 'package:matha_nosto_project/views/style/k_text_style.dart';


class Password extends StatefulWidget {
  const Password({super.key});

  @override
  _PasswordState createState() => _PasswordState();
}

class _PasswordState extends State<Password> {
  
  bool _isContinueButtonEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: (){
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              
              decoration:  BoxDecoration(
                
                shape: BoxShape.circle,
                border: Border.all(color:const Color(0xffD6E5EA))
                
                
                
              ),
              
              child: const Icon(Icons.arrow_back_ios)),
          ),
        ),
        actions: [Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Text('Forgotten Password?',style: KTextStyle.subtitle1.copyWith(
                      fontFamily: GoogleFonts.openSans().fontFamily,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: const Color(0xffA76FFF),
                      
                    ),
                    
                    ),
        ),],
        
         
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
                  'Enter your password',
                  style: KTextStyle.subtitle1.copyWith(
                    fontFamily: GoogleFonts.openSans().fontFamily,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: const Color(0xff5C5D67),
                  ),
                ),
                const SizedBox(height:40),


            TextField(
            
              decoration: const InputDecoration(
                hintText: 'Your Password',
              ),
              onChanged: (value) {
                setState(() {
                  
                  _isContinueButtonEnabled = value.isNotEmpty;
                  print(_isContinueButtonEnabled);
                });
              },
            ),
            const SizedBox(height:60),
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
                      backgroundColor:  _isContinueButtonEnabled ? const Color(0xffA76FFF) : const Color.fromARGB(255, 201, 176, 240),
                    ),
                  onPressed: () {
                          if(_isContinueButtonEnabled){
                            Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const VerificationCodePage(),
                            ),
                          );
                          }
                          
                        }
                      ,
                  child:  Text('Continue',style: KTextStyle.subtitle1.copyWith(
                      fontFamily: GoogleFonts.openSans().fontFamily,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: Colors.white,
                    ),),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}