import 'package:flutter/material.dart';
import 'package:planning_poker/card_page.dart';

class CardListPage extends StatelessWidget {
  CardListPage({Key key}) : super(key: key);

  final cards = [1, 2, 3, 5, 8, 13, 21, 34, 55];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Planning Poker App Demo'),
      ),
      body: GridView.count(
        crossAxisCount: 3,
        childAspectRatio: MediaQuery.of(context).size.height / 1500,
        children: cards.map((number) => _PokerCard(number: number)).toList(),
      ),
    );
  }
}

class _PokerCard extends StatelessWidget {
  const _PokerCard({Key key, this.number}) : super(key: key);

  final int number;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'card-$number',
      child: Card(
        color: Theme.of(context).accentColor,
        child: InkWell(
          onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CardPage(number: number)),
              ),
          child: Center(
            child: Text(
              '$number',
              style: Theme.of(context).textTheme.display2.apply(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
