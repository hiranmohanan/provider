import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
          body: TabBarView(viewportFraction: 1.0, children: [
        Container(
            color: Colors.red,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Center(
                child: Text("Medical passport intro"),
              )
            ])),
        Container(
          color: Colors.green,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Center(
              child: Text("Services / DDC intro"),
            )
          ]),
        ),
        Container(
          color: Colors.cyan,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Center(
              child: Text("Services / DDNMRC intro"),
            )
          ]),
        ),
        Container(
          color: Colors.blue,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Spacer(),
            Center(
              child: Text("Sevices / Mamo intro"),
            ),
            Spacer(),
            Align(
              alignment: AlignmentDirectional.bottomEnd,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.restorablePushNamedAndRemoveUntil(
                        context, '/home', (route) => false);
                  },
                  child: const Text('Home'),
                ),
              ),
            )
          ]),
        ),
      ])),
    );
  }
}
