import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider1/resources/lottie/lottie_paths.dart';

class LottieAnimateLoading extends StatefulWidget {
  final String? url;
  final String? path;
  const LottieAnimateLoading({super.key, this.url, this.path});

  @override
  State<LottieAnimateLoading> createState() => _LottieAnimateLoadingState();
}

class _LottieAnimateLoadingState extends State<LottieAnimateLoading> {
  @override
  Widget build(BuildContext context) {
    return widget.url != null
        ? Lottie.network(
            widget.url!,
            height: 200,
            width: 200,
            fit: BoxFit.fill,
          )
        : widget.path != null
            ? Lottie.asset(
                widget.path!,
                height: 200,
                width: 200,
                fit: BoxFit.fill,
              )
            : Lottie.asset(
                lottianimatedog,
                height: 200,
                width: 200,
                fit: BoxFit.fill,
              );
  }
}
