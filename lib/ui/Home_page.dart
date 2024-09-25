import 'package:apinew/CustomListHome.dart';
import 'package:apinew/api/api_listhome.dart';
import 'package:apinew/bloc/home_cubit.dart';

import 'package:apinew/ui/Detail.dart';
import 'package:apinew/ui/search.dart';
import 'package:apinew/widget/All_movie.dart';
import 'package:apinew/widget/Hoathinh.dart';
import 'package:apinew/widget/Movi_phimbo.dart';
import 'package:apinew/widget/Movi_phimle.dart';
import 'package:apinew/widget/tvshow.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController searchTermController = TextEditingController();
  late HomeCubit _ListHome;
  final url = Data(Dio());

  @override
  void initState() {
    _ListHome = HomeCubit(url);
    // TODO: implement initState
    _ListHome.data();

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>(
      create: (context) => _ListHome,
      child: DefaultTabController(
          length: 5,
          child: Scaffold(
            appBar: AppBar(
              title: Text("hihihihi"),
              actions: [
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchScreen(textEditingController: searchTermController ,)));
                  },
                ),
              ],
              bottom: TabBar(
                tabs: [
                  Tab(
                    child: Text("Tất cả Phim"),
                  ),
                  Tab(
                    child: Text("Phim Bộ"),
                  ),
                  Tab(
                    child: Text("Hoạt Hình"),
                  ),
                  Tab(
                    child: Text("TV Show"),
                  ),
                  Tab(
                    child: Text("Phim Lẻ"),
                  )
                ],
              ),
            ),
            body: TabBarView(
              children: [
                AllMovie(),
                Listphimbo(),
                Hoathinh(),
                Tvshow(),
               Listphimle()
              ],
            ),
          )),
    );
  }
}
