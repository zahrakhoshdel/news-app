import 'package:get/get.dart';
import 'package:news_event_management/screens/authentication/authentication_bindings.dart';
import 'package:news_event_management/screens/authentication/signin_screen.dart';
import 'package:news_event_management/screens/authentication/signup_screen.dart';
import 'package:news_event_management/screens/home/home_binding.dart';
import 'package:news_event_management/screens/home/home_screen.dart';
import 'package:news_event_management/screens/news/news_screen.dart';
import 'package:news_event_management/screens/notes/note_screen.dart';
import 'package:news_event_management/screens/profile/profile_screen.dart';
import 'package:news_event_management/screens/tasks/task_screen.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.LOGIN,
      page: () => SignInScreen(),
      binding: AuthenticationBindings(),
    ),
    GetPage(
      name: _Paths.SIGN_UP,
      page: () => SignUpScreen(),
      binding: AuthenticationBindings(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.NEWS,
      page: () => const NewsScreen(),
    ),
    GetPage(
      name: _Paths.NOTES,
      page: () => NoteScreen(),
    ),
    GetPage(
      name: _Paths.TASKS,
      page: () => TaskScreen(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileScreen(),
    ),
  ];
}
