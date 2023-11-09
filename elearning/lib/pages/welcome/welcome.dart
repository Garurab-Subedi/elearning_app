import 'package:dots_indicator/dots_indicator.dart';
import 'package:elearning/pages/welcome/bloc/welcome.events.dart';
import 'package:elearning/pages/welcome/bloc/welcome_blocs.dart';
import 'package:elearning/pages/welcome/bloc/welcome_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(
          // ignore: sized_box_for_whitespace
          body: BlocBuilder<WelcomeBloc, WelcomeState>(
        builder: (context, state) {
          return Container(
            margin: EdgeInsets.only(top: 34.h),
            width: 375.w,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                PageView(
                  onPageChanged: (index) {
                    state.page = index;
                    BlocProvider.of<WelcomeBloc>(context).add(WelcomeEvent());
                    print("index value is ($index)");
                  },
                  children: [
                    _page(
                      1,
                      context,
                      "next",
                      "First See Learning",
                      "Forget about a for of paper all knowledge in on learning",
                      "assets/images/reading.png",
                    ),
                    _page(
                      2,
                      context,
                      "next",
                      "Always Fascinated Learning",
                      "Anywhere, anytime. The time is at your discretion so study whenever you want. ",
                      "ssets/images/boy.png",
                    ),
                    _page(
                      3,
                      context,
                      "get started",
                      "Connect with EveryOne",
                      "Forget about a for of paper all knowledge in on learning",
                      "ssets/images/man.png",
                    ),
                  ],
                ),
                Positioned(
                    bottom: 100.h,
                    child: DotsIndicator(
                      position: state.page.toInt(),
                      dotsCount: 3,
                      mainAxisAlignment: MainAxisAlignment.center,
                      decorator: DotsDecorator(
                          color: Colors.grey,
                          size: const Size.square(8.0),
                          activeColor: Colors.red,
                          activeSize: const Size(18.0, 8.0),
                          activeShape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0))),
                    ))
              ],
            ),
          );
        },
      )),
    );
  }

  Widget _page(int index, BuildContext context, String buttonName, String title,
      String subTitle, String imagePath) {
    return Column(
      children: [
        SizedBox(
          width: 345.w,
          height: 345.w,
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
        ),
        // ignore: avoid_unnecessary_containers
        Container(
            child: Text(
          title,
          style: TextStyle(
            color: Colors.black,
            fontSize: 24.sp,
            fontWeight: FontWeight.normal,
          ),
        )),
        Container(
            padding: EdgeInsets.only(left: 30.w, right: 30.w),
            child: Text(
              subTitle,
              style: TextStyle(
                color: Colors.black.withOpacity(0.5),
                fontSize: 14.sp,
                fontWeight: FontWeight.normal,
              ),
            )),
        Container(
          margin: EdgeInsets.only(top: 100.h, left: 25.w, right: 25.w),
          width: 325.w,
          height: 50.h,
          decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.all(Radius.circular(15.w)),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: const Offset(0, 5))
              ]),
          child: Center(
              child: Text(
            buttonName,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
            ),
          )),
        ),
      ],
    );
  }
}
