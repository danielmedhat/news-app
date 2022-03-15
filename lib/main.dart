import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:newsera/cubit/cubit.dart';
import 'package:newsera/cubit/states.dart';
import 'package:newsera/layout/home.dart';
import 'package:newsera/shared/dio_helper.dart';
import 'package:newsera/shared/local/cache_helper.dart';

Future <void> main()async  {
   
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  await CacheHelper.init();
  DioHelper.inti();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  List<dynamic> mode = [
    'dark'
        'light'
  ];
  
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => NewsCubit(),
      child: BlocConsumer<NewsCubit, NewsState>(
          listener: (context, state) {},
          builder: (context, state) {
            return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Flutter Demo',
                theme: ThemeData(
                    textTheme: TextTheme(
                        bodyText1: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                    scaffoldBackgroundColor: Colors.white,
                    bottomNavigationBarTheme: BottomNavigationBarThemeData(
                        type: BottomNavigationBarType.fixed,
                        selectedItemColor: Colors.amber),
                    appBarTheme: AppBarTheme(
                        iconTheme: IconThemeData(color: Colors.black),
                        elevation: 0.0,
                        actionsIconTheme: IconThemeData(color: Colors.black),
                        backgroundColor: Colors.white,
                        titleTextStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                        backwardsCompatibility: false,
                        systemOverlayStyle: SystemUiOverlayStyle(
                            statusBarColor: Colors.white,
                            statusBarIconBrightness: Brightness.dark))),
                darkTheme: ThemeData(
                    textTheme: TextTheme(
                        bodyText1: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                    scaffoldBackgroundColor: Colors.grey[900],
                    bottomNavigationBarTheme: BottomNavigationBarThemeData(
                        type: BottomNavigationBarType.fixed,
                        selectedItemColor: Colors.amber,
                        unselectedItemColor: Colors.white,
                        backgroundColor: Colors.grey[900]),
                    appBarTheme: AppBarTheme(
                      elevation: 0.0,
                      actionsIconTheme: IconThemeData(color: Colors.white),
                      backgroundColor: Colors.grey[900],
                      titleTextStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                      backwardsCompatibility: false,
                      systemOverlayStyle: SystemUiOverlayStyle(
                          statusBarColor: Colors.grey[900],
                          statusBarIconBrightness: Brightness.light),
                    )),
                themeMode:(CacheHelper.getData(key: 'isdark')==null)?ThemeMode.light:(CacheHelper.getData(key: 'isdark'))?ThemeMode.light:ThemeMode.dark,
               
                home: Home());
          }),
    );
  }
}




//The api 
//https://newsapi.org/v2/top-headlines?country=eg&apiKey=c70a73dce1b1407480aaec664ae9ffdc