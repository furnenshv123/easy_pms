import 'package:dartz/dartz.dart';
import 'package:easy_pms/features/log_in/data/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthFirebaseService {
  Future<Either> logInUser(UserModel model);
}

class AuthFirebaseServiceImpl implements AuthFirebaseService{
  @override
  Future<Either> logInUser(UserModel model) async{
    try {
  await FirebaseAuth.instance.signInWithEmailAndPassword(email: model.name + '@gmail.com', password: model.password);
  return const  Right('Log In was successful!!');
} on FirebaseAuthException catch (e) {
  String message = '';
  if(e.code == 'invalid-email'){
    message = 'Wrong email';
  }
  if(e.code == 'invalid-credential'){
    message  = 'Wrong email or pasword!';
  }
  if(e.code == 'user-not-found'){
    message = 'User no';
  }

    return Left(message);
}
  }

}