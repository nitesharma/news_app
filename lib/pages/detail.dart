// import 'package:flutter/material.dart';
// import 'package:news_app/model/model.dart';

// class Detail extends StatefulWidget {
//   const Detail({
//     Key? key,
//     required this.news,
//     required this.index,
//   }) : super(key: key);

//   final List<NewsModel> news;
//   final int index;

//   @override
//   _DetailState createState() => _DetailState();
// }

// class _DetailState extends State<Detail> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Padding(
//         padding: const EdgeInsets.all(14.0),
//         child: Column(
//           children: [
//             Container(
//               height: 200,
//               width: MediaQuery.of(context).size.width,
//               decoration: BoxDecoration(
//                   image: DecorationImage(
//                       image: NetworkImage(widget.news[widget.index].imageUrl!),
//                       fit: BoxFit.cover),
//                   // color: Colors.red,
//                   borderRadius: BorderRadius.circular(18)),
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             Text(
//               widget.news[widget.index].title!,
//               style: const TextStyle(
//                 fontSize: 22,
//               ),
//               textAlign: TextAlign.justify,
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             Text(
//               widget.news[widget.index].description!,
//               style: TextStyle(color: Colors.grey),
//             ),
//             const SizedBox(
//               height: 5,
//             ),
//             Text(
//               widget.news[widget.index].content!,
//               style: const TextStyle(
//                 fontSize: 22,
//               ),
//               textAlign: TextAlign.justify,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
