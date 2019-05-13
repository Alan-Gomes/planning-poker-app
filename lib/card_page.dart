import 'dart:async';

import 'package:flutter/material.dart';
import 'package:planning_poker/common/flip_card.dart';

class CardPage extends StatefulWidget {
  CardPage({Key key, this.number}) : super(key: key);

  final int number;

  @override
  State<StatefulWidget> createState() {
    return _CardPageState();
  }
}

class _CardPageState extends State<CardPage> {
  final flipKey = GlobalKey<FlipCardState>();

  @override
  void initState() {
    super.initState();
    Timer(Duration(milliseconds: 500), () {
      setState(() {
        final state = flipKey.currentState;
        if (state.isFront) {
          flipKey.currentState.toggleCard();
        }
      });
    });
  }

  Widget frontCard() {
    return Card(
      color: Theme.of(context).accentColor,
      elevation: 3.0,
      child: Center(
        child: Text(
          '${widget.number}',
          style: TextStyle(
            color: Colors.white,
            fontSize: 90,
          ),
        ),
      ),
    );
  }

  Widget backCard() {
    return Card(
      color: Theme.of(context).primaryColor,
      elevation: 3.0,
      child: Center(
        child: Text(
          '???',
          style: TextStyle(
            color: Colors.white,
            fontSize: 90,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: Hero(
            tag: 'card-${widget.number}',
            child: FlipCard(
              key: flipKey,
              speed: 250,
              front: frontCard(),
              back: backCard(),
            ),
          ),
        ),
      ),
    );
  }
}
