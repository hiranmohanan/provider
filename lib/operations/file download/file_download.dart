import 'package:flutter/material.dart';

class DownloadButton extends StatefulWidget {
  const DownloadButton({super.key});

  @override
  State<DownloadButton> createState() => _DownloadButtonState();
}

class _DownloadButtonState extends State<DownloadButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: () {}, icon: const Icon(Icons.download));
  }
}
