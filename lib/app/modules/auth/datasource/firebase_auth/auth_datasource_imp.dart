import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta_track/app/modules/auth/data/datasource/auth_datasource.dart';
import 'package:meta_track/app/modules/auth/domain/entities/user_credentials.dart';
import 'package:meta_track/app/modules/auth/domain/entities/user_credentials_sign_up.dart';
import 'package:meta_track/app/utils/exceptions/firebase_auth_exception_handler.dart';

class AuthDatasourceImp implements AuthDatasource {
  final FirebaseFirestore firebaseFirestore;
  final FirebaseAuth firebaseAuth;

  AuthDatasourceImp(
      {required this.firebaseAuth, required this.firebaseFirestore});
  @override
  Future<User> signIn(UserCredentials userCredentials) async {
    try {
      final user = await firebaseAuth.signInWithEmailAndPassword(
          email: userCredentials.email, password: userCredentials.password);
      return user.user!;
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthExceptionHandler(e.code);
    } catch (e) {
      throw FirebaseAuthExceptionHandler('default');
    }
  }

  @override
  Future<String> signUp(UserCredentialsSignUp userCredentialsSignUp) async {
    try {
      final result = await firebaseAuth.createUserWithEmailAndPassword(
          email: userCredentialsSignUp.email,
          password: userCredentialsSignUp.password);
      result.user!.sendEmailVerification();
      return result.user!.uid;
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthExceptionHandler(e.code);
    } catch (e) {
      throw FirebaseAuthExceptionHandler('default');
    }
  }

  @override
  Future<void> createUser(Map<String, dynamic> map) async {
    await firebaseFirestore
        .collection('users')
        .doc(map['uid'])
        .set({'name': map['name'], 'email': map['email']});
  }

  @override
  Future<void> resetPassword({required String email}) async {
    await firebaseAuth.sendPasswordResetEmail(email: email);
  }
}
