
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../layout/Cubit/Cubit.dart';
import '../../layout/Cubit/States.dart';
import '../../shared/component/Components.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return BlocConsumer<NewsCubit,NewsState>(
     listener: (context,state){},
     builder: (context,state) {
       NewsCubit Cubit= NewsCubit.get(context);
       return ConditionalBuilder(
           condition: state is! NewsLoadingState,
           builder: (context) => ListView.separated(
             itemBuilder: (context,index)=> builtArticleItem(context,Cubit.Business[index]),
             separatorBuilder: (context,index)=> myDivider(),
             physics: BouncingScrollPhysics(),
             itemCount: Cubit.Business.length,
           ),
           fallback: (context) => Center(child: CircularProgressIndicator(),)
       );


     },
    );

  }
}
