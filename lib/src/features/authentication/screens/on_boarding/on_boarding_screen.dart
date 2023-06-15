import 'package:application1/src/features/authentication/controllers/on_boarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final obController = OnBoardingController();
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          SafeArea(
            child: LiquidSwipe(
              pages: obController.pages,
              enableSideReveal: true,
              liquidController: obController.controller,
              onPageChangeCallback: obController.OnPageChangeCallback,
              slideIconWidget: const Icon(Icons.arrow_back_ios),
            ),
          ),
          Positioned(
            bottom: 60.0,
            child: OutlinedButton(
                onPressed: () => obController.animateToNextSlide(),
                style: ElevatedButton.styleFrom(
                  side: const BorderSide(color: Colors.black26),
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(20),
                  foregroundColor: Colors.white,
                ),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                      color: Color(0xff272727), shape: BoxShape.circle),
                  child: const Icon(Icons.arrow_forward_ios),
                )),
          ),
          Positioned(
              top: 50,
              right: 20,
              child: TextButton(
                onPressed: () => obController.skip(),
                child: const Text("Skip", style: TextStyle(color: Colors.grey)),
              )),
          Obx(
            ()=> Positioned(
                bottom: 20,
                child: AnimatedSmoothIndicator(
                  activeIndex: obController.currentPage.value,
                  count: 3,
                  effect: const WormEffect(
                      activeDotColor: Color(0xff272727), dotHeight: 5.0),
                )),
          )
        ],
      ), 
    );
  }
}
