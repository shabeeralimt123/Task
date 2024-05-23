import 'package:flutter/material.dart';

import 'package:test_firebase/core/utils/palette.dart';
import 'package:test_firebase/shared/loader.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.onPress,
    required this.label,
    this.fontSize = 15,
    this.color = const Color(0xFF5040B6),
    this.height = 50,
    this.isLoading = false,
    this.width = double.infinity,
  }) : super(key: key);
  final Function onPress;
  final String label;
  final double height;
  final Color color;
  final bool isLoading;
  final double? width;
  final double fontSize;
  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: ButtonStyle(
          padding: MaterialStateProperty.all(EdgeInsets.zero),
          splashFactory: NoSplash.splashFactory,
          overlayColor: MaterialStateProperty.all(Colors.transparent),
        ),
        onPressed: () => !isLoading ? onPress() : () {},
        child: Container(
          height: height,
          width: width,
          // margin: const EdgeInsets.symmetric(horizontal: 24),
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
              // gradient: const LinearGradient(
              //     colors: [Palette., Palette.goldGrad2],
              //     begin: Alignment.topCenter,
              //     end: Alignment.bottomCenter),
              color: color,
              borderRadius: BorderRadius.circular(10)),
          child: Center(
            child: isLoading
                ? SizedBox(
                    height: height / 3,
                    width: height / 3,
                    child: const Loader(color: Palette.white),
                  )
                : Text(
                    label,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontSize: fontSize, color: Palette.white),
                  ),
          ),
        ));
  }
}
