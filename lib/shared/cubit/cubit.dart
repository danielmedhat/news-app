import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:newsera/cubit/states.dart';
import 'package:newsera/shared/dio_helper.dart';
import 'package:newsera/shared/local/cache_helper.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInState());
  static NewsCubit get(contaxt) => BlocProvider.of(contaxt);
 

  String country = CacheHelper.getData(key: 'country') ?? 'eg';
  int selectedValue;
  String afterSelect;

  

  List<dynamic> newsa = [];
  void getData() {
    emit(Newloading());
    DioHelper.getDta(query: {
      'country': country,
      'apiKey': 'c70a73dce1b1407480aaec664ae9ffdc'
      
    }, url: 'v2/top-headlines')
        .then((value) {
      
      newsa = value.data['articles'];
      myInterstitial.load().then((value) {
        emit(OpenAd());
      });
      
      emit(NewsGetSucess());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGeterror(error.toString()));
    });
  }

  bool isDark = false;
  ThemeMode mode;

  var bannerAd = BannerAd;



  void changeTheme() {
    isDark = !isDark;
    
    CacheHelper.putData(key: 'isdark', value: isDark).then((value) => {
          print(isDark),
          emit(NewsPutDark()),
        });
    print(mode.toString());
  }

 

  

  final InterstitialAd myInterstitial = InterstitialAd(

      // Test UnitID
      adUnitId:// 'ca-app-pub-1793256327308832/6752881817',
      'ca-app-pub-3940256099942544/1033173712',
      

      request: AdRequest(),
      listener: AdListener(
        // Called when an ad is successfully received.
        onAdLoaded: (Ad ad) => print('Ad loaded.'),
        // Called when an ad request failed.
        onAdFailedToLoad: (Ad ad, LoadAdError error) {
          ad.dispose();
          print('Ad failed to load: $error');
        },
        // Called when an ad opens an overlay that covers the screen.
        onAdOpened: (Ad ad) => print('Ad opened.'),
        // Called when an ad removes an overlay that covers the screen.
        onAdClosed: (Ad ad) {
          ad.dispose().then((value) {});

          print('Ad closed.');
        },
        // Called when an ad is in the process of leaving the application.
        onApplicationExit: (Ad ad) => print('Left application.'),
      ));

  final BannerAd myBanner = BannerAd(
    adUnitId: //'ca-app-pub-1793256327308832/6780801975',
    'ca-app-pub-3940256099942544/6300978111',
    
    request: AdRequest(),
    size: AdSize.fullBanner,
    listener: AdListener(
      onAdLoaded: (Ad ad) {
        print('$BannerAd loaded.');
      },
      onAdFailedToLoad: (Ad ad, LoadAdError error) {
        print('$BannerAd failedToLoad: $error');
      },
      onAdOpened: (Ad ad) => print('$BannerAd onAdOpened.'),
      onAdClosed: (Ad ad) => print('$BannerAd onAdClosed.'),
      onApplicationExit: (Ad ad) => print('$BannerAd onApplicationExit.'),
    ),
  );

  
  void changeSelectedItem(int value) {
    selectedValue = value;
    emit(ValueSetSuccess());
  }

  void insertCountry() {
    if (selectedValue == 1) {
      afterSelect = 'au';
    } else if (selectedValue == 2) {
      afterSelect = 'at';
    } else if (selectedValue == 3) {
      afterSelect = 'br';
    } else if (selectedValue == 4) {
      afterSelect = 'fr';
    } else if (selectedValue == 5) {
      afterSelect = 'eg';
    } else if (selectedValue == 6) {
      afterSelect = 'ae';
    } else if (selectedValue == 7) {
      afterSelect = 'gb';
    } else if (selectedValue == 8) {
      afterSelect = 'de';
    } else if (selectedValue == 9) {
      afterSelect = 'it';
     
    } else if (selectedValue == 11) {
      afterSelect = 'nl';
    } else if (selectedValue == 12) {
      afterSelect = 'us';
    } else if (selectedValue == 13) {
      afterSelect = 'be';
    } else if (selectedValue == 14) {
      afterSelect = 'tr';
    } else if (selectedValue == 15) {
      afterSelect = 'ru';
    } else if (selectedValue == 16) {
      afterSelect = 'pt';
    } else if (selectedValue == 17) {
      afterSelect = 'gr';
    } else if (selectedValue == 18) {
      afterSelect = 'se';
    } else if (selectedValue == 19) {
      afterSelect = 'in';
    }
  }
}
