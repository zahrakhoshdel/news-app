part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  static const LOGIN = _Paths.LOGIN;
  static const SIGN_UP = _Paths.SIGN_UP;
  static const HOME = _Paths.HOME;
  static const NEWS = _Paths.NEWS;
  static const NOTES = _Paths.NOTES;
  static const TASKS = _Paths.TASKS;
  static const PROFILE = _Paths.PROFILE;
}

abstract class _Paths {
  static const LOGIN = '/login';
  static const SIGN_UP = '/sign-up';
  static const HOME = '/';
  static const NEWS = '/news';
  static const NOTES = '/notes';
  static const TASKS = '/tasks';
  static const PROFILE = '/profile';
}
