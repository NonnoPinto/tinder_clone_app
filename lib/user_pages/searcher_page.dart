/* RENTER USER MAIN PAGE 
** Here, like in Tinder, user can see renter's cards
** (??---Just people or with what they are offering?
** But searcher already setted search preferences---??)
** Left swipe -> OK
** Right swipe -> NO
*/
import 'dart:developer';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:swipe_cards/swipe_cards.dart';

class SearcherPage extends StatefulWidget {
  const SearcherPage({Key? key}) : super(key: key);

  @override
  _SearcherPageState createState() => _SearcherPageState();
}

class _SearcherPageState extends State<SearcherPage> {
  //Card lists
  final List<SwipeItem> _swipeList = [
    SwipeItem(
      content: const Text('Scheda 1'),
      likeAction: () {
        log('like');
      },
      nopeAction: () {
        log('nope');
      },
      superlikeAction: () {
        log('superlike');
      },
    ),
    SwipeItem(
      content: const Text('Scheda 2'),
      likeAction: () {
        log('like');
      },
      nopeAction: () {
        log('nope');
      },
      superlikeAction: () {
        log('superlike');
      },
    ),
    SwipeItem(
      content: const Text('Scheda 3'),
      likeAction: () {
        log('like');
      },
      nopeAction: () {
        log('nope');
      },
      superlikeAction: () {
        log('superlike');
      },
    ),
  ];
  //final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SwipeCards(
            upSwipeAllowed: true,
            matchEngine: MatchEngine(
              swipeItems: _swipeList,
            ),
            itemBuilder: (BuildContext context, int _index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: 400,
                    width: 200,
                    color: Colors.grey,
                    child: _swipeList[_index].content,
                  ),
                ],
              );
            },
            onStackFinished: () {
              Fluttertoast.showToast(
                toastLength: Toast.LENGTH_LONG,
                msg: 'You run out of cards!\nTry using more general settings!',
                textColor: Colors.black,
              );
              log('finite le cards');
            },
          ),
        ),
      ),
    );
  }
}
