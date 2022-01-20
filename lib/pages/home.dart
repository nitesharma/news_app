import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:news_app/model/model.dart';
import 'package:news_app/pages/news_en.dart';
import 'package:news_app/pages/news_hindi.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  List<NewsModel> news = [];
  int selectedItem = 0;

  bool serachBarTap = false;
  bool isPlaying = false;
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 450));
    super.initState();
  }

  void _handleOnPressed() {
    setState(() {
      isPlaying = !isPlaying;
      isPlaying ? _controller.forward() : _controller.reverse();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: kPrimary,

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: const Text('Bulletin News '),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              _handleOnPressed();
            },
            icon: AnimatedIcon(
              icon: AnimatedIcons.add_event,
              progress: _controller,
            ),
          ),
        ],
      ),
      body: (selectedItem == 0) ? const EnglishNews() : const HindiNews(),
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        children: [
          SpeedDialChild(
              onTap: () {
                selectedItem = 0;
                setState(() {});
              },
              backgroundColor: Colors.teal,
              child: const Icon(
                Icons.language,
              ),
              label: 'English'),
          SpeedDialChild(
              onTap: () {
                selectedItem = 1;
                setState(() {});
              },
              backgroundColor: Colors.teal,
              child: const Icon(
                Icons.language,
              ),
              label: 'Hindi'),
        ],
      ),
    );
  }
}
