

import 'dart:async';
import 'package:apinew/bloc/home_cubit.dart';
import 'package:apinew/bloc/search_cubit.dart';
import 'package:apinew/model/Listphimle/items.dart';
import 'package:apinew/ui/Detail.dart';
import 'package:apinew/widget/All_movie.dart';
import 'package:apinew/widget/Hoathinh.dart';
import 'package:apinew/widget/ListMovie.dart';
import 'package:apinew/widget/Movi_phimbo.dart';
import 'package:apinew/widget/Movi_phimle.dart';
import 'package:apinew/widget/popular_movies_list.dart';
import 'package:apinew/widget/tvshow.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../api/api_listhome.dart';

class SearchScreen extends StatefulWidget {
  final TextEditingController textEditingController;
  const SearchScreen({required this.textEditingController,super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  void addtext ( String vla1){
    context.read<SearchCubit>().search(vla1);
  }
  String searchText = '';
  Timer? debounce;
  @override
  void initState() {

    super.initState();
    context.read<SearchCubit>().search(widget.textEditingController.text.trim());
    widget.textEditingController.addListener(() {
      if (debounce?.isActive ?? false) debounce?.cancel();
      debounce = Timer(const Duration(milliseconds: 600),(){
        context.read<SearchCubit>().search(widget.textEditingController.text.trim());

      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:  Padding(

          padding: const EdgeInsets.only(top: 53),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: TextFormField(
                  controller: widget.textEditingController,
                  style: TextStyle(color:Colors.black),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(top: 15),
                    focusedBorder: InputBorder.none,
                    prefixIcon: IconButton(
                      onPressed: () {
                        if (widget.textEditingController.text.isNotEmpty) {
                          context
                              .read<SearchCubit>()
                              .search(widget.textEditingController.text.trim());
                        } else {
                        }
                      },
                      icon: Icon(
                        Icons.search_outlined,
                        color: Colors.black,
                      ),
                    ),
                    filled: true,
                    fillColor: Colors.black12,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 0, color: Colors.deepOrange),
                    ),
                  ),
                ),
              ),

              BlocBuilder<SearchCubit, SearchState>(
                  builder: (context, state) {
                    if (state is SearchLoading) {
                      return Center(
                        child: SizedBox(
                          height: 401,
                          child: Container(),
                        ),
                      );
                    } else if (state is SearchSuccess) {
                      final queryedList = state.data;
                      if (queryedList.isEmpty) {
                        return Container();
                      }
                      return Expanded(
                        child: SearchTermsDetails(
                          queryMovies: queryedList,
                          searchTerm: widget.textEditingController,
                        ),
                      );
                    } else {
                      return Center(
                        child: Text(
                          'Opps, something went wrong',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.red,
                          ),
                        ),
                      );
                    }
                  }
                  ),
            ]

          ),
        ),
    );
  }
}
class SearchTermsDetails extends StatefulWidget {
  final TextEditingController searchTerm;
  List<Items> queryMovies;
  SearchTermsDetails({
    Key? key,
    required this.searchTerm,
    required this.queryMovies,
  }) : super(key: key);

  @override
  State<SearchTermsDetails> createState() => SearchTermsDetailsState();
}

class SearchTermsDetailsState extends State<SearchTermsDetails> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 30,
        ),
        RichText(
          text: TextSpan(
            children: <TextSpan>[

              TextSpan(
                  text: 'kết quả tìm kiếm ${widget.searchTerm.text} ',
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 15,
                      fontStyle: FontStyle.italic)),
              TextSpan(
                text: '[ ${widget.queryMovies.length.toString()} ]',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.red,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Expanded(
          child: ListView.separated(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            itemCount: widget.queryMovies.length,
            itemBuilder: (context, index) {
              return popularMovies(context,
                  widget.queryMovies[index].name??"",
                  widget.queryMovies[index].origin_name??"",
                  widget.queryMovies[index].poster_url??"",
                  widget.queryMovies[index].time??"",
                widget.queryMovies[index].slug??"",

              );
            },
            separatorBuilder: (BuildContext context, int index) => SizedBox(
              height: 22,
            ),
          ),
        ),
      ],
    );
  }
}




