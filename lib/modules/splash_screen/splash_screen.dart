import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class SplashScreenLatest extends StatefulWidget {
  const SplashScreenLatest({Key? key}) : super(key: key);

  @override
  State<SplashScreenLatest> createState() => _SplashScreenLatestState();
}

class _SplashScreenLatestState extends State<SplashScreenLatest> {
  bool showFirstIcon = true;
  bool showSecondIcon = false;

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.top]);

    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom]);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFDD2929),
              Color(0xFF521010),
            ],
          ),
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            AnimatedOpacity(
              duration: 500.milliseconds, // Animation duration
              opacity: showSecondIcon == true ? 1 : 0,
              child: Image.asset(
                'assets/images/splash_screen.png', // Replace with your image asset
                fit: BoxFit.cover,
                height: double.infinity,
                width: double.infinity,
              ),
            ),
            AnimatedOpacity(
              duration: 500.milliseconds, // Animation duration
              opacity: showSecondIcon == true ? 1 : 0,
              child: Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.red,
                      const Color(0xFFC21616),
                      const Color(0xFF050101).withOpacity(0.4),
                    ],
                    stops: const [0.0, 0.0, 1.0],
                  ),
                ),
              ),
            ),
            Center(
              child: Stack(
                children: [
                  // Animate(
                  //   effects: [
                  //     SlideEffect(
                  //         begin: const Offset(0, -0.2),
                  //         end: const Offset(0, 0.3),
                  //         duration: 500.ms,
                  //         curve: Curves.easeIn),
                  //     SlideEffect(
                  //         begin: const Offset(0, 0),
                  //         end: const Offset(0, -0.3),
                  //         duration: 500.ms,
                  //         delay: 500.ms,
                  //         curve: Curves.easeOut),
                  //     ScaleEffect(
                  //         begin: const Offset(2, 2),
                  //         end: const Offset(7, 7),
                  //         duration: 300.ms,
                  //         delay: 1000.ms,
                  //         curve: Curves.easeIn),
                  //     ScaleEffect(
                  //       begin: const Offset(
                  //           1, 1), // Additional ScaleEffect added here
                  //       end: const Offset(0.4, 0.4),
                  //       duration: 200.ms,
                  //       delay: 1500.ms,
                  //       curve: Curves.easeInOut,
                  //     ),
                  //     SlideEffect(
                  //         begin: const Offset(0, 0),
                  //         end: const Offset(-3.2, 0),
                  //         duration: 300.ms,
                  //         delay: 1300.ms,
                  //         curve: Curves.easeIn),
                  //   ],
                  //   onPlay: (p) {
                  //     Future.delayed(1600.ms).then((value) {
                  //       setState(() {
                  //         showSecondIcon = true;
                  //       });
                  //     });
                  //   },
                  //   child: const SvgIcon(
                  //     'assets/svgs/logo_splash_screen_2.svg',
                  //     color: Colors.white,
                  //     size: 40,
                  //   ),
                  // ),
                ],
              ),
            ),
            // if (showSecondIcon == true)
            //   Positioned(
            //     top: MediaQuery.of(context).size.height / 2 - 87,
            //     left: MediaQuery.of(context).size.width / 2 - 125,
            //     child: Animate(
            //       effects: [
            //         SlideEffect(
            //             begin: const Offset(2, 0),
            //             end: const Offset(0, 0),
            //             duration: 300.ms,
            //             curve: Curves.ease),
            //       ],
            //       child: const SvgIcon(
            //         'assets/svgs/logo_splash_screen_1.svg',
            //         size: 190,
            //       ),
            //     ),
            //   )
          ],
        ),
      ),
    );
  }
}
