import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/state_manager.dart';
import 'package:news_event_management/screens/home/home_controller.dart';
import 'package:news_event_management/screens/news/news_screen.dart';
import 'package:news_event_management/screens/notes/note_screen.dart';
import 'package:news_event_management/screens/profile/profile_screen.dart';
import 'package:news_event_management/screens/tasks/task_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return SafeArea(
        child: Scaffold(
          body: IndexedStack(
            index: controller.tabIndex,
            children: [
              const NewsScreen(),
              TaskScreen(),
              NoteScreen(),
              const ProfileScreen(),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
              selectedItemColor: Colors.purpleAccent,
              elevation: 5,
              unselectedItemColor: Colors.grey,
              iconSize: 30,
              selectedFontSize: 20,
              currentIndex: controller.tabIndex,
              onTap: (val) {
                controller.changeTabIndex(val);
              },
              items: const [
                BottomNavigationBarItem(
                  label: 'News',
                  icon: Icon(
                    Icons.newspaper_outlined,
                  ),
                ),
                BottomNavigationBarItem(
                  label: 'Tasks',
                  icon: Icon(
                    Icons.task_outlined,
                  ),
                ),
                BottomNavigationBarItem(
                  label: 'Notes',
                  icon: Icon(
                    Icons.note_outlined,
                  ),
                ),
                BottomNavigationBarItem(
                  label: 'Profile',
                  icon: Icon(
                    Icons.person_outline,
                  ),
                ),
              ]),
          floatingActionButton: SpeedDial(
            animatedIcon: AnimatedIcons.add_event,
            backgroundColor: Colors.purpleAccent,
            overlayColor: Colors.purpleAccent,
            overlayOpacity: 0.1,
            curve: Curves.linear,
            children: [
              SpeedDialChild(
                child: Icon(Icons.add_task_outlined),
                label: "Add Task",
                onTap: () {},
              ),
              SpeedDialChild(
                child: Icon(Icons.note_add_outlined),
                label: "Add Note",
                onTap: () {},
              ),
            ],
          ),
        ),
      );
    });
  }
}
