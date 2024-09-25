import 'package:apinew/bloc/home_cubit.dart';
import 'package:apinew/ui/Detail.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Hoathinh extends StatelessWidget {
  const Hoathinh({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeLoaded) {
          // Kiểm tra nếu ListMovile không rỗng
          if (state.ListPage3 != null && state.ListPage3.isNotEmpty) {
            return SizedBox(
              height: 150,
              child: ListView.builder(
                itemCount: state.ListPage3.length,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      try {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailScreen(
                              url: state.ListPage3[index].slug ?? "",
                            ),
                          ),
                        );
                      } catch (e) {

                        print("Error navigating to DetailScreen: $e");
                      }
                    },
                    child: CachedNetworkImage(
                      imageUrl: _buildFullUrl(state.ListPage3[index].poster_url ?? ""),
                      width: 100,
                      height: 100,
                    ),

                  );
                },
              ),
            );
          } else {
            // Nếu không có dữ liệu trong ListMovile
            return Center(child: Text("No data available"));
          }
        }
        return Container();
      },
    );
  }
}
String _buildFullUrl(String? posterUrl) {
  if (posterUrl == null || posterUrl.isEmpty) {
    return "https://yourdomain.com/placeholder.jpg"; // URL hình ảnh mặc định nếu thiếu
  }
  return "https://phimimg.com/$posterUrl";
}


