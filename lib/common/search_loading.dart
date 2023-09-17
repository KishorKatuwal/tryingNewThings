import 'package:flutter/material.dart';

class SearchLoading extends StatelessWidget {
  final String text;
  final String gender;

  const SearchLoading({Key? key, required this.text, required this.gender})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          gender == "male"
              ? Image.asset("assets/boy.jpg")
              : Image.asset("assets/girl.jpg"),
          const SizedBox(
            height: 5,
          ),
          Text(
            text,
            style: const TextStyle(
              fontSize: 22,
              color: Colors.black54,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
