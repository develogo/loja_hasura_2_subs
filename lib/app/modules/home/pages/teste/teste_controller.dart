import 'package:hasura_connect/hasura_connect.dart';
import 'package:loja_hasura/app/modules/home/models/produto_model.dart';
import 'package:loja_hasura/app/modules/home/pages/teste/repositories/test_repository.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'teste_controller.g.dart';

class TesteController = _TesteControllerBase with _$TesteController;

abstract class _TesteControllerBase with Store implements Disposable {
  final TestRepository _repository;
  _TesteControllerBase(this._repository) {
    getData();
  }

  @observable
  Snapshot<List<ProdutoModel>> snapshot;

  Future getData() async {
    snapshot = await _repository.getProduto();
  }

  @computed
  ObservableStream<List<ProdutoModel>> get listaProdutos =>
      snapshot?.asObservable();

  @override
  void dispose() {
    snapshot.close();
  }
}
