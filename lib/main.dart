import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider1/operations/autocomplete.dart';
import 'package:provider1/operations/lottie_animation.dart';
import 'package:provider1/provider/file_provider.dart';
import 'package:provider1/provider/provider.dart';
import 'package:provider1/resources/lottie/lottie_paths.dart';
import 'package:provider1/screens/screen.dart';
import 'package:provider1/screens/splashscreen.dart';

import 'screens/file_download_page.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';

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
        ChangeNotifierProvider<Fileprovider>(
          create: (_) => Fileprovider(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: FlexThemeData.light(scheme: FlexScheme.espresso),
        darkTheme: FlexThemeData.dark(scheme: FlexScheme.redM3),
        themeMode: ThemeMode.light,
        initialRoute: '/',
        routes: {
          '/': (_) => const SplashScreen(),
          '/home': (context) => const MyHomePage(),
          '/filedownload': (context) => const DownloadPage(),
        },
        // home: const SplashScreen(),
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
  late int i;
  @override
  Widget build(BuildContext context) {
    final picprovider = Provider.of<Providerset>(context, listen: true);
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Demo Home Page'), actions: [
        IconButton(
          icon: Theme.of(context).brightness == Brightness.dark
              ? const Icon(Icons.light_mode)
              : const Icon(Icons.dark_mode),
          onPressed: () {
            if (Theme.of(context).brightness == Brightness.dark) {
              setState(() {
                ThemeData.light();
              });
            } else {
              if (Theme.of(context).brightness == Brightness.light) {
                setState(() {
                  ThemeData.dark();
                });
              }
            }
            setState(() {});
          },
        ),
      ]),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              TextFormField(
                onTap: () {},
              ),
              // const LottieAnimateLoading(
              //     // path: lottianimate1,
              //     ),
              SizedBox(
                height: 20,
              ),
              DropdownSearch(
                popupProps: PopupProps.modalBottomSheet(
                    showSelectedItems: true,
                    loadingBuilder: (context, searchEntry) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                    disabledItemFn: (String s) => s.startsWith('I'),
                    showSearchBox: true,
                    searchFieldProps: const TextFieldProps(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.search),
                        hintText: 'Search a country',
                        labelText: 'Country',
                      ),
                    )),
                items: const [
                  "Brazil",
                  "Italia (Disabled)",
                  "Tunisia",
                  'Canada'
                ],
                onChanged: print,
              ),
              SizedBox(
                height: 20,
              ),
              const Autocompletetab(),
              picprovider.isloading == true
                  ? const LottieAnimateLoading(
                      // path: lottianimate1,
                      )
                  : Image.network(
                      picprovider.url ?? 'https://picsum.photos/250?image=9'),
              const SizedBox(
                height: 30,
              ),
              TextButton(
                  onPressed: () {
                    Provider.of<Fileprovider>(context, listen: false).clean();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DownloadPage()));
                  },
                  child: const Text("Url Downloader")),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Screen1()));
                  },
                  child: Text("Screen 1"))
            ],
          ),
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
          if (value == 2) {
            showDialog(
                context: context,
                builder: (context) => const Dialog(
                      child: LottieAnimateLoading(
                        path: lottisucess,
                      ),
                    ));
          }
        },
      ),
    );
  }
}
