import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/round-button.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';


//TODO: pass variables which defines break and work time
class CountdownPage extends StatefulWidget {
  const CountdownPage({Key? key}) : super(key: key);

  @override
  _CountdownPageState createState() => _CountdownPageState();
}

class _CountdownPageState extends State<CountdownPage>
    with TickerProviderStateMixin {
  late AnimationController controller;

  bool isPlaying = false;
  bool isBreakmode = false;
  int currentSet = 1;
  bool isCompleted = false;
  String title = "Do the laundry";
  String completeText = "";
  int allSets = 4;

  Duration setDuration = Duration(minutes: 2);
  Duration breakDuration = Duration(seconds: 30);

  String get countText {
    Duration count = controller.duration! * controller.value;
    return controller.isDismissed
        ? '${controller.duration!.inHours}:${(controller.duration!.inMinutes % 60)
        .toString().padLeft(2, '0')}:${(controller.duration!.inSeconds % 60)
        .toString().padLeft(2, '0')}'
        : '${count.inHours}:${(count.inMinutes % 60).toString().padLeft(2, '0')}:'
        '${(count.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  double progress = 1.0;

  void notify() {

    if (controller.isDismissed){
      FlutterRingtonePlayer.playNotification();
      if (isBreakmode){
        controller.duration = setDuration;
        isBreakmode=false;
      } else {
        controller.duration = breakDuration;
        isBreakmode=true;
      }

      if (!isBreakmode) {
        if (currentSet == allSets) {
          setState(() {
            isCompleted = true;
            completeText = "Completed!";

          });
        } else if (currentSet>allSets){
          setState(() {
            currentSet=1;
          });
        }else {
          setState(() {
            currentSet += 1;
          });
        }
      }
    }
  }


  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      // TODO: make a variable so user can set default time
      duration: setDuration,
    );

    controller.addListener(() {
      notify();
      if (controller.isAnimating) {
        setState(() {
          progress = controller.value;
        });
      } else {
        setState(() {
          progress = 1.0;
          isPlaying = false;
        });
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 300,
                  height: 300,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Transform.scale(
                        scale: 10.0, // Adjust the scale factor as per your requirement
                        child: CircularProgressIndicator(
                          backgroundColor: Colors.grey.shade300,
                          color: Colors.purple,
                          value: progress,
                          strokeWidth: 1,
                        ),
                      ),

                    ],
                  ),
                )

                ,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Padding(padding: EdgeInsets.all(36.0)),
                        Row(
                          children: [
                            Text(
                              // "Task: $title",
                              "Progress",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                          ],
                        ),Row(
                          children: [

                            Text(
                              "$currentSet/$allSets",
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(completeText,
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),),

                          ],
                        )

                      ],
                    )
                  ],
                ),

                GestureDetector(
                  onTap: () {
                    if (controller.isDismissed) {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) => Container(
                          height: 300,
                          child: CupertinoTimerPicker(
                            initialTimerDuration: controller.duration!,
                            onTimerDurationChanged: (time) {
                              setState(() {
                                controller.duration = time;
                              });
                            },
                          ),
                        ),
                      );
                    }
                  },
                  child: AnimatedBuilder(
                    animation: controller,
                    builder: (context, child) => Text(
                      countText,
                      style: TextStyle(
                        fontSize: 60,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(isBreakmode?"BREAK!":"",
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),)
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          if (controller.isAnimating &&
                              (controller.duration! * controller.value)
                                  .inMinutes >
                                  1) {
                            setState(() {
                              controller.duration =
                                  (controller.duration! * controller.value) -
                                      const Duration(seconds: 60);
                              controller.reverse(from: 1);
                              isPlaying = true;
                            });
                          }
                        },
                        child: RoundButton(
                          icon: Icons.exposure_minus_1,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          if (controller.isAnimating) {
                            setState(() {
                              controller.duration =
                                  (controller.duration! * controller.value) +
                                      const Duration(seconds: 60);
                              controller.reverse(from: 1);
                              isPlaying = true;
                            });
                          }
                        },
                        child: RoundButton(
                          icon: Icons.plus_one,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          if (controller.isAnimating) {
                            setState(() {
                              controller.stop();
                              isPlaying = false;
                            });
                          } else {
                            controller.reverse(
                                from: controller.value == 0
                                    ? 1.0
                                    : controller.value);
                            setState(() {
                              isPlaying = true;
                            });
                          }
                        },
                        child: RoundButton(
                          icon: isPlaying == true
                              ? Icons.pause
                              : Icons.play_arrow,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          if (isCompleted){
                            controller.reset();
                            setState(() {
                              isCompleted = false;
                              currentSet = 1;
                              isBreakmode=false;
                              completeText="";
                              controller.duration = setDuration;
                            });
                          } else {
                            controller.reset();
                            setState(() {
                              isPlaying = false;
                            });
                          }
                        },
                        child: RoundButton(
                          icon: isCompleted == true ? Icons.restart_alt : Icons.skip_next,
                        ),
                      ),
                    ],
                  ),
                ],
              ))
        ],
      ),
    );
  }
}