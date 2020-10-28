import 'package:flutter/material.dart';
import 'package:audio_manager/audio_manager.dart';

var audioManagerInstance = AudioManager.instance;
bool showVol = false;
PlayMode playMode = audioManagerInstance.playMode;
bool isPlaying = false;
double _slider;

class VinylPage extends StatefulWidget {
  @override
  _VinylPageState createState() => _VinylPageState();
}

class _VinylPageState extends State<VinylPage>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;

  @override
  void initState() {
    animationController =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    super.initState();
  }

  void setupAudio() {
    audioManagerInstance.onEvents((events, args) {
      switch (events) {
        case AudioManagerEvents.start:
          _slider = 0;
          break;
        case AudioManagerEvents.seekComplete:
          _slider = audioManagerInstance.position.inMilliseconds /
              audioManagerInstance.duration.inMilliseconds;
          setState(() {});
          break;
        case AudioManagerEvents.playstatus:
          isPlaying = audioManagerInstance.isPlaying;
          setState(() {});
          break;
        case AudioManagerEvents.timeupdate:
          _slider = audioManagerInstance.position.inMilliseconds /
              audioManagerInstance.duration.inMilliseconds;
          audioManagerInstance.updateLrc(args["position"].toString());
          setState(() {});
          break;
        case AudioManagerEvents.ended:
          audioManagerInstance.next();
          setState(() {});
          break;
        default:
          break;
      }
    });
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              child: Center(
                child: AnimatedBuilder(
                  animation: animationController,
                  builder: (context, child) {
                    return Transform.rotate(
                      angle: animationController.value * 6.3,
                      child: GestureDetector(
                        onTapUp: (details) {
                          print('tapUp');
                          print(animationController.status);
                          animationController.repeat();
                          print(animationController.status);
                        },
                        onTapDown: (details) {
                          print('tapDown');
                          print(animationController.status);
                          animationController.stop();
                          print(animationController.status);
                        },
                        onPanStart: (details) {
                          print('onPanStart');
                          print(details);
                        },
                        onPanEnd: (details) {
                          print('onPanEnd');
                          print(details);
                        },
                        child: Image.asset(
                          'assets/images/vinyl_PNG67.png',
                          height: 350,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    animationController.reset();
                    animationController.repeat();
                  },
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.black,
                    child: Icon(
                      Icons.play_arrow,
                      size: 40,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
