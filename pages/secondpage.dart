import 'package:dempart4/data/fdata.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getappbar(),
      bottomSheet: getbottomsheet(),
      body: getbody(),
    );
  }

  Widget getappbar() {
    var participant = participantsname.length;
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.black.withOpacity(0.85),
      centerTitle: true,
      title: Text(
        // add particpants count
        "Participants ($participant)",
        style: TextStyle(
          fontWeight: FontWeight.w600,
        ),
      ),
      leading: Padding(
        padding: const EdgeInsets.only(left: 10, top: 18),
        child: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Text(
            "Close",
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }

  Widget getbottomsheet() {
    return SafeArea(
      child: Container(
        width: double.infinity,
        height: 60,
        color: Colors.black.withOpacity(0.85),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 10),
              child: Container(
                width: 50,
                height: 35,
                decoration: BoxDecoration(
                    color: Colors.black26,
                    border: Border.all(color: Colors.black, width: 1.5),
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(3),
                  child: Center(
                    child: GestureDetector(
                      onTap: () {},
                      child: Text(
                        "Invite",
                        style: TextStyle(
                          color: Colors.white,
                          letterSpacing: 1,
                          fontSize: 13,
                        ),
                      ),
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

  Widget getbody() {
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        color: Colors.black,
        child: Column(
          children: List.generate(participantsname.length, (index) {
            return Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          image: DecorationImage(
                            image: AssetImage(
                              participantsimage[index],
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      child: Text(
                        participantsname[index],
                        style: TextStyle(
                            fontWeight: FontWeight.w600, color: Colors.white),
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Icon(
                        index == 0 ? Icons.mic : Icons.mic_off,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Icon(
                        index == 0
                            ? CupertinoIcons.videocam_fill
                            : Icons.videocam_off,
                        color: index == 0 ? Colors.white : Color(0xffff0000),
                        size: 20,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 3,
                ),
                Divider(
                  color: Colors.white.withOpacity(0.18),
                  height: .5,
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
