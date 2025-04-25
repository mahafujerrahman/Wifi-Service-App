import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:wifi_service_app/onboarding_screen.dart';
import 'package:wifi_service_app/splash_screen.dart';
import 'package:wifi_service_app/view/screen/auth/code_verifyEmailScreen.dart';
import 'package:wifi_service_app/view/screen/auth/email_verificationScreen.dart';
import 'package:wifi_service_app/view/screen/auth/forgetPassword.dart';
import 'package:wifi_service_app/view/screen/auth/resetPassword_screen.dart';
import 'package:wifi_service_app/view/screen/auth/setPasswordScreen.dart';
import 'package:wifi_service_app/view/screen/auth/signInScreen.dart';
import 'package:wifi_service_app/view/screen/auth/signUpEmailVerify.dart';
import 'package:wifi_service_app/view/screen/auth/signUpScreen.dart';
import 'package:wifi_service_app/view/screen/home/homeScreen.dart';
import 'package:wifi_service_app/view/screen/network/networkScreen.dart';
import 'package:wifi_service_app/view/screen/profile/editPersonalInforamtion.dart';
import 'package:wifi_service_app/view/screen/profile/help/helpScreen.dart';
import 'package:wifi_service_app/view/screen/profile/personalInformationScreen.dart';
import 'package:wifi_service_app/view/screen/profile/profileScreen.dart';
import 'package:wifi_service_app/view/screen/usage/usageScreen.dart';


class AppRoutes{
  static String splashScreen = "/splash_screen";
  static String onboardingScreen = "/Onboarding_screen";
  static String signUpScreen = "/signUpScreen";
  static String signUpCodeVerifyEmailScreen = "/signUpCodeVerifyEmailScreen";
  static String homeScreen = "/homeScreen";
  static String signInScreen = "/signInScreen";

  static String usageScreen = "/usageScreen";
  static String profileScreen = "/profileScreen";
  static String networkScreen = "/networkScreen";
  static String setPasswordScreen = "/setPasswordScreen";
  static String emailVerificationScreen = "/emailVerificationScreen";
  static String codeVerifyEmailScreen = "/CodeVerifyEmailScreen";
  static String forgetPasswordScreen = "/forgetPasswordScreen";
  static String resetPasswordScreen = "/resetPasswordScreen";
  static String personalInformationScreen = "/personalInformationScreen";
  static String editPersonalInformationScreen = "/editPersonalInformationScreen";

  static String helpScreen = "/help_screen";





 static List<GetPage> page=[

   //SplashScreen
   GetPage(name:splashScreen, page: ()=>const SplashScreen(),transition: Transition.noTransition),
   GetPage(name:onboardingScreen, page: ()=> OnboardingScreen(),transition: Transition.noTransition),

   //Auth
   GetPage(name:signUpScreen, page: ()=> SignUpScreen(),transition: Transition.noTransition),
   GetPage(name:signInScreen, page: ()=> SignInScreen(),transition: Transition.noTransition),
   GetPage(name:signUpCodeVerifyEmailScreen, page: ()=> SignUpCodeVerifyEmailScreen(),transition: Transition.noTransition),
   GetPage(name:setPasswordScreen, page: ()=> SetPasswordScreen(),transition: Transition.noTransition),
   GetPage(name:emailVerificationScreen, page: ()=> EmailVerificationScreen(),transition: Transition.noTransition),
   GetPage(name:codeVerifyEmailScreen, page: ()=> CodeVerifyEmailScreen(),transition: Transition.noTransition),
   GetPage(name:forgetPasswordScreen, page: ()=> ForgetPasswordScreen(),transition: Transition.noTransition),
   GetPage(name:resetPasswordScreen, page: ()=> ResetPasswordScreen(),transition: Transition.noTransition),

   //Home
   GetPage(name:homeScreen, page: ()=> HomeScreen(),transition: Transition.noTransition),

   //Calender
   GetPage(name:usageScreen, page: ()=> UsageScreen(),transition: Transition.noTransition),
   GetPage(name:networkScreen, page: ()=> NetworkScreen(),transition: Transition.noTransition),

   //Profile
   GetPage(name:profileScreen, page: ()=> ProfileScreen(),transition: Transition.noTransition),
   GetPage(name:personalInformationScreen, page: ()=> PersonalInformationScreen(),transition: Transition.noTransition),
   GetPage(name:editPersonalInformationScreen, page: ()=> EditPersonalInformationScreen(),transition: Transition.noTransition),
   GetPage(name:helpScreen, page: ()=> HelpScreen(),transition: Transition.noTransition),



  ];
}