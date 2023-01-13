import 'package:api_app/bloc/cubit.dart';
import 'package:api_app/bloc/state.dart';
import 'package:api_app/widgets/compondes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Search extends StatelessWidget {
  TextEditingController search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      builder: (context, state) {
        List list = NewsCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(),
          body: Center(
            child: Column(children: [
             
              TextField(
               
                keyboardType: TextInputType.text,
                controller: search,
                onSubmitted: (value) {
                   NewsCubit.get(context).getsearch(value);
                },
                
                decoration: InputDecoration(
                    hintText: "Search",
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18))),
              ),
              Expanded(
                child: ListView.separated(
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      print(list[index]);
                      return bulidNews(context, list[index]);
                    },
                    separatorBuilder: (context, index) {
                      return Divider();
                    },
                    itemCount: list.length),
              )
            ]),
          ),
        );
      },
      listener: (context, state) {},
    );
  }
}
