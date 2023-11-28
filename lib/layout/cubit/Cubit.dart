import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../modules/Business_Screen/Business_Screen.dart';
import '../../modules/Science_Screen/Science_Screen.dart';
import '../../modules/Sport_Screen/Sport_Screen.dart';
import '../../newtwork/local/cache_helper.dart';
import '../../newtwork/remote/dio_helper.dart';
import 'States.dart';

class NewsCubit extends Cubit<NewsState>{
  NewsCubit(): super(NewsInitialState());
    static NewsCubit get(context)=> BlocProvider.of(context);

    int CurrentIndex=0;
    List<BottomNavigationBarItem> BottomItems=[
      BottomNavigationBarItem(
       icon: Icon(Icons.business_center),
       label: 'Business',
   ),
      BottomNavigationBarItem(
        icon: Icon(Icons.phone_android),
        label: 'Technology',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.newspaper),
        label: 'Others',
      ),
    ];
    List<Widget> Screens=[
      BusinessScreen(),
      ScienceScreen(),
      SportScreen(),

    ];
    List <dynamic>Business=[];
    void getSport(){
      emit(NewsLoadingState());
      DioHelper.getData(
          url: 'v2/everything',
          query: {
            'domains':'wsj.com',
           'apiKey':'fd158bab7482450485986c0b5290d80f'
          }).then((value) {
         Sport=value.data['articles'];
         emit(NewsGetBusinessSucState());
      }).catchError((error){
        print(error.toString());
        emit(NewsGetBusinessErrorState(error));
      });
    }
    List<dynamic> Tech=[];
  void getTech(){
    emit(NewsLoadingState());
    DioHelper.getData(
        url: 'v2/everything',
        query: {
          'sources':'techcrunch',
          'apiKey':'fd158bab7482450485986c0b5290d80f',
        }).then((value) {
      Tech=value.data['articles'];
      emit(NewsGetTechSucState());
    }).catchError((error){
      print(error.toString());
      emit(NewsGetTechErrorState(error));
    });
  }
   List <dynamic> Sport=[];
  void getBusiness(){
    emit(NewsLoadingState());
    DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country':'us',
          'category':'business',
          'apiKey':'fd158bab7482450485986c0b5290d80f',
        }).then((value) {
      Business=value.data['articles'];
      emit(NewsGetSportSucState());
    }).catchError((error){
      print(error.toString());
      emit(NewsGetSportErrorState(error));
    });
  }
    void changeBottomNavBar(int index){
      CurrentIndex=index;
      emit(NewsBottomNavState());
    }
    bool isdark=false;
   void changeThemeMode({bool? fromShared}){
     if(fromShared!=null){
       isdark=fromShared;
       emit(changeMode());
     }
     else
       isdark=!isdark;
      CacheHelper.putBool(key: 'isdark', value: isdark).then((value){
         emit(changeMode());});

     }



  List <dynamic> search=[];
  void getSearch(String value){
    emit(NewsSearchState());


    DioHelper.getData(
        url: 'v2/everything',
        query: {
          'q':'$value',
          'apiKey':'fd158bab7482450485986c0b5290d80f',
        }).then((value) {
      search=value.data['articles'];
      emit(NewsSearchSucState());
    }).catchError((error){
      print(error.toString());
      emit(NewsSearchErrorState(error));
    });
  }
   }