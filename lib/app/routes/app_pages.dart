import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/onboarding/bindings/onboarding_binding.dart';
import '../modules/onboarding/views/onboarding_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/profiles/bindings/profiles_binding.dart';
import '../modules/profiles/views/profiles_view.dart';
import '../modules/qr_code/bindings/qr_code_binding.dart';
import '../modules/qr_code/views/qr_code_view.dart';
import '../modules/rdv/bindings/rdv_binding.dart';
import '../modules/rdv/views/rdv_view.dart';
import '../modules/scanner/bindings/scanner_binding.dart';
import '../modules/scanner/views/scanner_view.dart';
import '../modules/vaccins/bindings/vaccins_binding.dart';
import '../modules/vaccins/views/vaccins_view.dart';
import '../modules/welcome/bindings/welcome_binding.dart';
import '../modules/welcome/views/welcome_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.SCANNER,
      page: () => const ScannerView(),
      binding: ScannerBinding(),
    ),
    GetPage(
      name: _Paths.VACCINS,
      page: () => const VaccinsView(),
      binding: VaccinsBinding(),
    ),
    GetPage(
      name: _Paths.QR_CODE,
      page: () => const QrCodeView(),
      binding: QrCodeBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.WELCOME,
      page: () => WelcomeView(),
      binding: WelcomeBinding(),
    ),
    GetPage(
      name: _Paths.RDV,
      page: () => const RdvView(),
      binding: RdvBinding(),
    ),
    GetPage(
      name: _Paths.ONBOARDING,
      page: () => OnboardingView(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: _Paths.PROFILES,
      page: () => const ProfilesView(),
      binding: ProfilesBinding(),
    ),
  ];
}
