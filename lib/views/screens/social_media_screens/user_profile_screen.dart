import 'package:flutter/material.dart';
import 'package:matha_nosto_project/views/global_components/back_button.dart';
import 'package:matha_nosto_project/views/style/k_text_style.dart';

class MyProfile extends StatefulWidget {
   const MyProfile({Key? key}) : super(key: key);

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  List<Properties> contents = [
    Properties(
      name: 'End Of The Line For Uber',
      topic: 'Why Uber Is Gone?',
      image: 'assets/images/Rectangle 10 (1).png',
    ),
    Properties(
      name: 'Building Community....',
      topic: 'Why Need Better Community?',
      image: 'assets/images/Rectangle 10 (2).png',
    ),
    Properties(
      name: 'Why UX Is More.....',
      topic: 'Why You Need UX In Design?',
      image: 'assets/images/Rectangle 10 (1).png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const CustomBackButton()
        ),
        title:  Text(
          '@adom007',
          style: KTextStyle.subtitle1.copyWith(
            fontWeight: FontWeight.w600,
            color: const Color(0xff17131B),
            fontSize: 16,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding:  const EdgeInsets.only(right: 20, left: 20, top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  child: Image.asset(
                    'assets/images/Profile.png',
                    height: 70,
                    width: 70,
                    fit: BoxFit.cover,
                  ),
                ),
                 Column(
                  children: [
                    Text(
                      '20k',
                      style: KTextStyle.subtitle1.copyWith(
                        fontWeight: FontWeight.w600,
                        color: const Color(0xff17131B),
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      'Followers',
                      style: KTextStyle.subtitle1.copyWith(
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff5C5D67),
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                 Column(
                  children: [
                    Text(
                      '10',
                      style: KTextStyle.subtitle1.copyWith(
                        fontWeight: FontWeight.w600,
                        color: const Color(0xff17131B),
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      'Following',
                      style: KTextStyle.subtitle1.copyWith(
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff5C5D67),
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                 Column(
                  children: [
                    Text(
                      '03',
                      style: KTextStyle.subtitle1.copyWith(
                        fontWeight: FontWeight.w600,
                        color: const Color(0xff17131B),
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      'posts',
                      style: KTextStyle.subtitle1.copyWith(
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff5C5D67),
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
             const SizedBox(height: 20),
            Row(
              children: [
                 Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Adom Shafi',
                      style: KTextStyle.subtitle1.copyWith(
                        fontWeight: FontWeight.w700,
                        color: const Color(0xff17131B),
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      'App Designer at UI Hut',
                      style: KTextStyle.subtitle1.copyWith(
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff5C5D67),
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                 const SizedBox(width: 100),
                Container(
                  height: 34,
                  width: 104,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color:  const Color(0xffE1E1E1),
                  ),
                  child:  Center(
                    child: Text(
                      'Edit',
                      style: KTextStyle.subtitle1.copyWith(
                        fontWeight: FontWeight.w600,
                        color: const Color(0xff17131B),
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ],
            ),
             const SizedBox(height: 20),
            Container(height: 1, color:  const Color(0xffEAEAEA)),
             const SizedBox(height: 20),
             Text(
              'POST FROM ADOM',
              style: KTextStyle.subtitle1.copyWith(
                fontWeight: FontWeight.w600,
                color: const Color(0xff17131B),
                fontSize: 16,
              ),
            ),
           
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics:  const NeverScrollableScrollPhysics(),
                itemCount: contents.length,
                itemBuilder: (context, index) {
                  return Dismissible(
                    key: Key(contents[index].name),
                    onDismissed: (direction) {
                      setState(() {
                       
                        contents.removeAt(index);
                      });
                    },
                    background: Container(
                      color: Colors.white,
                      alignment: Alignment.centerRight,
                      padding:  const EdgeInsets.only(right: 20),
                      child: Image.asset('assets/images/Delete.png')
                    ),
                    child: buildListItem(contents[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildListItem(Properties property) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset(
                property.image,
                height: 100,
                width: 100,
                fit: BoxFit.cover,
              ),
               const SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    property.name,
                    style:  KTextStyle.subtitle1.copyWith(
                      fontWeight: FontWeight.w600,
                      color: const Color(0xff17131B),
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    property.topic,
                    style:  KTextStyle.subtitle1.copyWith(
                      fontWeight: FontWeight.w600,
                      color: const Color(0xff5C5D67),
                      fontSize: 16,
                    ),
                  ),
                   Text(
                    'Read Time : 7 min',
                    style: KTextStyle.subtitle1.copyWith(
                      fontWeight: FontWeight.w500,
                      color: const Color(0xff00C922),
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ],
          ),
           const SizedBox(height: 20),
          Container(height: 1, color:  const Color(0xffEAEAEA)),
           const SizedBox(height: 20),
        ],
      ),
    );
  }
}

class Properties {
  String name;
  String topic;
  String image;

  Properties({
    required this.name,
    required this.topic,
    required this.image,
  });
}

