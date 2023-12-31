import 'package:flutter_modular/flutter_modular.dart';
import 'package:job_timer/app/modules/login/controller/login_controller.dart';
import 'package:modular_bloc_bind/modular_bloc_bind.dart';

import 'login_page.dart';

class LoginModule extends Module {
  @override
  List<Bind> get binds => [
        BlocBind.lazySingleton(
            (i) => LoginController(authService: i())) //Authservice -> AppModule
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => LoginPage(
            controller: Modular.get(),
          ),
        )
      ];
}
