import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:provider1/resources/lottie/lottie_paths.dart';

import '../operations/lottie_animation.dart';
import '../provider/file_provider.dart';

class DownloadPage extends StatelessWidget {
  const DownloadPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Fileprovider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Download Page"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text("Download Page"),
              TextField(
                decoration: const InputDecoration(
                  hintText: "Enter Url",
                ),
                onChanged: (value) {
                  provider.seturl = value;
                },
                onSubmitted: (value) {
                  provider.seturl = value;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              IconButton(
                  onPressed: (() {
                    provider.downloadFile();
                  }),
                  icon: const LottieAnimateLoading(
                    path: lottidonwloadbutton,
                  )),
              const SizedBox(
                height: 20,
              ),
              provider.isloading == true
                  ? const LottieAnimateLoading(
                      path: lottianimate1,
                    )
                  : provider.error != null
                      ? Text(provider.error!)
                      : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
