import 'package:flutter/material.dart';
import 'package:template_quiz_mobile_si_b/models/game_model.dart';
import 'package:template_quiz_mobile_si_b/ui/login_page.dart';

class HomePage extends StatefulWidget {
  final String username;
  const HomePage({super.key, required this.username});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFEF3C3B),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome,',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              Text(
                widget.username,
                style: TextStyle(fontSize: 14, color: Colors.white),
              )
            ],
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                  builder: (context) {
                    return LoginPage();
                  },
                ), (route) => false);
              },
              icon: Icon(Icons.logout_outlined),
              color: Colors.white,
            )
          ],
        ),
        body: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: GridView.builder(
                itemCount: GameModel.gameList.length,
                shrinkWrap: true, // biar gabung sama ScrollView utama apk
                physics: NeverScrollableScrollPhysics(), //offin scroll ganda
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1, // ini biar tampil per 2 kolom
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 0.95),
                itemBuilder: (context, index) {
                  return _gameCard(context, index);
                }),
          )
        ])));
  }

  Widget _gameCard(BuildContext context, int index) {
    return Container(
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 253, 210, 209),
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            child: SizedBox(
              height: 250,
              width: double.infinity,
              child: Image.asset(GameModel.gameList[index].gameImg,
                  fit: BoxFit.cover),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Text(
                  GameModel.gameList[index].gameName,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                    "${GameModel.gameList[index].gamePublisher} - ${GameModel.gameList[index].gamePublishDate}"),
                Text(GameModel.gameList[index].gameDesc),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Icon(Icons.favorite_outline),
                    Text(GameModel.gameList[index].totalLike.toString()),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
