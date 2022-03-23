import 'package:flutter/material.dart';
import 'package:travel_app/misc/colors.dart';
import 'package:travel_app/widget/app_buttons.dart';
import 'package:travel_app/widget/app_large_text.dart';
import 'package:travel_app/widget/app_text.dart';

class DeatailPage extends StatefulWidget {
  const DeatailPage({Key? key}) : super(key: key);

  @override
  State<DeatailPage> createState() => _DeatailPageState();
}

class _DeatailPageState extends State<DeatailPage> {
  int gottenStars = 4;
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      width: double.maxFinite,
      height: double.maxFinite,
      child: Stack(
        children: [
          Positioned(
              left: 0,
              right: 0,
              child: Container(
                  width: double.maxFinite,
                  height: 350,
                  decoration: const BoxDecoration(
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
                    icon: const Icon(Icons.menu),
                    color: Colors.white,
                    iconSize: 28,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.more_vert),
                    color: Colors.white,
                  ),
                ],
              )),
          Positioned(
              top: 220,
              child: Container(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                    top: 20,
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: 500,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppLargeText(
                                text: 'Yosemite', color: Colors.black54),
                            AppLargeText(
                              text: '\$ 250',
                              color: AppColors.mainColor,
                            ),
                          ]),
                      const SizedBox(height: 5),
                      Row(children: [
                        Icon(Icons.location_on, color: AppColors.mainColor),
                        AppText(
                          text: "USA, California",
                          color: AppColors.textColor1,
                        )
                      ]),
                      const SizedBox(height: 10),
                      Row(children: [
                        Wrap(
                            children: List.generate(
                                5,
                                (index) => Icon(Icons.star,
                                    color: index < gottenStars
                                        ? AppColors.starColor
                                        : AppColors.textColor2))),
                        const SizedBox(width: 10),
                        AppText(text: '(4.0)', color: AppColors.textColor2)
                      ]),
                      const SizedBox(height: 10),
                      AppLargeText(
                        text: 'People',
                        color: Colors.black.withOpacity(0.8),
                        size: 20,
                      ),
                      const SizedBox(height: 5),
                      AppText(text: 'Number of peoople in your group'),
                      const SizedBox(height: 10),
                      Wrap(
                        children: List.generate(5, (index) {
                          return InkWell(
                            onTap: () {
                              setState(() {
                                selectedIndex = index;
                              });
                            },
                            child: Container(
                              margin: const EdgeInsets.only(right: 10),
                              child: AppButtons(
                                color: selectedIndex == index
                                    ? Colors.white
                                    : Colors.black,
                                backgroundColor: selectedIndex == index
                                    ? Colors.black
                                    : AppColors.buttonBackground,
                                size: 50,
                                borderColor: selectedIndex == index
                                    ? Colors.black
                                    : AppColors.buttonBackground,
                                text: (1 + index).toString(),
                              ),
                            ),
                          );
                        }),
                      ),
                      SizedBox(height: 10),
                      AppLargeText(
                        text: 'Description',
                        color: Colors.black.withOpacity(0.8),
                        size: 20,
                      )
                    ],
                  ))),
        ],
      ),
    ));
  }
}
