import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/cubit/app_cubit_state.dart';
import 'package:travel_app/cubit/app_cubits.dart';
import 'package:travel_app/misc/colors.dart';
import 'package:travel_app/widget/app_buttons.dart';
import 'package:travel_app/widget/app_large_text.dart';
import 'package:travel_app/widget/app_text.dart';
import 'package:travel_app/widget/responsive_button.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int gottenStars = 4;
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubits, CubitStates>(builder: (context, state) {
      DetailState detail = state as DetailState;
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
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                'http://mark.bslmeiyu.com/uploads/' +
                                    detail.place.img),
                            fit: BoxFit.cover)))),
            Positioned(
                left: 20,
                top: 20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        BlocProvider.of<AppCubits>(context).goHome();
                      },
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
                                  text: detail.place.name,
                                  color: Colors.black54),
                              AppLargeText(
                                text: '\$' + detail.place.price.toString(),
                                color: AppColors.mainColor,
                              ),
                            ]),
                        const SizedBox(height: 5),
                        Row(children: [
                          Icon(Icons.location_on, color: AppColors.mainColor),
                          AppText(
                            text: detail.place.location,
                            color: AppColors.textColor1,
                          )
                        ]),
                        const SizedBox(height: 10),
                        Row(children: [
                          Wrap(
                              children: List.generate(
                                  5,
                                  (index) => Icon(Icons.star,
                                      color: index < detail.place.stars
                                          ? AppColors.starColor
                                          : AppColors.textColor2))),
                          const SizedBox(width: 10),
                          AppText(text: '(5.0)', color: AppColors.textColor2)
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
                        // Description text
                        SizedBox(height: 10),
                        AppLargeText(
                          text: 'Description',
                          color: Colors.black.withOpacity(0.8),
                          size: 20,
                        ),
                        SizedBox(height: 5),
                        AppText(
                            text: detail.place.description,
                            color: AppColors.mainColor),
                      ],
                    ))),
            Positioned(
              bottom: 20,
              left: 20,
              right: 20,
              child: Row(
                children: [
                  AppButtons(
                      color: AppColors.textColor1,
                      backgroundColor: AppColors.buttonBackground,
                      size: 60,
                      icon: Icons.favorite_border,
                      isIcon: true,
                      borderColor: AppColors.textColor1),
                  SizedBox(width: 20),
                  ResponsiveButton(
                    // width: 100,
                    isResponsive: true,
                  )
                ],
              ),
            )
          ],
        ),
      ));
    });
  }
}
