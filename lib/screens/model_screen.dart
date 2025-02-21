import 'package:flutter/material.dart';
import 'package:flutter_3d_controller/flutter_3d_controller.dart';
import 'package:ready_animate/widgets/action_container.dart';

class ModelScreen extends StatefulWidget {
  const ModelScreen({super.key});

  @override
  State<ModelScreen> createState() => _ModelScreenState();
}

class _ModelScreenState extends State<ModelScreen> {
  Flutter3DController firstAvatarController = Flutter3DController();
  Flutter3DController secondAvatarController = Flutter3DController();
  // List<String> firstAvatarAnimations = [];
  // List<String> secondAvatarAnimations = [];

  // Position variables
  double firstAvatarPosX = -70, firstAvatarPosY = 90, firstAvatarCamerePos = 70;
  double secondAvatarPosX = 100,
      secondAvatarPosY = 80,
      secondAvatarCamerePos = 65;

  Future<void> _setFirstAnimations() async {
    /* final availableAnimations =
        await firstAvatarController.getAvailableAnimations();
    print('First Avatar Animations: $availableAnimations');
    setState(() {
      firstAvatarAnimations = availableAnimations;
    }); */
    firstAvatarController.setCameraOrbit(
        firstAvatarPosX, firstAvatarPosY, firstAvatarCamerePos);
    firstAvatarController.playAnimation(animationName: 'Rig|idle');
  }

  Future<void> _setSecondAnimations() async {
    secondAvatarController.setCameraOrbit(
        secondAvatarPosX, secondAvatarPosY, secondAvatarCamerePos);
    secondAvatarController.playAnimation(animationName: 'Rig|idle');
  }

  void _moveFirstCharacter(
    double dx,
    double dy,
    double cameraDistance,
  ) {
    setState(() {
      firstAvatarPosX += dx;
      firstAvatarPosY += dy;
      firstAvatarController.setCameraOrbit(
        firstAvatarPosX,
        firstAvatarPosY,
        cameraDistance,
      );
    });

    // firstAvatarController.playAnimation(animationName: 'Rig|walk');
  }

  void _moveSecondCharacter(
    double dx,
    double dy,
    double cameraDistance,
  ) {
    setState(() {
      secondAvatarPosX += dx;
      secondAvatarPosY += dy;
      secondAvatarController.setCameraOrbit(
        secondAvatarPosX,
        secondAvatarPosY,
        cameraDistance,
      );
    });
    // secondAvatarController.playAnimation(animationName: 'Rig|walk');
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg_image.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: SafeArea(
          child: Row(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    Flutter3DViewer(
                      activeGestureInterceptor: true,
                      progressBarColor: Colors.transparent,
                      enableTouch: true,
                      onProgress: (double progressValue) {},
                      onLoad: (String modelAddress) => _setFirstAnimations(),
                      onError: (String error) {},
                      controller: firstAvatarController,
                      src: 'assets/threed/business_man.glb',
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: ActionContainer(
                        avatarName: 'First Avatar',
                        onUp: () {
                          firstAvatarController.playAnimation(
                              animationName: 'Rig|jump');
                        },
                        onDown: () {
                          firstAvatarController.playAnimation(
                              animationName: 'Rig|run');
                        },
                        onLeft: () =>
                            _moveFirstCharacter(10, 0, firstAvatarCamerePos),
                        onRight: () =>
                            _moveFirstCharacter(-10, 0, firstAvatarCamerePos),
                        onPlay: () {
                          firstAvatarController.playAnimation(
                              animationName: 'Rig|walk');
                          /* firstAvatarController.playAnimation(
                              animationName: 'Rig|cycle_talking'); */
                        },
                        onStop: () {
                          firstAvatarController.playAnimation(
                              animationName: 'Rig|idle');
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Stack(
                  children: [
                    Flutter3DViewer(
                      activeGestureInterceptor: true,
                      progressBarColor: Colors.transparent,
                      enableTouch: true,
                      onProgress: (double progressValue) {},
                      onLoad: (String modelAddress) => _setSecondAnimations(),
                      onError: (String error) {},
                      controller: secondAvatarController,
                      src: 'assets/threed/business_man.glb',
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: ActionContainer(
                        avatarName: 'Second Avatar',
                        onUp: () {
                          secondAvatarController.playAnimation(
                              animationName: 'Rig|jump');
                        },
                        onDown: () {
                          secondAvatarController.playAnimation(
                              animationName: 'Rig|run');
                        },
                        onLeft: () =>
                            _moveSecondCharacter(10, 0, secondAvatarCamerePos),
                        onRight: () =>
                            _moveSecondCharacter(-10, 0, secondAvatarCamerePos),
                        onPlay: () {
                          secondAvatarController.playAnimation(
                              animationName: 'Rig|walk');
                        },
                        onStop: () {
                          secondAvatarController.playAnimation(
                              animationName: 'Rig|idle');
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
