import 'package:flutter/material.dart';
import 'package:template_quiz_mobile_si_b/models/game_model.dart';

class DetailPage extends StatefulWidget {
  final int index;
  const DetailPage({super.key, required this.index});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final likedFocusNode = FocusNode();
  bool _liked = false;
  int likedplus = 0;

  void _toggleObscured() {
    setState(() {
      _liked = !_liked;
      if (likedFocusNode.hasPrimaryFocus) return;
      likedFocusNode.canRequestFocus = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Detail Order"),
          backgroundColor: Color(0xFFEF3C3B),
          foregroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(40.0),
            child: Column(
              children: [
                Image.asset(GameModel.gameList[widget.index].gameImg,
                    width: double.infinity),
                SizedBox(
                  height: 20,
                ),
                Text(
                  GameModel.gameList[widget.index].gameName,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                    "${GameModel.gameList[widget.index].gamePublisher} - ${GameModel.gameList[widget.index].gamePublishDate}"),
                SizedBox(
                  height: 20,
                ),
                Text(GameModel.gameList[widget.index].gameDesc),
                Row(
                  children: [
                    GestureDetector(
                      onTap: _toggleObscured,
                      child: Icon(
                        _liked ? Icons.favorite : Icons.favorite_border,
                        size: 24,
                        color: Color(0xFFEF3C3B),
                      ),
                    ),
                    Text(_liked
                        ? likedplus.toString()
                        : GameModel.gameList[widget.index].totalLike.toString())
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
