import 'package:dempart4/data/fdata.dart';
import 'package:dempart4/pages/joinmeetingpage.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class InitialPage extends StatefulWidget {
  @override
  _InitialPageState createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  int activetab = 0;
  CarouselController buttonCarouselController = CarouselController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getappbar(),
      bottomNavigationBar: getbottombar(),
      body: getbody(),
    );
  }

  Widget getappbar() {
    return AppBar(
      backgroundColor: Colors.black.withOpacity(.8),
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          Icon(
            Icons.settings,
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(4, (index) {
              return Padding(
                padding: const EdgeInsets.all(2),
                child: Container(
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                    color: activetab == index
                        ? Colors.white
                        : Colors.grey.withOpacity(.7),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              );
            }),
          ),
          Spacer(),
        ],
      ),
    );
  }

  Widget getbottombar() {
    return Container(
      height: MediaQuery.of(context).size.height * .3,
      color: Colors.black.withOpacity(.9),
      width: double.infinity,
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * .02,
          ),
          Container(
            width: MediaQuery.of(context).size.width * .8,
            child: RaisedButton(
                color: Colors.blue[900],
                splashColor: Colors.blue[900],
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => JoinMettingPage()));
                },
                child: Text(
                  "Join Meeting",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    letterSpacing: 1.5,
                  ),
                )),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .06,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "Sign Up",
                style: TextStyle(
                  color: Colors.blue[600],
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                "Sign Up",
                style: TextStyle(
                  color: Colors.blue[600],
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget getbody() {
    var size = MediaQuery.of(context).size;
    var option = CarouselOptions(
      viewportFraction: .99,
      height: size.height,
      initialPage: 0,
      onPageChanged: (index, reason) {
        setState(() {
          activetab = index;
        });
      },
    );

    return CarouselSlider(
        carouselController: buttonCarouselController,
        items: List.generate(4, (index) {
          return Container(
            width: size.width,
            height: size.height,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(.9),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text(
                      itemsdata[index]['title'],
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      itemsdata[index]['descrption'],
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(itemsdata[index]['img']),
                          fit: BoxFit.cover)),
                ),
              ],
            ),
          );
        }),
        options: option);
  }
}
