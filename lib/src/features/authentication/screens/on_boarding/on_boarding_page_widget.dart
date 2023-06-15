import 'package:flutter/material.dart';

import '../../../../constants/sizes.dart';
import '../../models/model_on_boarding.dart';

class OnBoardingPageWidget extends StatelessWidget {
  const OnBoardingPageWidget({
    Key? key,
    required this.model,
  }) : super(key: key);

  final OnBoardingModel model;

  @override
  Widget build(BuildContext context) {
     final deviceSize = MediaQuery.of(context).size;
    return Container(
      padding:  const EdgeInsets.all(tDefaultSize),
      color: model.bgColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image(image:  AssetImage(model.image),height: deviceSize.height * 0.4),
          Column(
            children: [
              Text(
               model.title,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
               Text(
                model.subTitle,
                textAlign: TextAlign.center,
              ),
            ],
          ),
          Text(
            model.counterText,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(
            height: 80.0,
          ),
        ],
      ),
    );
  }
}
