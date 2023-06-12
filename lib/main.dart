import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider1/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Providerset>(
          create: (_) => Providerset(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final picprovider = Provider.of<Providerset>(context, listen: true);
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Demo Home Page')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            picprovider.isloading == true
                ? const CircularProgressIndicator()
                : Image.network(
                    picprovider.url ?? 'https://picsum.photos/250?image=9')
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: CircleAvatar(
                radius: 15,
                backgroundImage:
                    NetworkImage('https://picsum.photos/250?image=9'),
              ),
              label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        onTap: (value) {
          if (value == 0) {
            picprovider.getapicall();
          }
          if (value == 1) {
            showModalBottomSheet(
                context: context,
                builder: (context) => Container(
                      height: 200,
                      color: Colors.red,
                      child: TextButton(
                          onPressed: () {
                            picprovider.getapicall();
                            Navigator.pop(context);
                          },
                          child: const Text("tap")),
                    ));
          }
        },
      ),
    );
  }
}
