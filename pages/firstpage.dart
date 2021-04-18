import 'package:dempart4/data/fdata.dart'
    show bottomcolors, bottomicons, bottomtext;
import 'package:dempart4/pages/secondpage.dart';
import 'package:flutter/material.dart';

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  int pageindex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getappbar(),
      bottomNavigationBar: getfooter(),
      body: getbody(),
    );
  }

  Widget getappbar() {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.black.withOpacity(0.89),
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Icon(
                Icons.volume_off,
                size: 18,
              ),
              SizedBox(
                width: 15,
              ),
              Icon(
                Icons.camera_alt,
                size: 18,
              )
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.security_outlined,
                size: 15,
                color: Color(0xff7cfc00),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                "Zoom",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 20),
              ),
              SizedBox(
                width: 2,
              ),
              Icon(
                Icons.keyboard_arrow_down,
                size: 25,
              )
            ],
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xffff0000),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                child: Text(
                  "Leave",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget getfooter() {
    return Container(
      height: 60,
      width: double.infinity,
      color: Colors.black.withOpacity(0.9),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: List.generate(bottomicons.length, (index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      selectedindex(index);
                    },
                    child: Icon(
                      bottomicons[index],
                      color: bottomcolors[index],
                      size: 25,
                    ),
                  ),
                  Text(
                    bottomtext[index],
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            );
          })),
    );
  }

  Widget getbody() {
    return Container(
      width: double.infinity,
      color: Colors.black,
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          SizedBox(
            height: 20,
          ),
          Positioned(
            top: 15,
            right: 15,
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images (31).jpeg"),
                    fit: BoxFit.cover),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Positioned(
            top: 170,
            left: 130,
            child: Container(
              width: 100,
              height: 150,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images (9).jpeg"),
                    fit: BoxFit.cover),
              ),
            ),
          ),
        ],
      ),
    );
  }

  selectedindex(index) {
    setState(() {
      pageindex = index;
    });
    if (pageindex == 3) {
      Navigator.push(context, MaterialPageRoute(builder: (_) => SecondPage()));
    }
  }
}
