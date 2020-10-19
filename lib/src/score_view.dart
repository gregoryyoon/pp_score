import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ScoreView extends StatefulWidget {
  ScoreView({Key key}) : super(key: key);
  @override
  ScoreViewState createState() => ScoreViewState();
}

class ScoreViewState extends State<ScoreView> {
  List<int> _scores = [1, 2, 3, 4, 5];
  int _currentScore;
  CarouselController _scoreCarouselController = CarouselController();
  @override
  void dispose() {
    super.dispose();
    print("+ScoreViewState dispose");
  }

  @override
  void initState() {
    print("+ScoreViewState initState");
    _currentScore = _scores[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("+ScoreViewStatus build ${MediaQuery.of(context).size} \n");
    return GestureDetector(
      onDoubleTap: () {
        setState(() {});
      },
      onTap: () {
        setState(() {
          // _scoreCarouselController.nextPage(
          //     duration: Duration(milliseconds: 300), curve: Curves.linear);
          _scoreCarouselController.animateToPage(_currentScore,
              duration: Duration(milliseconds: 300), curve: Curves.linear);
          _currentScore++;
          if (_currentScore > _scores[4]) {
            _currentScore = _scores[0];
          }
        });
      },
      // child: Text("test"),
      child: Container(
        margin: const EdgeInsets.all(0),
        width: (MediaQuery.of(context).size.width / 2),
        height: (MediaQuery.of(context).size.height),
        child: CarouselSlider(
          options: CarouselOptions(),
          items: _scores
              .map((item) => Container(
                    child: Center(child: Text(item.toString())),
                    color: Colors.green,
                  ))
              .toList(),
          carouselController: _scoreCarouselController,
        ),
      ),
    );
  }
}
