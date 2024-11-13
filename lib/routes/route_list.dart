import 'package:go_router/go_router.dart';
import 'package:todolist/features/auth/login/views/login_view.dart';
import 'package:todolist/features/auth/register/views/registration_view.dart';
import 'package:todolist/features/home/views/checklist_view.dart';
import 'package:todolist/features/splash_screen.dart';

List<RouteBase> listRoute = [
  /// Tambahkan routename dan halam disini jika akan menggunakan route routeNamed()
  GoRoute(path: '/', builder: (context, state) => const SplashScreen()),
  GoRoute(path: RegistrationView.routeName, builder: (context, state) => const RegistrationView()),
  GoRoute(path: LoginView.routeName, builder: (context, state) => const LoginView()),
  GoRoute(path: CheckListView.routeName, builder: (context, state) => const CheckListView()),
];
