import 'package:flutter/material.dart';
import 'package:matha_nosto_project/views/style/k_text_style.dart';

class PostDetails extends StatefulWidget {
    const PostDetails({super.key});

  @override
  State<PostDetails> createState() => _PostDetailsState();
}

class _PostDetailsState extends State<PostDetails> {
  List<String> itemList = [
    'UI Design', 'UX Design', 'Visual Design',
    'Visual Design', 'Motion'
  ];

  List<Properties> contents =[
    Properties(name: 'Mansurul Haque', 
    topic: 'Why You Need UX In Design?', 
    heading: 'Why UX Design Is More Important Then UI Design.', 
    subheading: 'User experience (UX) design is the process design teams use to create products that provide meaningful and relevant experiences to users. This involves the design of the entire process of acquiring and integrating the product, including aspects of branding, design, usability and function.', 
    author: 'User Experinces Design !',
    
    image: 'assets/images/Ellipse 4.png'
    ),
   

  ];
   bool isImageToggled = false;

  void toggleImageColor() {
    setState(() {
      isImageToggled = !isImageToggled;
    });
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(

      bottomNavigationBar: BottomNavigationBar(
        
        items:[
          BottomNavigationBarItem(
            icon: Padding(
              padding:  const EdgeInsets.only(left:20),
              child: Row(
                children: [
                  
                 GestureDetector(
          onTap: toggleImageColor,
          child: Image.asset(
            'assets/images/heart.png',
            height: 24,
            width: 24,
            color: isImageToggled ? Colors.red :  const Color(0xff5C5D67),
          ),
        ),
                   const SizedBox(width: 8,),
                   Text('20',style:  KTextStyle.subtitle1.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color:  const Color(0xff5C5D67),
                                    fontSize: 16
                                  ,
                                  ),)
                ],
              ),
            ),
            label: 'PostDetails',
          ),
           BottomNavigationBarItem(
             icon: Image.asset('assets/images/Comments.png'),
            label: 'Search',
          ),
          
           BottomNavigationBarItem(
            icon: Image.asset('assets/images/Share.png'),
            label: 'Save',
          ),
        BottomNavigationBarItem(
             icon: Image.asset('assets/images/Bookmark.png'),
            label: 'Settings',
          ),
        ],
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle:  KTextStyle.subtitle1.copyWith(fontWeight: FontWeight.bold),
        unselectedLabelStyle:  KTextStyle.subtitle1.copyWith(fontWeight: FontWeight.normal),
      ),
      
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.white,
            pinned: true,
            floating: true,
            stretch: true,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              InkWell(
          onTap: (){
            Navigator.pop(context);
          },
          child: Padding(
            padding:  const EdgeInsets.all(8.0),
            child: Container(
              height: 44,
              width: 44,
              
              decoration:  BoxDecoration(
                
                shape: BoxShape.circle,
                border: Border.all(color: const Color(0xffD6E5EA))
                
                
                
              ),
              
              child:  const Icon(Icons.arrow_back_ios)),
          ),
        ),
         Text('Blog Post',style:  KTextStyle.subtitle1.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: const Color(0xff17131B),
                                    fontSize: 16
                                  ,
                                  ),),
                Container(
                  height: 44,
                  width: 44,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color:  const Color(0xffD6E5EA)),
                  ),
                  child: Padding(
                    padding:  const EdgeInsets.all(12),
                    child: Row(
                      
                      children: [
                        Image.asset('assets/images/Ellipse 30.png'),
                         const SizedBox(width: 3),
                        Image.asset('assets/images/Ellipse 30.png'),
                          const SizedBox(width: 3,),
                        Image.asset('assets/images/Ellipse 30.png'),
                      ],
                    ),
                  )
                ),
              ],
            ),
          ),
          SliverPadding(
            padding:  const EdgeInsets.only(left: 20, right: 20),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                   
                    ListView.builder(scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          physics:  const NeverScrollableScrollPhysics(),
                          itemCount: contents.length,
                          itemBuilder: (context, index){
                            return Container(
                              child:  Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                      
                                Row(
                     
                                  
                                  children: [

                                    Image.asset(contents[index].image,),
                                     const SizedBox(width: 10,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(contents[index].name,style:   KTextStyle.subtitle1.copyWith(
                                    fontWeight: FontWeight.w700,
                                    color: const Color(0xff17131B),
                                    fontSize: 18
                                  ,
                                  ),),

                                  Row(children: [ Text('Topic:',style:  KTextStyle.subtitle1.copyWith(
                                    fontWeight: FontWeight.w700,
                                    color: const Color(0xff5C5D67),
                                    fontSize: 14
                                  
                                  ),),Text(contents[index].topic,style:   KTextStyle.subtitle1.copyWith(
                                    fontWeight: FontWeight.w700,
                                    color: const Color(0xff17131B),
                                    fontSize: 14
                                  ,
                                  ),),],)
                                      ],
                                    ),

                                    
                                  ],
                                ),

                                 const SizedBox(height: 15,),

                                Text(contents[index].heading,style:   KTextStyle.subtitle1.copyWith(
                                    fontWeight: FontWeight.w700,
                                    color: const Color(0xff17131B),
                                    fontSize: 24
                                  ,
                                  ),),
                                   const SizedBox(height: 15,),

                                  Text(contents[index].subheading,style:  
                                   KTextStyle.subtitle1.copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xff5C5D67),
                                    fontSize: 16
                                  ,
                                  ),),
                                    const SizedBox(height: 15,),

                                  SizedBox(
                                    width:400 ,
                                    child: Image.asset('assets/images/Rectangle 10.png',)),
                                  
                                   const SizedBox(height: 15,),
                                  Text(contents[index].author,style:   KTextStyle.subtitle1.copyWith(
                                    fontWeight: FontWeight.w700,
                                    color: const Color(0xff17131B),
                                    fontSize: 22
                                  ,
                                  ),),
                                   const SizedBox(height: 15,),
                                   Text('User experience design is the process designers use to build products that provide great experiences to their users. UX design refers to feelings and emotions users experience when interacting with a product.',style:  KTextStyle.subtitle1.copyWith(
                                    fontWeight: FontWeight.w400,
                                    color:  const Color(0xff5C5D67),
                                    fontSize: 16
                                  ,
                                  ),),
                                  
                               



                                   const SizedBox(height: 20,),

                                  Container(height: 1,
                                  decoration:  const BoxDecoration(color: Color(0xffEAEAEA))),
                                
                                const SizedBox(height:20,),
                                
                              ]),
                              
                      
                      
                            );
                          }),

                          
                  ],

                ),
                

              ]),
            ),
          ),
          
        ],
        
      ),

      
    );
  }
}


class Properties{
  String name;
  String topic;
  String heading;
  String subheading;
  String author;
  
  String image;

  Properties({required this.name,required this.topic,
  required this.heading,required this.subheading,required this.author,required this.image});
  
  
  



}