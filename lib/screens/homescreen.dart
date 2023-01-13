import 'package:api_app/bloc/cubit.dart';
import 'package:api_app/bloc/state.dart';
import 'package:api_app/screens/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeApp extends StatelessWidget {
  const HomeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      builder: (BuildContext context, state) {
        NewsCubit obj = NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            actions: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.1,
                child: IconButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) {
                          return Search();
                        },
                      ));
                    },
                    icon: Icon(Icons.search)),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.1,
                child: IconButton(
                    onPressed: () {
                      obj.changemode();
                    },
                    icon: Icon(Icons.brightness_medium_outlined)),
              ),
            ],
            title: Text("News App"),
          ),
          bottomNavigationBar: BottomNavigationBar(
              currentIndex: obj.currentindex,
              items: obj.bottomitems,
              onTap: ((value) {
                obj.changeinde(value);
              })),
          body: obj.bodyscreen[obj.currentindex],
        );
      },
      listener: (BuildContext context, Object? state) {},
    );
  }
}
