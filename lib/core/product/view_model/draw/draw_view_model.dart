import 'package:mobx/mobx.dart';
part 'draw_view_model.g.dart';

class DrawViewModel = _DrawViewModelBase with _$DrawViewModel;

abstract class _DrawViewModelBase with Store {
  @observable
  double containerTop = 0.0;
  @observable
  double containerLeft = 0.0;
  @observable
  double containerHeight = 100.0;
  @observable
  double containerWidth = 100.0;

  @action
  dragContainer(deltaX, deltaY) {
    containerTop += deltaY;
    containerLeft += deltaX;
  }

  @action
  resizeContainer(scale) {
    containerHeight *= scale;
    containerWidth *= scale;
  }

  @action
  resetContainer() {
    containerHeight = 100;
    containerWidth = 100;
  }
}
