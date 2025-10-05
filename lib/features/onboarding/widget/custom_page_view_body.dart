import 'package:flutter/material.dart';

class CustomPageViewBody extends StatelessWidget {
  const CustomPageViewBody({
    super.key, required this.image, required this.title, required this.subTitle,
  });
final String? image;
final String? title;
final String? subTitle;
  @override
  Widget build(BuildContext context) {
    return Column(

      children: [
        SizedBox(height: 50,),
        Center(
            child: Image.asset(
              image??"assets/images/Frame.png",
              height: 398,
              width: 227,
            )),
        SizedBox(
          height: 50,
        ),
        Text(
          title??"hhhhhhhhhhhhhhhhhhhhhh",
          style: TextStyle(
              fontSize: 32,
              fontFamily: "Montserrat",
              fontWeight: FontWeight.w600),
        ),
        Text(
          subTitle??"noooooooooooooooooooooooo",
          style: TextStyle(
              fontSize: 21,
              fontFamily: "Montserrat",
              fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}
