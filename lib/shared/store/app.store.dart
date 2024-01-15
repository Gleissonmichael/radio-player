// coverage:ignore-file

import 'package:mobx/mobx.dart';
part 'app.store.g.dart';

class AppStore = AppStoreBase with _$AppStore;

abstract class AppStoreBase with Store {
  @observable
  String detail = "";

  @observable
  int index = 0;

  @action
  void updateDetail(String newDetail) {
    detail = newDetail;
  }

  @action
  void updateIndex(int newIndex) {
    if (index >= 0 || index <= 3) {
      index = newIndex;
    }
  }
}
