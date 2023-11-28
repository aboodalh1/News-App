import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/BlocOp.dart';
import 'package:news_app/layout/Cubit/Cubit.dart';
import 'package:news_app/layout/Cubit/States.dart';
import 'package:news_app/layout/splash_screen.dart';
import 'package:news_app/newtwork/local/cache_helper.dart';
import 'package:news_app/newtwork/remote/dio_helper.dart';
import 'package:news_app/styles/Themes.dart';

import 'layout/article_layout/main_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await CacheHelper.init();
  bool isDark= false;
  DioHelper.init();
  runApp(MyApp(isDark));
}

class MyApp extends StatelessWidget {
  final bool isDark;
  MyApp(this.isDark);
  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (BuildContext context)=>NewsCubit()..getBusiness()..getTech()..getSport(),
      child: BlocConsumer<NewsCubit,NewsState>(
        listener: (context,state){},
        builder:(context,state) {
          NewsCubit Cubit=NewsCubit.get(context);
          return  MaterialApp(
            debugShowCheckedModeBanner: false,
            themeMode: Cubit.isdark? ThemeMode.dark : ThemeMode.light,
            darkTheme: darkTheme ,
            theme: lightTheme,
            home: EasySplash(),
          );
        },
      ),
    );
  }
}
