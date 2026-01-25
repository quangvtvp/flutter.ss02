import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

// use "stf" to build a new statefullwidget structure
class Cardsgame extends StatefulWidget {
  const Cardsgame({super.key});

  @override
  State<Cardsgame> createState() => _CardsgameState();
}

class Cardmodel {
  final int id;
  final String emoji;
  bool isFlipped;
  bool isMatched;

  Cardmodel({
    required this.id,
    required this.emoji,
    this.isFlipped = false,
    this.isMatched = false,
  });
}

class _CardsgameState extends State<Cardsgame> {
  final List<String> _emojis = [
    '🚀',
    '🔥',
    '🌈',
    '🍀',
    '🎵',
    '📚',
  ];
  List<Cardmodel> _card = [];
  int? _firstflippedcardindex = null;
  int? _secondflippedcardindex = null;
  AudioPlayer _flipaudio = AudioPlayer();
  AudioPlayer _matchaudio = AudioPlayer();

  @override
  void initState() {
    _card = [];
    //chay ngay khi mo ung dung
    // TODO: implement initState
    for (int i = 0; i < _emojis.length; i++) {
      _card.add(Cardmodel(id: i * 2, emoji: _emojis[i]));
      _card.add(Cardmodel(id: i * 2 + 1, emoji: _emojis[i]));
    }
    _card.shuffle();
    super.initState();
  }

  void onCardClicked(int index) {
    // if card is already match or flipped, do nothing
    if (_card[index].isMatched || _card[index].isFlipped) {
      return;
    }
    //if first/second flipped card is null, set it
    if (_firstflippedcardindex == null) {
      _firstflippedcardindex = index;
      setState(() {
        _card[index].isFlipped = true;
        _flipaudio.play(AssetSource('sound/flip.mp3'));
      });
    } else if (_secondflippedcardindex == null) {
      _secondflippedcardindex = index;
      setState(() {
        _card[index].isFlipped = true;
        _flipaudio.play(AssetSource('sound/flip.mp3'));

        //delay time so that player can remember the card
        Future.delayed(const Duration(seconds: 1), () {
          setState(() {
            // check if these cards are matched or not
            if (_card[_firstflippedcardindex!].emoji == _card[_secondflippedcardindex!].emoji) {
              _card[_firstflippedcardindex!].isMatched = true;
              _card[_secondflippedcardindex!].isMatched = true;
              _matchaudio.play(AssetSource('sound/match.mp3'));
            } else {
              // not a   match -> flip them back
              _card[_firstflippedcardindex!].isFlipped = false;
              _card[_secondflippedcardindex!].isFlipped = false;
            }

            // reset
            _firstflippedcardindex = null;
            _secondflippedcardindex = null;
          });
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scaffold(
        appBar: AppBar(title: Text('welcome to my cards game')),
        body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 8, //khoang cach doc
            crossAxisSpacing: 8, //hoang cach ngang
          ),
          itemCount: _card.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              //cung cap thao tach "tap"
              onTap: () {
                //handle card tap
                onCardClicked(index);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 132, 175),
                  borderRadius: BorderRadius.circular(10),
                  border: _card[index].isMatched
                      ? Border.all(color: Colors.green, width: 5)
                      : null,
                ),
                child: Center(
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    child: Text(
                      _card[index].isFlipped ? _card[index].emoji : '❓',
                      style: const TextStyle(fontSize: 60),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
