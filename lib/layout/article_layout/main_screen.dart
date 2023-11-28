import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../layout/Cubit/Cubit.dart';
import '../../layout/Cubit/States.dart';
import '../../modules/Search_Screen/Search_Screen.dart';
import '../../shared/component/Components.dart';


class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NewsCubit Cubit=NewsCubit.get(context);
    return BlocConsumer<NewsCubit,NewsState>(
      listener: (context,state){},
      builder: (context,state){
        return Scaffold(
          appBar: AppBar(
            title: Text('News App'),
            actions: [
              IconButton(
                onPressed: () {
                  navigateTo(context,SearchScreen());
                },
                icon: Icon(Icons.search),
              ),
              IconButton(
                onPressed: () {
                  Cubit.changeThemeMode();
                },
                icon: Icon(Icons.brightness_4_outlined),
              ),
            ],
          ),
          body:
          Cubit.Screens[Cubit.CurrentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: Cubit.CurrentIndex,
            items: Cubit.BottomItems,
            onTap: (index) {
              Cubit.changeBottomNavBar(index);
            },
          ),
        );
      },
    );
  }
}
