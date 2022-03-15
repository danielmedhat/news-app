
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsera/cubit/cubit.dart';
import 'package:newsera/cubit/states.dart';
import 'package:newsera/layout/home.dart';
import 'package:newsera/shared/local/cache_helper.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key key}) : super(key: key);

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
     var height = MediaQuery.of(context).size.height;
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {},
      builder: (context, state) {
        
        return Scaffold(
            backgroundColor: Color(0xff282827),
            appBar: AppBar(
              actions: [
                TextButton(
                    onPressed: () async {
                      await CacheHelper.putData(
                              key: 'country', value: NewsCubit.get(context).afterSelect)
                          .then((value) {
                        print(value.toString());
                        CacheHelper.putData(key: 'onBoarding', value: true).then((value) {
                          if (value)
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(builder: (context) => AfterSplash()),
                                (route) => false);
                        });
                      
                      }).catchError((error) {
                        print(error.toString());
                      });
                    },
                    child: Text(
                      'Next',
                      style: TextStyle(fontSize: 20, color: Colors.blue),
                    ))
              ],
              backgroundColor: Color(0xff282827),
              elevation: 0.0,
            ),
            body: ListView(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 30),
                      child: Container(
                          height:height*0.22,
                          width:  height*0.22,
                          child: Image(
                            image: AssetImage('images/logo.png'),
                            fit: BoxFit.cover,
                          )),
                    ),
                    Text(
                      'Welcome',
                      style: TextStyle(fontSize: 50, color: Colors.blueGrey),
                    ),
                    Text(
                      'Please Select Your Country',
                      style: TextStyle(fontSize: 25, color: Colors.grey[600]),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                         
                          DropdownButton(
                              hint: Text(
                                'Select a country',
                                style: TextStyle(color: Colors.white),
                              ),
                              value: NewsCubit.get(context).selectedValue,
                              focusColor: Colors.white,
                              dropdownColor: Colors.grey[900],
                              style:
                                  TextStyle(color: Colors.white, fontSize: 25),
                              items: [
                                DropdownMenuItem(
                                  child: Text(
                                    "Australia",
                                  ),
                                  value: 1,
                                ),
                                
                                DropdownMenuItem(
                                  child: Text("België"),
                                  value: 13,
                                ),
                                DropdownMenuItem(
                                  child: Text("Brasil"),
                                  value: 3,
                                ),
                               
                                
                               
                                DropdownMenuItem(
                                  child: Text("Danmark"),
                                  value: 17,
                                ),
                                DropdownMenuItem(
                                  child: Text("Deutschland"),
                                  value: 8,
                                ),
                                 DropdownMenuItem(
                                  child: Text("France"),
                                  value: 4,
                                ),
                                
                                DropdownMenuItem(
                                  child: Text("Italia"),
                                  value: 9,
                                ),
                                
                                DropdownMenuItem(
                                  child: Text("Nederland"),
                                  value: 11,
                                ),
                                DropdownMenuItem(
                                  child: Text("Österreich"),
                                  value: 2,
                                ),
                                DropdownMenuItem(
                                  child: Text("Россия"),
                                  value: 15,
                                ),
                                DropdownMenuItem(
                                  child: Text("Portugal"),
                                  value: 16,
                                ),
                                DropdownMenuItem(
                                  child: Text("Sverige"),
                                  value: 18,
                                ),
                                 DropdownMenuItem(
                                  child: Text("Türkiye "),
                                  value: 14,
                                ),
                                 DropdownMenuItem(
                                  child: Text("UK"),
                                  value: 7,
                                ),
                                DropdownMenuItem(
                                  child: Text("USA"),
                                  value: 12,
                                ),
                               
                                DropdownMenuItem(
                                  child: Text("مصر"),
                                  value: 5,
                                ),
                                DropdownMenuItem(
                                  child: Text("الإمارات"),
                                  value: 6,
                                ),
                                 DropdownMenuItem(
                                  child: Text("भारत "),
                                  value: 19,
                                ),
                               
                                
                                 
                                
                              ],
                              onChanged: (value) {
                                print(value);
                                NewsCubit.get(context)
                                    .changeSelectedItem(value);
                                NewsCubit.get(context).insertCountry();
                                print(NewsCubit.get(context).afterSelect);
                              })
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            )

            
            );
      },
    );
  }  
}


