import 'package:api_app/bloc/cubit.dart';
import 'package:api_app/bloc/state.dart';
import 'package:api_app/widgets/compondes.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Science extends StatelessWidget {
  const Science({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
        builder: (context, state) {
          return ConditionalBuilder(
            condition: state is! NewsGetSciensloadingstate,
            builder: (context) {
              var list = NewsCubit.get(context).science;
              if (list.isEmpty) {
                NewsCubit.get(context).getscience();
                list = NewsCubit.get(context).science;
              }
              return ListView.separated(
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    print(list[index]);
                    return bulidNews(context, list[index]);
                  },
                  separatorBuilder: (context, index) {
                    return Divider();
                  },
                  itemCount: list.length);
            },
            fallback: (context) => Center(child: CircularProgressIndicator()),
          );
        },
        listener: (context, state) {});
  }
}
