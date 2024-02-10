import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matha_nosto_project/views/screens/social_media_screens/user_profile_screen.dart';
import 'package:matha_nosto_project/views/screens/social_media_screens/post_details_screen.dart';
import 'package:matha_nosto_project/views/style/k_text_style.dart';

class Home extends StatefulWidget {
    const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> itemList = [
    'UI Design', 'UX Design', 'Visual Design',
    'Visual Design', 'Motion'
  ];

  List<Properties> contents =[
    Properties(name: 'Mansurul Haque', 
    topic: 'Why You Need UX In Design?', 
    heading: 'Why UX Design Is More Important Then UI Design.', 
    subheading: 'Why You Need UX In Design?', 
    author: 'As a founder of UI HUT i discover....',
    time: 5,
    image: 'assets/images/Ellipse 4.png'
    ),
    Properties(name: 'Ahnaf Irfan', 
    topic: 'Improve Your Visual Design', 
    heading: 'How To Make Your Visual Design Better!', 
    subheading: 'Why You Need Visual Design?', 
    author: 'As a visual designer i experince that....',
    time: 7,
    image: 'assets/images/Ellipse 4 (1).png'
    ),
    Properties(name: 'Wahab Khan', 
    topic: 'Business In Design & Text', 
    heading: 'Revealing The Uniqueness Of Your Business In Design & Text', 
    subheading: 'Why I Need Uniqueness Of Your Business?', 
    author: 'I just discover that we all need....',
    time: 10,
    image: 'assets/images/Ellipse 4 (2).png'),
    

  ];

