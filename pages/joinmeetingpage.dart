import 'package:dempart4/pages/firstpage.dart';
import 'package:flutter/material.dart';

class JoinMettingPage extends StatefulWidget {
  @override
  _JoinMettingPageState createState() => _JoinMettingPageState();
}

class _JoinMettingPageState extends State<JoinMettingPage> {
  bool isaudio = true;
  bool isvideo = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getappbar(),
      body: getbody(),
    );
  }

  Widget getappbar() {
    return AppBar(
      backgroundColor: Colors.black.withOpacity(0.85),
      elevation: 0,
      centerTitle: true,
      title: Text(
        "Join a Meeting",
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

  Widget getbody() {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height,
      color: Colors.black,
      child: Column(
        children: [
          Container(
            height: 55,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(.15),
            ),
            child: Row(
              children: [
                Container(
                  height: 45,
                  width: MediaQuery.of(context).size.width * .25,
                ),
                Container(
                  height: 45,
                  width: MediaQuery.of(context).size.width * .7,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: TextField(
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(
                          hintText: "Meeting ID",
                          hintStyle:
                              TextStyle(color: Colors.grey.withOpacity(.6)),
                          border: InputBorder.none,
                          suffixIcon: Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.grey,
                          )),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 40,
            child: Center(
              child: Text(
                "Join with a personal link name",
                style: TextStyle(
                  color: Colors.blue,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(.15),
            ),
            child: Center(
              child: Text(
                "Screen Name",
                style: TextStyle(
                  color: Colors.grey.withOpacity(.6),
                  fontSize: 20,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: MediaQuery.of(context).size.width * .9,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.blue[900],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: RaisedButton(
                  color: Colors.blue[900],
                  splashColor: Colors.blue[900],
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => FirstScreen()));
                  },
                  child: Text(
                    "Join",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      letterSpacing: 1.5,
                    ),
                  )),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Text(
              "If you recieved an invitation link,tap on the link again to join the meeting",
              style: TextStyle(
                color: Colors.grey.withOpacity(.6),
              ),
            ),
          ),
          Container(
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(.1),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    "Dont Connect To Audio",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Switch(
                      activeColor: Colors.blue[600],
                      value: isaudio,
                      onChanged: (value) {
                        setState(() {
                          isaudio = value;
                        });
                      }),
                )
              ],
            ),
          ),
          SizedBox(
            height: 1,
          ),
          Container(
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(.1),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    "Turn Off My Video",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Switch(
                      activeColor: Colors.blue[600],
                      value: isvideo,
                      onChanged: (value) {
                        setState(() {
                          isvideo = value;
                        });
                      }),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
