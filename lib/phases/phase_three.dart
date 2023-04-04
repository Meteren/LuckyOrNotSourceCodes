import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:quiz_bank/quiz_bank.dart';
import '../questions/question._five.dart';
import '../questions/question_ten.dart';
import '../questions/question_thirty.dart';
import '../questions/question_twenty.dart';

class PhaseThree extends StatefulWidget {
  const PhaseThree({
    super.key, required this.questions,
  });

  final QuizBrain questions;

  @override
  State<PhaseThree> createState() => _PhaseThreeState();
}

class _PhaseThreeState extends State<PhaseThree> {
  late int random;
  late bool deactive;

  int? pointTaken;

  late int active;

  late bool finish;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    deactive = false;
    random = -1;
    active = 0;
    finish = false;
  }

  @override
  Widget build(BuildContext context) {
    bool ctrl = false;
    return WillPopScope(
      onWillPop: ()async{
        if (ctrl == false) {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Center(child: Text("Use only on screen buttons to go back.")),
                duration: Duration(seconds: 2),
              )
          );
          ctrl = true;
        }
        return false;
      },
      child: Scaffold(
          appBar: AppBar(
            shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.circular(50)
            ),
            backgroundColor: Colors.purple,
            automaticallyImplyLeading: false,
            title: const Center(child: Text('Welcome To Phase 3')),
          ),
          body: Center(
            child: Column(
              children: [
                SizedBox(
                    height: 603.4,
                    width: 255,
                    child: Stack(
                      children: [
                        const Positioned(
                          top: 50,
                          child: Text
                            ('Press -Decide- button to decide your fate'),
                        ),
                        Positioned(
                          top: 70,
                          left: 90,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.purple, // Background color
                            ),
                            onPressed: deactive ? null : () {
                              setState( () {
                                random = Random().nextInt(20);
                                deactive = true;
                              });
                            },
                            child: const Text('Decide'),
                          ),
                        ),
                        Positioned(
                          bottom: 300,
                          left: 85,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.purple, // Background color
                            ),
                            onPressed: 0 <= random && random < 8 && active == 0 ? () async {
                              setState(() {
                                active++;
                                Future.delayed(const Duration(seconds: 1), () {
                                  setState(() {
                                    finish = true;
                                  });
                                });
                              });
                              pointTaken = await Navigator.of(context).push<int>(
                                MaterialPageRoute(
                                    builder: (context){
                                      return  QuestionFive(questions:widget.questions);
                                    }
                                ),
                              );
                            }: null,
                            child: const Text('5 points'),
                          ),
                        ),
                        Positioned(
                          bottom: 250,
                          left: 0,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.purple, // Background color
                            ),
                            onPressed: 8 <= random && random < 13 && active == 0 ? () async{
                              setState(() {
                                active++;
                                Future.delayed(const Duration(seconds: 1), () {
                                  setState(() {
                                    finish = true;
                                  });
                                });
                              });
                              pointTaken = await Navigator.of(context).push<int>(
                                MaterialPageRoute(
                                    builder: (context){
                                      return  QuestionTen(questions: widget.questions);
                                    }
                                ),
                              );
                            }: null,
                            child: const Text('10 points'),
                          ),
                        ),
                        Positioned(
                          bottom: 250,
                          right: 0,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.purple, // Background color
                            ),
                            onPressed: 13 <= random && random < 17 && active == 0 ? () async{
                              setState(() {
                                active++;
                                Future.delayed(const Duration(seconds: 1), () {
                                  setState(() {
                                    finish = true;
                                  });
                                });
                              });
                              pointTaken = await Navigator.of(context).push<int>(
                                MaterialPageRoute(
                                    builder: (context){
                                      return  QuestionTwenty(questions: widget.questions);
                                    }
                                ),
                              );
                            }: null,
                            child: const Text('20 points'),
                          ),
                        ),
                        Positioned(
                          bottom: 200,
                          left: 80,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.purple, // Background color
                            ),
                            onPressed: 17 <= random && random < 20 && active == 0 ? () async{
                              setState(() {
                                active++;
                                Future.delayed(const Duration(seconds: 1), () {
                                  setState(() {
                                    finish = true;
                                  });
                                });
                              });
                              pointTaken = await Navigator.of(context).push<int>(
                                MaterialPageRoute(
                                    builder: (context){
                                      return QuestionThirty(questions: widget.questions);
                                    }
                                ),
                              );
                            }: null,
                            child: const Text('30 points'),
                          ),
                        ),
                        Positioned(
                          bottom: 50,
                          right: 70,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.purple,
                            ),
                            onPressed: finish ? () {
                              Navigator.of(context).pop<int>(pointTaken);
                            }:null,
                            child: const Text('Finish Phase'),
                          ),
                        ),
                      ],
                    )
                ),
              ],
            ),
          )
      ),
    );
  }
}