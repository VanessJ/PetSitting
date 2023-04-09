import 'package:pet_sitting/services/auth_service.dart';
import 'package:get_it/get_it.dart';
import 'package:firebase_auth/firebase_auth.dart';


final get = GetIt.instance;

class IoCContainer {
  Future<void> setup() async {

    get.registerSingleton<FirebaseAuth>(
        FirebaseAuth.instance,
    );

    get.registerSingleton<AuthService>(
      AuthService(get<FirebaseAuth>()),
    );
  }
}