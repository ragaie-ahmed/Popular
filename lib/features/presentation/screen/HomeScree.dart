import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Popular/features/data/cubit/Popular/popular_cubit.dart';
import 'package:Popular/features/data/cubit/Popular/popular_state.dart';
import 'package:Popular/features/presentation/screen/InfoScreen.dart';
import 'package:Popular/features/presentation/widget/NameAuthor.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
PopularCubit.get(context).fetchdata();
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text("Popular List",style: TextStyle(fontSize: 20,color: Colors.white),),
      ),
      body: Padding(
        padding:  EdgeInsets.all(15),
        child: BlocConsumer<PopularCubit, PopularState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    return state is Popularloading ?Center(child: CircularProgressIndicator()): ListView.separated(physics: BouncingScrollPhysics(),itemBuilder: (context, index) {
          return InkWell(onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return InfoScreen(id:int.parse(PopularCubit.get(context).PouplarList[index].id.toString()),);
            },));
          },child: NameAuthor(results: PopularCubit.get(context).PouplarList[index],));
        }, separatorBuilder: (context, index) {
          return SizedBox(height: 18,);
        }, itemCount: PopularCubit.get(context).PouplarList.length);
  },
),
      ),
    );
  }
}


