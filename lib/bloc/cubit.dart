import 'package:api_app/bloc/state.dart';
import 'package:api_app/network/local/cashmemory.dart';
import 'package:api_app/network/rempte/dio.dart';
import 'package:api_app/screens/busniess.dart';
import 'package:api_app/screens/science.dart';
import 'package:api_app/screens/sport.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(InitNews());

  static NewsCubit get(BuildContext context) => BlocProvider.of(context);

  int currentindex = 0;

  List<BottomNavigationBarItem> bottomitems = const [
    BottomNavigationBarItem(icon: Icon(Icons.sports_soccer), label: "Sport"),
    BottomNavigationBarItem(
        icon: Icon(Icons.business_center), label: "Business"),
    BottomNavigationBarItem(icon: Icon(Icons.science), label: "Science"),
  ];
  List<Widget> bodyscreen = [Sport(), Busniess(), Science()];
  void changeinde(int index) {
    currentindex = index;
    emit(IncrementIndex());
  }

  List<dynamic> business = [];

  void getbusiness() {
    emit(NewsGetBusinessloadingstate());
    DioHelper.get(url: "v2/top-headlines", query: {
      "country": "eg",
      "category": "business",
      "apiKey": "f896f4545e7d42bab7f3615cfdf5f235"
    }).then((value) {
      business = value.data['articles'];
      emit(NewsGetBusinesssuccessstate());
    }).catchError((error) {
      print(error);
      emit(NewsGetBusinesserrorstate(error));
    });
  }

  List<dynamic> sport = [];

  void getsport() {
    emit(NewsGetSportloadingstate());
    DioHelper.get(url: "v2/top-headlines", query: {
      "country": "eg",
      "category": "sports",
      "apiKey": "f896f4545e7d42bab7f3615cfdf5f235"
    }).then((value) {
      sport = value.data['articles'];
      print(sport[0]);
      emit(NewsGetSportsuccessstate());
    }).catchError((error) {
      print(error);
      emit(NewsGetSporterrorstate(error));
    });
  }

  List<dynamic> science = [];

  void getscience() {
    emit(NewsGetSciensloadingstate());
    DioHelper.get(url: "v2/top-headlines", query: {
      "country": "eg",
      "category": "science",
      "apiKey": "f896f4545e7d42bab7f3615cfdf5f235"
    }).then((value) {
      science = value.data['articles'];
      emit(NewsGetScienssuccessstate());
    }).catchError((error) {
      print(error);
      emit(NewsGetScienserrorstate(error));
    });
  }

  bool isdark =CashHelper.getbooldata(key: "isdark")!;


  void changemode() {
    isdark = !isdark;
    CashHelper.setbooldata(key: "isdark",value: isdark);
    emit(ThemeModeChange());
  }

  List<dynamic> search = [];

  void getsearch(String value) {
    emit(NewsGetSearchloadingstate());
    DioHelper.get(
      url: "v2/everything", query: {
      "q": "$value",  
      "apiKey": "f896f4545e7d42bab7f3615cfdf5f235"
    }).then((value) {
      search = value.data['articles'];
      emit(NewsGetSearchsuccessstate());
    }).catchError((error) {
      print(error);
      emit(NewsGetSearcherrorstate(error));
    });
  }

}
