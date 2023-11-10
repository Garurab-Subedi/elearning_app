import 'package:elearning/pages/sign_in/sign_in.dart';
import 'package:elearning/pages/welcome/bloc/welcome_blocs.dart';
import 'package:elearning/pages/welcome/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => WelcomeBloc(),
          ),
        ],
        child: ScreenUtilInit(
          builder: (context, child) => MaterialApp(
            debugShowCheckedModeBanner: false,
            home: const Welcome(),
            routes: {
              "signIN": (context) => const SignIn(),
            },
          ),
        ));
  }
}
