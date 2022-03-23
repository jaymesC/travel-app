import 'package:flutter/material.dart';

class DeatailPage extends StatefulWidget {
  const DeatailPage({Key? key}) : super(key: key);

  @override
  State<DeatailPage> createState() => _DeatailPageState();
}

class _DeatailPageState extends State<DeatailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.maxFinite,
      height: double.maxFinite,
      child: Stack(
        children: [
          Positioned(
              left: 0,
              right: 0,
              child: Container(
                  width: double.maxFinite,
                  height: 300,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('img/mountain.jpeg'),
                          fit: BoxFit.cover)))),
          Positioned(
              left: 20,
              top: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.menu),
                    color: Colors.white,
                    iconSize: 28,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.more_vert),
                    color: Colors.white,
                  ),
                ],
              )),
        ],
      ),
    ));
  }
}
