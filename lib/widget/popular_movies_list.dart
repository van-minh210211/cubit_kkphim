import 'package:apinew/ui/Detail.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
Widget popularMovies(
  BuildContext context,
  String title,
  String description,
  String image,
  String time,
  String slug ,
) {
  return InkWell(
    onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DetailScreen(
                  url: slug)));
    },
    child: Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 10,
        ),
        SizedBox(
          width: 160,
          child: Stack(
            children: [
              Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: CachedNetworkImage(
                    width: 170,
                    fit: BoxFit.cover,
                    imageUrl: image,
                    errorWidget: (context, url, error) => Image.network(
                      _buildFullUrl(image),
                     height: 170,
                      width: 160,
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
        SizedBox(
          height: 8,
        ),
       Column(
         mainAxisSize: MainAxisSize.min,
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           Text(
             title,
             style: TextStyle(
                 fontWeight: FontWeight.bold,
                 color: Colors.red,
                 fontSize: 15.sp),
             maxLines: 1,
             overflow: TextOverflow.ellipsis,
           ),
           Text(
             description,
               overflow: TextOverflow.clip,
             maxLines: 1

           ),
           Text(
               time,
               overflow: TextOverflow.clip,
               maxLines: 1

           ),
         ],
       )
      ],
    ),
  );
}
String _buildFullUrl(String? posterUrl) {
  if (posterUrl == null || posterUrl.isEmpty) {
    return "https://yourdomain.com/placeholder.jpg"; // URL hình ảnh mặc định nếu thiếu
  }
  return "https://phimimg.com/$posterUrl";
}


// Widget popularMoviesVertical(BuildContext context, String title,
//     String description, String image, List genre, int id, String ytLink) {
//   return InkWell(
//     onTap: () {
//       // Navigator.push(
//       //   context,
//       //   MaterialPageRoute(
//       //       builder: (context) => DetailsScreen(
//       //             movieId: id,
//       //             ytLink: ytLink,
//       //           )),
//       // );
//     },
//     child: Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         SizedBox(
//           width: 160.w,
//           child: Stack(
//             children: [
//               Container(
//                 height: 100.h,
//                 decoration: BoxDecoration(
//                   boxShadow: [
//                     BoxShadow(
//
//                       spreadRadius: 1.r,
//                       blurRadius: 10.r,
//                     ),
//                   ],
//                 ),
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(8.0.r),
//                   child: CachedNetworkImage(
//                     imageUrl: image,
//                     width: 160.w,
//                     fit: BoxFit.cover,
//                     errorWidget: (context, url, error) => Image.network(
//                       'https://images.unsplash.com/photo-1628155930542-3c7a64e2c833?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8bm8lMjBpbWFnZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=600&q=60',
//                       fit: BoxFit.cover,
//                     ),
//
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Align(
//                   alignment: Alignment.topRight,
//                   child: Container(
//
//                     padding: const EdgeInsets.all(3),
//                     child: const Text(
//                       'HD',
//                       style: TextStyle(fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//         SizedBox(
//           width: 12.w,
//         ),
//         Column(
//           children: [
//             SizedBox(
//               width: 180.w,
//               child: Text(
//                 title,
//                 style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                     fontSize: 14.sp),
//                 maxLines: 1,
//                 overflow: TextOverflow.ellipsis,
//               ),
//             ),
//             SizedBox(
//               height: 5.h,
//             ),
//             SizedBox(
//               width: 180.w,
//               child: Text(
//                 description,
//                 overflow: TextOverflow.ellipsis,
//                 maxLines: 2,
//
//
//               ),
//             ),
//             SizedBox(
//               height: 38.h,
//             ),
//
//             //taking each item of list genre and returing a Text widget
//             SizedBox(
//               width: 180.w,
//               //using row we got overflow...and didn't want to make such a tiny scrollable row here..not good ui i think
//               child: Wrap(
//                 children: genre.map((var item) {
//                   return Text(
//                     item + ', ',
//                     style: TextStyle(
//
//                         fontSize: 12.sp,
//                         fontWeight: FontWeight.w300),
//                   );
//                 }).toList(),
//               ),
//             ),
//           ],
//         ),
//       ],
//     ),
//   );
// }

