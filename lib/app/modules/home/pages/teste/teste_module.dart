import 'package:dio/dio.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'repositories/test_repository.dart';
import 'teste_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'teste_page.dart';

class TesteModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => TestRepository(i.get<HasuraConnect>())),
        Bind((i) => TesteController(i.get())),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => TestePage()),
      ];

  static Inject get to => Inject<TesteModule>.of();
}
