import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/cubit/app_cubits.dart';
import 'package:travel_app/misc/colors.dart';
import 'package:travel_app/widget/app_large_text.dart';
import 'package:travel_app/widget/app_text.dart';
import 'package:travel_app/widget/responsive_button.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List images = [
    "welcome-one.png",
    "welcome-two.png",
    "welcome-three.png",
  ];

  List text = [
    "Trips",
    "Vacations",
    "Relaxations",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView.builder(
            scrollDirection: Axis.vertical,
            itemCount: images.length,
            itemBuilder: (_, index) {
              return Container(
                width: double.maxFinite,
                height: double.maxFinite,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("img/" + images[index]),
                        fit: BoxFit.cover)),
                child: Container(
                  margin: const EdgeInsets.only(top: 100, left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppLargeText(
                              text: text[index],
                            ),
                            AppText(text: 'Mountain', size: 30),
                            const SizedBox(height: 30.0),
                            // ignore: sized_box_for_whitespace
                            Container(
                              width: 250,
                              child: AppText(
                                  text:
                                      'Mountain heights gives you an incredible sense of freedom along with endurance test.',
                                  color: AppColors.textColor2,
                                  size: 14.0),
                            ),
                            const SizedBox(height: 30.0),
                            GestureDetector(
                              onTap: () {
                                BlocProvider.of<AppCubits>(context).getData();
                              },
                              child: Container(
                                  width: 200.0,
                                  child: Row(
                                    children: [
                                      ResponsiveButton(width: 120),
                                    ],
                                  )),
                            ),
                          ]),
                      Column(
                        children: List.generate(
                          3,
                          (indexDots) {
                            return Container(
                                margin: const EdgeInsets.only(bottom: 3.0),
                                width: 8.0,
                                height: index == indexDots ? 25 : 8,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: index == indexDots
                                        ? AppColors.mainColor
                                        : AppColors.mainColor
                                            .withOpacity(0.3)));
                          },
                        ),
                      )
                    ],
                  ),
                ),
              );
            }));
  }
}
