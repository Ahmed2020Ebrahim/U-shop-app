import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ushop/utils/local_storage/app_local_storage.dart';
import '../../../common/widgets/loaders/animated_loader.dart';
import '../../../featuers/authentication/login/views/screens/login_screen.dart';
import '../../../featuers/authentication/sign_up/views/screens/email_verify_screen.dart';
import '../../../routes/app_routs.dart';
import '../../../utils/constants/images.dart';
import '../../../utils/constants/shared_pref_keys.dart';
import '../../../utils/exceptions/firebase_exception.dart';
import '../../../utils/helpers/network_manager.dart';
import '../user_repository/user_repository.dart';

class AuthenticationRepository extends GetxController {
  //creat instance
  static AuthenticationRepository get instance => Get.find();

  //firebase instance
  final _auth = FirebaseAuth.instance;

  //variabels
  final deviceStorage = GetStorage();

  //get current authenticated user data
  User? get authUser => _auth.currentUser;

  //called from main.dart
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  //to controll if the first time to show onboarding screen or go to login screen
  screenRedirect() async {
    //check internet connection
    final isConnected = await NetworkManager.instance.isNetworkConnection();
    if (!isConnected) {
      Get.to(() => const Scaffold(body: AnimatedLoader(animation: AppImages.noInternet)));
      return;
    }
    final user = _auth.currentUser;
    //check user authentication
    if (user != null) {
      if (user.emailVerified) {
        //creating current user localStorage
        await AppLocalStorage.init(user.uid);

        //navigate to the bottomNavigationMenu if the current user is verified
        Get.offAllNamed(AppRouts.bottomNavigationMenu);
      } else {
        Get.offAll(() => EmailVerifyScreen(email: _auth.currentUser!.email));
      }
    } else {
      //check if the first run
      deviceStorage.writeIfNull(SharedPrefKeys.isFirstTime, true);
      deviceStorage.read(SharedPrefKeys.isFirstTime) != true ? Get.offAll(() => const LoginScreen()) : Get.offAllNamed(AppRouts.onBoardingScreen);
    }
  }

  //!------------------------ Email & password Auth -------------------//

  // [EmailAuthentication]   -   register
  Future<UserCredential> registerWithEmailAndPassword(String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw FirebaseExceptionHandler(e.code).message;
    } on FirebaseException catch (e) {
      throw FirebaseExceptionHandler(e.code).message;
    } on FormatException catch (e) {
      throw FirebaseExceptionHandler(e.message).message;
    } on PlatformException catch (e) {
      throw FirebaseExceptionHandler(e.code).message;
    } catch (e) {
      throw throw FirebaseExceptionHandler("some unknown happend!").message;
    }
  }

  /// [EMAIL VERIFICATION]   -   email verification
  Future<void> sendVerificationEmail() async {
    try {
      await _auth.currentUser!.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw FirebaseExceptionHandler(e.code).message;
    } on FirebaseException catch (e) {
      throw FirebaseExceptionHandler(e.code).message;
    } on FormatException catch (e) {
      throw FirebaseExceptionHandler(e.message).message;
    } on PlatformException catch (e) {
      throw FirebaseExceptionHandler(e.code).message;
    } catch (e) {
      throw throw FirebaseExceptionHandler("some unknown happend!").message;
    }
  }

  // [EmailAuthentication]   -   sign in
  Future<UserCredential> loginWithEmailAndPassword(String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw FirebaseExceptionHandler(e.code).message;
    } on FirebaseException catch (e) {
      throw FirebaseExceptionHandler(e.code).message;
    } on FormatException catch (e) {
      throw FirebaseExceptionHandler(e.message).message;
    } on PlatformException catch (e) {
      throw FirebaseExceptionHandler(e.code).message;
    } catch (e) {
      throw throw FirebaseExceptionHandler("some unknown happend!").message;
    }
  }

  // [REAUTHENTICATE USER]   -   reauthenticate user
  Future<void> reauthenticateWithEmailPassword(String email, String password) async {
    try {
      // Create EmailAuthCredential
      final credential = EmailAuthProvider.credential(email: email, password: password);

      // Reauthenticate the user with email and password
      await _auth.currentUser!.reauthenticateWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      throw FirebaseExceptionHandler(e.code).message;
    } on FirebaseException catch (e) {
      throw FirebaseExceptionHandler(e.code).message;
    } on FormatException catch (e) {
      throw FirebaseExceptionHandler(e.message).message;
    } on PlatformException catch (e) {
      throw FirebaseExceptionHandler(e.code).message;
    } catch (e) {
      throw throw FirebaseExceptionHandler("some unknown happend!").message;
    }
  }

  // [  FORGET PASSWORD  ]   -   forget password
  Future<void> sendResetPasswordEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw FirebaseExceptionHandler(e.code).message;
    } on FirebaseException catch (e) {
      throw FirebaseExceptionHandler(e.code).message;
    } on FormatException catch (e) {
      throw FirebaseExceptionHandler(e.message).message;
    } on PlatformException catch (e) {
      throw FirebaseExceptionHandler(e.code).message;
    } catch (e) {
      throw throw FirebaseExceptionHandler("some unknown happend!").message;
    }
  }

  //!------------------------ federated identity & social Auth -------------------//

  // [GOOGLE AUTHENTICATION]   -   google
  Future<UserCredential?> signInWithGoogle() async {
    try {
      //Starting the interactive sign-in process.
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      //get auth details from the request
      final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

      //create new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      //return usercredential when signed in
      return await _auth.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      throw FirebaseExceptionHandler(e.code).message;
    } on FirebaseException catch (e) {
      throw FirebaseExceptionHandler(e.code).message;
    } on FormatException catch (e) {
      throw FirebaseExceptionHandler(e.message).message;
    } on PlatformException catch (e) {
      throw FirebaseExceptionHandler(e.code).message;
    } catch (e) {
      throw throw FirebaseExceptionHandler("some unknown happend!").message;
    }
  }

  // [FACEBOOK AUTHENTICATION]   - facebook

  //!------------------------  logout & delete user -------------------//

  // [USER LOGOUT]  - logout
  Future<void> logOut() async {
    try {
      await GoogleSignIn().signOut();
      await _auth.signOut();
      Get.offAll(() => const LoginScreen());
    } on FirebaseAuthException catch (e) {
      throw FirebaseExceptionHandler(e.code).message;
    } on FirebaseException catch (e) {
      throw FirebaseExceptionHandler(e.code).message;
    } on FormatException catch (e) {
      throw FirebaseExceptionHandler(e.message).message;
    } on PlatformException catch (e) {
      throw FirebaseExceptionHandler(e.code).message;
    } catch (e) {
      throw throw FirebaseExceptionHandler("some unknown happend!").message;
    }
  }

  // [DELETE USER]  - delete user
  Future<void> deleteUserAccount() async {
    try {
      final userRepo = Get.put(UserRepository());
      await userRepo.removeUserData(_auth.currentUser!.uid);
      await _auth.currentUser!.delete();
    } on FirebaseAuthException catch (e) {
      throw FirebaseExceptionHandler(e.code).message;
    } on FirebaseException catch (e) {
      throw FirebaseExceptionHandler(e.code).message;
    } on FormatException catch (e) {
      throw FirebaseExceptionHandler(e.message).message;
    } on PlatformException catch (e) {
      throw FirebaseExceptionHandler(e.code).message;
    } catch (e) {
      throw throw FirebaseExceptionHandler("some unknown happend!").message;
    }
  }
}
