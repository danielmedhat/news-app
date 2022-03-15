import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:newsera/cubit/cubit.dart';
import 'package:newsera/cubit/states.dart';
import 'package:newsera/shared/components.dart';

class NewsHome extends StatelessWidget {
  const NewsHome({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = NewsCubit.get(context).newsa;
        final AdWidget adWidget= AdWidget(ad: NewsCubit.get(context).myBanner);
        return Stack(
          alignment: AlignmentDirectional .bottomCenter,
          
      
          children: [
            ConditionalBuilder(
              
              condition: state is! Newloading,
              builder: (context) => 
              ListView.separated(
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) => buildArticleItem(list[index],context),
                  separatorBuilder: (context, index) =>
                      Padding(padding: EdgeInsets.only(top: 2)),
                  itemCount: list.length),
                  
              fallback: (context) => Center(
                child: CircularProgressIndicator(),
              ),
            ),
            Container(
              height: 60,
                width: double.infinity,
                child: adWidget,
            )
          ],
        );
      },
    );
  }
}
