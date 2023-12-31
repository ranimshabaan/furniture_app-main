import 'package:flutter/material.dart';
import 'package:furniture_app/models/Chatmodel.dart';


const avatarImage = "assets/images/Group.png";

class ReviewPage extends StatefulWidget {
  const ReviewPage({super.key});
static String id = 'Review';

  @override
  State<ReviewPage> createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _BuildAppBar(),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
              image: AssetImage("assets/images/background.png"),
              fit: BoxFit.cover,
            )),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(
                    height: 50,
                  ),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: names.length,
                  itemBuilder: (context, index) => _chatItem(
                    name: names[index].name,
                    message: names[index].message,
                    createdAt: names[index].createdAt,
                    image: names[index].image,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _chatItem({
    required String name,
    required String message,
    required String createdAt,
    required String image,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.black
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage(
                  image,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    message,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  // Row(
                  //   children: [
                  //     Icon(
                  //       CupertinoIcons.video_camera_solid,
                  //       color: Colors.grey,
                  //     ),
                  //     Text(
                  //       "Video",
                  //       style: TextStyle(
                  //         fontSize: 13,
                  //         color: Colors.grey,
                  //       ),
                  //     ),
                  //   ],
                  // ),
                ],
              ),
              const Spacer(),
              Text(
                createdAt,
                style: const TextStyle(
                  color: Colors.white,
                ),
                textAlign: TextAlign.end,
              )
            ],
          ),
          const SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }

  AppBar _BuildAppBar() {
    return AppBar(
      backgroundColor: Colors.black,
      title: Text(
        "Feedbacks",
        style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.white),
      ),
    );
  }

  List<ChatModel> names = [
    ChatModel(
        name: "Ranim Shabban",
        message: "Product images were clear, and descriptions were helpful",
        createdAt: "12:00PM",
        image: avatarImage),
    ChatModel(
        name: "Ahmed Nabil",
        message: "Great customer support, responsive team",
        createdAt: "1:00Am",
        image: avatarImage),
    ChatModel(
        name: "Ahmed mofta7",
        message: "prefecto",
        createdAt: "2:00PM",
        image: avatarImage),
    ChatModel(
        name: "Rokaya Yasser",
        message: "thanks for your service",
        createdAt: "5:00Pm",
        image: avatarImage),
    ChatModel(
        name: "Meran Mamoon",
        message: "Amazing as usual",
        createdAt: "1:00PM",
        image: avatarImage),
    ChatModel(
        name: "Ahmed Allam",
        message: "good service",
        createdAt: "9:00pm",
        image: avatarImage),
  ];
}
