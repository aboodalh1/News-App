
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../layout/Cubit/Cubit.dart';
import '../../layout/Cubit/States.dart';
import '../../shared/component/Components.dart';

class SearchScreen extends StatelessWidget {
   var searchController=TextEditingController();

  SearchScreen({super.key});
  @override
  Widget build(BuildContext context) {
      return BlocConsumer<NewsCubit,NewsState>(
          listener: (context,state){},
          builder: (context,state){
            NewsCubit Cubit=NewsCubit.get(context);
            var list =Cubit.search;
            return  Scaffold(
            appBar: AppBar(title: Text('Search'),),
            body: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  TextFormField(
                    onChanged: (value){
                   NewsCubit.get(context).getSearch(value);
                    },
                    controller: searchController,
                    decoration: InputDecoration(
                      label: Text('Search'),
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.text,
                    validator: (value){
                      if(value!.isEmpty){
                        return 'Search must not be empty';
                      }
                      else return null;
                    },

                  ),
                 Expanded(child:
                 ConditionalBuilder(
                     condition: list.length>0,
                     builder: (context) => ListView.separated(
                       itemBuilder: (context,index)=> builtArticleItem(context,list[index]),
                       separatorBuilder: (context,index)=> myDivider(),
                       physics: BouncingScrollPhysics(),
                       itemCount: list.length,
                     ),
                     fallback: (context)=>ConditionalBuilder(
                       condition: state is NewsSearchState,
                       builder: (context)=> Center(child: CircularProgressIndicator(),),
                       fallback: (context){
                         if(state is NewsSearchSucState) return Center(
                           child: Text('There is no results',style: TextStyle(
                             fontSize: 20,fontWeight: FontWeight.w600,color: Colors.grey
                           ),),
                         );
                         else return Container();
                       },),
                     ),
                 ),

                ],
              ),
            )
            ,
          );},
      );
  }
}
