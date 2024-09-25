import 'package:apinew/bloc/home_cubit.dart';
import 'package:apinew/ui/Detail.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Listphimbo extends StatelessWidget {
  const Listphimbo({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeLoaded) {
          // Kiểm tra nếu ListMovile không rỗng
          if (state.ListPage2 != null && state.ListPage2.isNotEmpty) {
            return SizedBox(
              height: 280,
              child: ListView.builder(
                itemCount: state.ListPage2.length,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      try {
                        // Điều hướng đến DetailScreen với URL
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailScreen(
                              url: state.ListPage2[index].slug ?? "",
                            ),
                          ),
                        );
                      } catch (e) {
                        // In ra lỗi nếu có
                        print("Error navigating to DetailScreen: $e");
                      }
                    },
                    child: CachedNetworkImage(
                      imageUrl: _buildFullUrl(state.ListPage2[index].poster_url ?? ""),

                      height: 236,
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


