import 'package:flutter/material.dart';
import 'package:Popular/features/domain/model/PopularModel.dart';

class NameAuthor extends StatelessWidget {
   NameAuthor({
    super.key,
   required this.results
  });

  Results results;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 150,
      decoration: BoxDecoration(
          color: Colors.teal,
          borderRadius:BorderRadius.circular(20)
      ),
      child: Center(child: Text("${results.name}",style: TextStyle(color: Colors.white,fontSize: 20),)),
    );
  }
}