  List<int> selectedTopicsIndex = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      bottomNavigationBar: BottomNavigationBar(
         
        backgroundColor: const Color(0xffF2F9FB),
        
        items:  [
          BottomNavigationBarItem(
            

            icon: Image.asset('assets/images/Home.png'),
            label: 'Home',
          ),
          BottomNavigationBarItem(
             icon: Image.asset('assets/images/8666693_search_icon.png',width: 25,height: 25,color:  const Color(0xff5C5D67),),
            label: 'Search',
          ),
            const BottomNavigationBarItem(
            icon: CircleAvatar(backgroundColor:Color(0xffA76FFF) ,radius: 30,child: Icon(Icons.add, size: 40, color: Colors.white),),
            label: 'Floating',
          ),
           BottomNavigationBarItem(
            icon: Image.asset('assets/images/Bookmark.png'),
            label: 'Save',
          ),
        BottomNavigationBarItem(
           icon: Image.asset('assets/images/Path_33946.png'),
            label: 'Settings',
          ),
        ],
       
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
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>  const MyProfile(),
          ),
        );
      },
      child: Image.asset(
        'assets/images/Profile.png',
        height: 44,
        width: 44,
      ),
    ),
    Container(
      height: 44,
      width: 44,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color:  const Color(0xffD6E5EA)),
      ),
      child:  const Icon(Icons.notifications_none_rounded),
    ),
  ],
),

          ),
          SliverPadding(
            padding:  const EdgeInsets.only(left: 20, top: 30, right: 20),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Explore',
                      style: KTextStyle.subtitle1.copyWith(
                        fontFamily: GoogleFonts.openSans().fontFamily,
                        fontWeight: FontWeight.w700,
                        fontSize: 30,
                        color:  const Color(0xff17131B),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: itemList.length,
                        itemBuilder: (context, index) {
                          return Container(
                            padding:  const EdgeInsets.only(left: 15, right: 15, top: 8, bottom: 8),
                            decoration: BoxDecoration(
                      color: selectedTopicsIndex.contains(index) ?  const Color(0xffF4E300) :  const Color(0xffF2F9FB),
                      border: Border.all(width: 1, color:  const Color(0xffD6E5EA)),
                      borderRadius: BorderRadius.circular(40),
                    ),
                            margin:  const EdgeInsets.only(top:14,right: 10),
                        
                            child: Center(
                              child: InkWell(
                                 onTap: () {
                        setState(() {
                          if (selectedTopicsIndex.contains(index)) {
                            selectedTopicsIndex.remove(index);
                          } else {
                            selectedTopicsIndex.add(index);
                          }
                        });
                      },
                                child: Text(
                                  itemList[index],
                                  style:  KTextStyle.subtitle1.copyWith(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600

                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),

                     const SizedBox(height: 30,),

                     Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      

                      Text('FOLLOWING',
                                  style:  KTextStyle.subtitle1.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: const Color(0xff17131B),
                                    fontSize: 16
                                  ,
                                  ),
                                ),

                                Row(children: [
                                   Text(
                                  'Sort By',
                                  style:  KTextStyle.subtitle1.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: const Color(0xff17131B),
                                    fontSize: 14
                                  ,
                                  ),
                                ),
                                const SizedBox(width: 2,),

                                const Icon(Icons.sort)



                                ],)


                      
                    ],),

                    ListView.builder(scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          physics:  const NeverScrollableScrollPhysics(),
                          itemCount: contents.length,
                          itemBuilder: (context, index){
                            return InkWell(
                              onTap: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) =>  const PostDetails()),
        );
      },
                              child: Container(
                                child:  Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                                    
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    
                                    children: [
                              
                                      Image.asset(contents[index].image),
                                       const SizedBox(width: 10,),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(contents[index].name,style:   KTextStyle.subtitle1.copyWith(
                                      fontWeight: FontWeight.w700,
                                      color: const Color(0xff17131B),
                                      fontSize: 14
                                    ,
                                    ),),
                              
                                    Row(children: [ Text('Topic:',style:  KTextStyle.subtitle1.copyWith(
                                      fontWeight: FontWeight.w700,
                                      color: const Color(0xff5C5D67),
                                      fontSize: 12
                                    
                                    ),),Text(contents[index].topic,style:   KTextStyle.subtitle1.copyWith(
                                      fontWeight: FontWeight.w700,
                                      color: const Color(0xff17131B),
                                      fontSize: 12
                                    ,
                                    ),),],)
                                        ],
                                      ),
                              
                                       Text('         Date:',style:  KTextStyle.subtitle1.copyWith(
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xff5C5D67),
                                      fontSize: 12
                                    
                                    ),),
                                       Text('8/18/2021',style:  KTextStyle.subtitle1.copyWith(
                                      fontWeight: FontWeight.w600,
                                      color: const Color(0xff000000),
                                      fontSize: 12
                                    
                                    ),),
                              
                                      
                                    ],
                                  ),
                              
                                   const SizedBox(height: 15,),
                              
                                  Text(contents[index].heading,style:   KTextStyle.subtitle1.copyWith(
                                      fontWeight: FontWeight.w700,
                                      color: const Color(0xff17131B),
                                      fontSize: 22
                                    ,
                                    ),),
                                     const SizedBox(height: 15,),
                              
                                    Text(contents[index].subheading,style:   KTextStyle.subtitle1.copyWith(
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xff5C5D67),
                                      fontSize: 16
                                    ,
                                    ),),
                                     const SizedBox(height: 15,),
                                    Text(contents[index].author,style:   KTextStyle.subtitle1.copyWith(
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xff17131B),
                                      fontSize: 18
                                    ,
                                    ),),
                                     const SizedBox(height: 15,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                             Text('Read Time : ',style:  KTextStyle.subtitle1.copyWith(
                                          fontWeight: FontWeight.w500,
                                          color: const Color(0xff00C922
                                        ),
                                          fontSize: 14
                                        ,
                                        ),),
                                        Text(contents[index].time.toString(),style:   KTextStyle.subtitle1.copyWith(
                                          fontWeight: FontWeight.w500,
                                          color: const Color(0xff00C922
                                        ),
                                          fontSize: 14
                                        ,
                                        ),),
                                          ],
                                        ),
                              
                                       Image.asset('assets/images/Bookmark.png')
                                      ],
                                    ),
                                    
                              
                              
                              
                                     const SizedBox(height: 20,),
                              
                                    Container(height: 1,
                                    decoration:  const BoxDecoration(color: Color(0xffEAEAEA))),
                                  
                                  const SizedBox(height:20,),
                                  
                                ]),
                                
                                                    
                                                    
                              ),
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
  int time;
  String image;

  Properties({required this.name,required this.topic,
  required this.heading,required this.subheading,required this.author,required this.time,required this.image});
  
  
  



}