import 'package:flutter/material.dart';
import 'package:template_quiz_mobile_si_b/models/game_model.dart';

class DetailPage extends StatefulWidget {
  final int index;
  const DetailPage({super.key, required this.index});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Order"),
        backgroundColor: Color(0xFFEF3C3B),
        foregroundColor: Colors.white,
      ),
      body: Padding(
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
            Text(GameModel.gameList[widget.index].gameDesc)
          ],
        ),
      ),
    );
  }
}
