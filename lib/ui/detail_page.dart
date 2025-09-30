import 'package:flutter/material.dart';
import 'package:template_quiz_mobile_si_b/models/game_model.dart';

class DetailPage extends StatefulWidget {
  final GameModel game;
  const DetailPage({super.key, required this.game});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
