import 'package:flutter/material.dart';

class ReadingTextScreen extends StatefulWidget {
  static const String routeName = "/reading-text-screen";

  const ReadingTextScreen({super.key});

  @override
  State<ReadingTextScreen> createState() => _ReadingTextScreenState();
}

class _ReadingTextScreenState extends State<ReadingTextScreen> {
  String text =
      "dhsfshd dskjfhskadj fsdjfhns dfjsadh fasljdhf sdfhsadjk fsadkjfh sdaj fhsldjkf sdjkfh sd jsdhf asdfjhsad fbasdjf sa dfbsadj fhbajds fsdjfsdj fds fjsdhfjsd jdshfsd fjdshyufasdf sadjfh sadflasdfhsdjahfas dfbnasjdfhasdj fas jfhbsadjkfl sa dfnbasdjklfhbas jshdfj asbdfjlsadhvsldfbja jlasdhfjabjdhvuds sljdfhlcjabnvlasdjhfubl lajsdhfa asdjhuasd  bajsdfhbssadjfhasdfbnj vcasudhsadjksldkusabdflas ausdhfas d";
  double scale = 1.0;
  double previousScale = 1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GestureDetector(
        onScaleStart: (details) {
          previousScale = scale;
        },
        onScaleUpdate: (details) {
          setState(() {
            scale = (previousScale * details.scale)
                .clamp(1.0, 3.0); // Adjust min and max zoom levels as needed
          });
        },
        child: Transform.scale(
          scale: scale,
          child: Padding(
            padding: EdgeInsets.all(10.0), // Add 10px padding on all sides
            child: ListView(
              children: [
                Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width - 20.0,
                  // Adjust the width by subtracting padding
                  child: RichText(
                    text: TextSpan(
                      text: text,
                      style: TextStyle(
                          fontSize: 16.0 * scale,
                          color: Colors
                              .black // Adjust the initial font size as needed
                      ),
                    ),
                    softWrap: true, // Enable text wrapping
                    maxLines:
                    null, // Allow unlimited lines (remove this line if you want to limit the number of lines)
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
