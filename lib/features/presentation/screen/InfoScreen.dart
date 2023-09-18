import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Popular/core/App/AppConstatnt.dart';
import 'package:Popular/features/data/cubit/Popular/popular_cubit.dart';
import 'package:Popular/features/data/cubit/Popularinfo/popular_info_cubit.dart';
import 'package:Popular/features/data/cubit/Popularinfo/popular_info_state.dart';
import 'package:Popular/features/data/request/Popular_Request.dart';
import 'package:Popular/features/domain/model/PopularModel.dart';
import 'package:Popular/features/presentation/screen/Imagepreview.dart';

class InfoScreen extends StatefulWidget {
  InfoScreen({super.key, required this.id});

  int id;

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  @override
  void initState() {
    PopularInfoCubit.get(context).getpopularInfo(widget.id);
    PopularInfoCubit.get(context).getdata(widget.id);
    super.initState();
  }

  Widget build(BuildContext context) {
    return BlocConsumer<PopularInfoCubit, PopularInfoState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.teal,
            iconTheme: IconThemeData(color: Colors.white),
            title: Text(
              "Details About  ${PopularInfoCubit.get(context).popularinfo.alsoKnownAs} ",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            centerTitle: true,
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                state is PopularInfoloading
                    ? Container(child: CircularProgressIndicator())
                    : Container(
                        height: MediaQuery.of(context).size.height / 2 - 40,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20)),
                            color: Colors.teal),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Location of Birth:${PopularInfoCubit.get(context).popularinfo.placeOfBirth}",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            ),
                            Text(
                              "Birthday:${PopularInfoCubit.get(context).popularinfo.birthday}",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                            Text(
                              "Popularity:${PopularInfoCubit.get(context).popularinfo.popularity} ",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                            Text(
                              "Birthday:${PopularInfoCubit.get(context).popularinfo.birthday}",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                Container(
                  height: MediaQuery.of(context).size.height / 2 - 40,
                  child: ListView.separated(
                      itemBuilder: (context, index) {
                        return InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return ImagePreview(
                                    height: PopularInfoCubit.get(context).popularImage.profiles![index].height??300,
                                    width: PopularInfoCubit.get(context).popularImage.profiles![index].width??300,
                                    path:
                                        PopularInfoCubit.get(context)
                                            .popularImage
                                            .profiles![index]
                                            .filePath! ,
                                  );
                                },
                              ));
                            },
                            child: Image.network(
                              AppConstant.baseImage +
                                  PopularInfoCubit.get(context)
                                      .popularImage
                                      .profiles![index]
                                      .filePath!,
                              width: 300,
                              height: 300,
                            ));
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          height: 16,
                        );
                      },
                      itemCount: PopularInfoCubit.get(context)
                          .popularImage
                          .profiles!
                          .length),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
