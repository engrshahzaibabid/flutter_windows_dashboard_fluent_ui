
import 'package:fluent_ui/fluent_ui.dart';
import 'package:window_manager/window_manager.dart';

import 'models/constants.dart';
import 'screens/dashboard_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();
  windowManager.waitUntilReadyToShow().then((value) async {
    await windowManager.setTitle('Attendance Management');
    await windowManager.setTitleBarStyle(TitleBarStyle.normal);
    await windowManager.setBackgroundColor(Colors.transparent);
    await windowManager.setSize(const Size(755, 545));
    await windowManager.setMinimumSize(const Size(755, 545));
    await windowManager.center();
    await windowManager.show();
    await windowManager.setSkipTaskbar(false);
  });
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int selectedMenu = 0;

  @override
  Widget build(BuildContext context) {
    return FluentApp(
      debugShowCheckedModeBanner: false,
      theme: FluentThemeData(
        fontFamily: 'Poppins',
          accentColor: mainColor,
          iconTheme: const IconThemeData(size: 24)),
      home: NavigationView(
        appBar: NavigationAppBar(
          height: 70,
          title: Padding(
            padding: const EdgeInsets.only(top: 7, bottom: 7),
            child: Row(
              children: [
               Image.network("https://keybotix.com/wp-content/uploads/2022/05/Asset-1.png", scale: 5,),
                const Spacer(),
                const CircleAvatar(
                  radius: 20, backgroundColor: Colors.transparent,
                  backgroundImage: NetworkImage("https://avatars.githubusercontent.com/u/140246683?v=4"),
                ),
                const SizedBox(width: 8),
                const Text("Hello Developers!", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13.5),),
                const SizedBox(width: 25),
              ],
            ),
          ),
          leading: null
        ),
        pane: NavigationPane(
            header: Container(height: 30,),
            indicator: const StickyNavigationIndicator(duration: Duration(microseconds: 800)),
            displayMode: PaneDisplayMode.auto,
            size: const NavigationPaneSize(openMaxWidth: 220, ),
            selected: selectedMenu,
            // menuButton: Icon(FluentIcons.expand_menu),
            onChanged: (value){
              setState(()=> selectedMenu = value);
              print(PaneDisplayMode.auto.runtimeType);
            },
            items: [
              PaneItem(
                  key: const ValueKey('/'),
                  selectedTileColor: ButtonState.all(Colors.transparent),
                  icon: const Icon(FluentIcons.b_i_dashboard),
                  title: Text("Dashboard", style: TextStyle(
                      fontWeight: selectedMenu == 0
                          ? FontWeight.w600 : FontWeight.normal,
                      color: selectedMenu == 0 ? mainColor : Colors.grey.withOpacity(0.7)),),
                  onTap: ()=> setState(()=> selectedMenu = 0),
                  body: const DashboardScreen()
              ),
              // PaneItem(
              //     key: const ValueKey('/insert'),
              //     icon: const Icon(FluentIcons.insert),
              //     title: Text("Insert", style: TextStyle(
              //         fontWeight: selectedMenu == 1
              //             ? FontWeight.w600 : FontWeight.normal,
              //         color: selectedMenu == 1 ? mainColor : Colors.grey.withOpacity(0.7)),),
              //     onTap: ()=> setState(()=> selectedMenu = 1),
              //     body: Container()
              // ),
            ],
        ),
      ),
    );
  }
}

