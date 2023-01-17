import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isCross = true;
  String message = '';
  List<String> gameState = [];

  AssetImage cross = AssetImage("images/cross.png");
  AssetImage circle = AssetImage("images/circle.png");
  AssetImage edit = AssetImage("images/edit.png");

  @override
  void initState() {
    super.initState();
    setState(() {
      this.gameState = [
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
      ];
      this.message = "";
    });
  }

  resetGame() {
    setState(() {
      this.gameState = [
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
      ];

      this.message = "";
    });
  }

  AssetImage getImage(String value) {
    if (value == "empty") {
      return edit;
    } else if (value == "cross") {
      return cross;
    } else {
      return circle;
    }
  }

  playGame(int index) {
    setState(() {
      if (this.gameState[index] == "empty") {
        setState(() {
          if (this.isCross) {
            this.gameState[index] = "cross";
          } else {
            this.gameState[index] = "circle";
          }
          this.isCross = !this.isCross;
          this.winLogic();
        });
      }
    });
  }

  winLogic() {
    if ((this.gameState[0] != "empty") &&
        (this.gameState[0] == this.gameState[1]) &&
        (this.gameState[1] == this.gameState[2])) {
      setState(() {
        this.message = '${this.gameState[0]} Wins';
        Future.delayed(Duration(seconds: 3), () {
          this.resetGame();
        });
      });
    } else if ((this.gameState[3] != "empty") &&
        (this.gameState[3] == this.gameState[4]) &&
        (this.gameState[4] == this.gameState[5])) {
      setState(() {
        this.message = '${this.gameState[3]} Wins';
        Future.delayed(Duration(seconds: 3), () {
          this.resetGame();
        });
      });
    } else if ((this.gameState[6] != "empty") &&
        (this.gameState[6] == this.gameState[7]) &&
        (this.gameState[7] == this.gameState[8])) {
      setState(() {
        this.message = '${this.gameState[6]} Wins';
        Future.delayed(Duration(seconds: 3), () {
          this.resetGame();
        });
      });
    } else if ((this.gameState[0] != "empty") &&
        (this.gameState[0] == this.gameState[3]) &&
        (this.gameState[3] == this.gameState[6])) {
      setState(() {
        this.message = '${this.gameState[0]} Wins';
        Future.delayed(Duration(seconds: 3), () {
          this.resetGame();
        });
      });
    } else if ((this.gameState[1] != "empty") &&
        (this.gameState[1] == this.gameState[4]) &&
        (this.gameState[4] == this.gameState[7])) {
      setState(() {
        this.message = '${this.gameState[1]} Wins';
        Future.delayed(Duration(seconds: 3), () {
          this.resetGame();
        });
      });
    } else if ((this.gameState[2] != "empty") &&
        (this.gameState[2] == this.gameState[5]) &&
        (this.gameState[5] == this.gameState[8])) {
      setState(() {
        this.message = '${this.gameState[2]} Wins';
        Future.delayed(Duration(seconds: 3), () {
          this.resetGame();
        });
      });
    } else if ((this.gameState[0] != "empty") &&
        (this.gameState[0] == this.gameState[4]) &&
        (this.gameState[4] == this.gameState[8])) {
      setState(() {
        this.message = '${this.gameState[0]} Wins';
        Future.delayed(Duration(seconds: 3), () {
          this.resetGame();
        });
      });
    } else if ((this.gameState[2] != "empty") &&
        (this.gameState[2] == this.gameState[4]) &&
        (this.gameState[4] == this.gameState[6])) {
      setState(() {
        this.message = '${this.gameState[2]} Wins';
        Future.delayed(Duration(seconds: 3), () {
          this.resetGame();
        });
      });
    } else if (!gameState.contains("empty")) {
      setState(() {
        this.message = 'Game Draw';
        Future.delayed(Duration(seconds: 3), () {
          this.resetGame();
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TicTacToe"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
              child: GridView.builder(
                  padding: EdgeInsets.all(20.0),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 1.0,
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10.0),
                  itemCount: this.gameState.length,
                  itemBuilder: (context, i) => SizedBox(
                        width: 100.0,
                        height: 100.0,
                        child: MaterialButton(
                          onPressed: () {
                            this.playGame(i);
                          },
                          child: Image(
                            image: this.getImage(this.gameState[i]),
                          ),
                        ),
                      ))),
          Container(
            padding: EdgeInsets.all(20.0),
            child: Text(
              this.message,
              style: TextStyle(fontSize: 35.0, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: EdgeInsets.all(70.0),
            child: MaterialButton(
              onPressed: resetGame,
              color: Colors.purple,
              child: Text(
                'Reset',
                style: TextStyle(color: Colors.white),
              ),
              minWidth: 200.0,
              height: 50.0,
            ),
          ),
        ],
      ),
    );
  }
}
