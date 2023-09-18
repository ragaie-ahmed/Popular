import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Popular/features/data/cubit/Popular/popular_cubit.dart';
import 'package:Popular/features/data/cubit/Popularinfo/popular_info_cubit.dart';
import 'package:Popular/features/presentation/screen/HomeScree.dart';

import 'core/App/blocconsumer.dart';

void main(){
  Bloc.observer = MyBlocObserver();
  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (context) => PopularCubit(),),
    BlocProvider(create: (context) => PopularInfoCubit(),)
  ],child: MyApp()));

}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
