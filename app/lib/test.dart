import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Card Game'),
        ),
        body: CardGame(),
      ),
    );
  }
}

class CardGame extends StatefulWidget {
  @override
  _CardGameState createState() => _CardGameState();
}

class _CardGameState extends State<CardGame> with TickerProviderStateMixin {
  List<String> deck = ['Card 1', 'Card 2', 'Card 3', 'Card 4', 'Card 5'];
  List<String> playerStack = [];
  AnimationController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Display Deck
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: deck.map((card) => _buildCard(card)).toList(),
        ),
        SizedBox(height: 20),

        // Player's Stack
        Stack(
          children: [
            AnimatedBuilder(
              animation: _controller!,
              builder: (context, child) {
                return Positioned(
                  left: _controller!.value * 70.0,
                  child: playerStack.isEmpty
                      ? Container()
                      : _buildCard(playerStack.last),
                );
              },
            ),
          ],
        ),
        SizedBox(height: 20),

        // Button to Give Card
        ElevatedButton(
          onPressed: () {
            // Give a card from the deck to the player's stack with animation
            if (deck.isNotEmpty) {
              _controller!
                ..reset()
                ..forward();
              setState(() {
                playerStack.add(deck.removeAt(0));
              });
            }
          },
          child: Text('Give Card'),
        ),
      ],
    );
  }

  Widget _buildCard(String card) {
    return Draggable<String>(
      data: card,
      child: Container(
        width: 60,
        height: 80,
        color: Colors.blue,
        alignment: Alignment.center,
        child: Text(
          card,
          style: TextStyle(color: Colors.white),
        ),
      ),
      feedback: Container(
        width: 60,
        height: 80,
        color: Colors.blue.withOpacity(0.7),
        alignment: Alignment.center,
        child: Text(
          card,
          style: TextStyle(color: Colors.white),
        ),
      ),
      childWhenDragging: Container(),
    );
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }
}
