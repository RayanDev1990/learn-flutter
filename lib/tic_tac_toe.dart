import 'package:flutter/material.dart';

class TicTacToe extends StatefulWidget {
  const TicTacToe({super.key});

  @override
  State<TicTacToe> createState() => _TicTacToeState();
}

class _TicTacToeState extends State<TicTacToe> {
  @override
  List<String> board = ["", "", "", "", "", "", "", "", ""];
  int current = 1;

  play(int index) {
    if (current > 0)
      board[index] = "X";
    else
      board[index] = "O";

    current = current * -1;
    setState(() {});
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () => play(0),
                    child: Container(
                      width: 100,
                      height: 100,
                      color: Colors.blue,
                      child: Center(
                        child: Text(
                          board[0],
                          style: TextStyle(fontSize: 60, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => play(1),
                    child: Container(
                      width: 100,
                      height: 100,
                      color: Colors.blue,
                      child: Center(
                        child: Text(
                          board[1],
                          style: TextStyle(fontSize: 60, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => play(2),
                    child: Container(
                      width: 100,
                      height: 100,
                      color: Colors.blue,
                      child: Center(
                        child: Text(
                          board[2],
                          style: TextStyle(fontSize: 60, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () => play(3),
                    child: Container(
                      width: 100,
                      height: 100,
                      color: Colors.blue,
                      child: Center(
                        child: Text(
                          board[3],
                          style: TextStyle(fontSize: 60, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => play(4),
                    child: Container(
                      width: 100,
                      height: 100,
                      color: Colors.blue,
                      child: Center(
                        child: Text(
                          board[4],
                          style: TextStyle(fontSize: 60, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => play(5),
                    child: Container(
                      width: 100,
                      height: 100,
                      color: Colors.blue,
                      child: Center(
                        child: Text(
                          board[5],
                          style: TextStyle(fontSize: 60, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () => play(6),
                    child: Container(
                      width: 100,
                      height: 100,
                      color: Colors.blue,
                      child: Center(
                        child: Text(
                          board[6],
                          style: TextStyle(fontSize: 60, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => play(7),
                    child: Container(
                      width: 100,
                      height: 100,
                      color: Colors.blue,
                      child: Center(
                        child: Text(
                          board[7],
                          style: TextStyle(fontSize: 60, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => play(8),
                    child: Container(
                      width: 100,
                      height: 100,
                      color: Colors.blue,
                      child: Center(
                        child: Text(
                          board[8],
                          style: TextStyle(fontSize: 60, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                child: Text("Clear"),
                onPressed: (() {
                  board[0] = "";
                  board[1] = "";
                  board[2] = "";
                  board[3] = "";
                  board[4] = "";
                  board[5] = "";
                  board[6] = "";
                  board[7] = "";
                  board[8] = "";
                  setState(() {});
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
