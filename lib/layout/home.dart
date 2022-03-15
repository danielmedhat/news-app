import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsera/cubit/cubit.dart';
import 'package:newsera/cubit/states.dart';
import 'package:newsera/main.dart';
import 'package:newsera/modules/news.dart';
import 'package:newsera/modules/on_boarding.dart';
import 'package:newsera/shared/local/cache_helper.dart';
import 'package:splashscreen/splashscreen.dart';

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
      seconds: 3,
      navigateAfterSeconds: (CacheHelper.getData(key: 'onBoarding') == null)
          ? OnBoardingScreen()
           : AfterSplash(),
      photoSize: 130,
      loadingText: Text(
        'Loading...',
        style: TextStyle(color: Colors.white, fontSize: 15),
      ),
      useLoader: true,
      title: new Text(
        'NEWSERA',
        style: new TextStyle(
            letterSpacing: 10,
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20.0),
      ),
      image: Image(
        image: AssetImage(
          'images/logo.png',
        ),
      ),
      backgroundColor: Color.fromRGBO(40, 40, 39, 1),
      loaderColor: Colors.blue,
    );
  }
}

class AfterSplash extends StatelessWidget {
  const AfterSplash({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => NewsCubit()
        ..getData()
        ..myInterstitial.load()
        ..myBanner.load(),
      child: BlocConsumer<NewsCubit, NewsState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
              
              appBar: AppBar(
                actions: [
                  IconButton(
                      onPressed: () {
                        
                        NewsCubit.get(context).changeTheme();
                        main();
                      },
                      icon: Icon(
                        Icons.dark_mode,
                        
                      ))
                ],
                title: Text('Newsera'),
              ),
              body: RefreshIndicator(
                  onRefresh: () async {
                    return NewsCubit.get(context).getData();
                  },
                  child: NewsHome())
              );
        },
      ),
    );
  }
}
