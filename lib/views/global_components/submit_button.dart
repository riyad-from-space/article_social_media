import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matha_nosto_project/views/screens/topic_screen/login_type.dart';
import 'package:matha_nosto_project/views/style/k_text_style.dart';

class SubmitButton extends StatefulWidget {
   final bool submit;
   
   

    const SubmitButton({super.key,required this.submit});

  @override
  State<SubmitButton> createState() => _SubmitButtonState();
}

class _SubmitButtonState extends State<SubmitButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        if(widget.submit){
          Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>  const OnBoarding(),
                      ),);
        }
      },

      child: Container(
                 height: 46,
              width: 290,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(36),
                color: widget.submit ? const Color(0xffA76FFF) :const Color.fromARGB(255, 201, 176, 240)
              
              ),
                  child: Center(
                    child: Text(
                    'Continue',
                    style: KTextStyle.subtitle1.copyWith(
                      fontFamily: GoogleFonts.openSans().fontFamily,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: const Color(0xff17131B),
                    ),
                                    ),
                  ),
                ),
    );
  }
}