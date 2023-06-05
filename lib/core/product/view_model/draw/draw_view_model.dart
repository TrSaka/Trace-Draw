// ignore_for_file: library_private_types_in_public_api
import 'package:mobx/mobx.dart';
part 'draw_view_model.g.dart';

class DrawViewModel = _DrawViewModelBase with _$DrawViewModel;

abstract class _DrawViewModelBase with Store {
  @observable
  double containerOpacity = 0.5;

  @observable
  double containerTop = 300.0;
  @observable
  double containerLeft = 150.0;
  @observable
  double containerHeight = 100.0;

  @observable
  double containerWidth = 100.0;

  final double maxScale = 5.0;
  final double minScale = 1.0;

  @action
  dragContainer(deltaX, deltaY) {
    containerTop += deltaY;
    containerLeft += deltaX;
  }

  @action
  increaseContainerOpacity() {
    if (containerOpacity + 0.05 < 0.99) {
      //maximize containerOpacity Level if we do not do that
      //flutter paint library throw Exception
      containerOpacity = containerOpacity + 0.05;
    } else {
      containerOpacity = 0.94;
    }
  }

  @action
  decreaseContainerOpacity() {
    if (containerOpacity - 0.02 > 0.02) {
      //same thing for decrease command
      containerOpacity = containerOpacity - 0.02;
    } else {
      containerOpacity = 0.03;
    }
  }

  @action
  resizeContainer(scale) {
    double scaleValue = scale * 0.9999;
    containerHeight *= scaleValue;
    containerWidth *= scaleValue;
    if (containerHeight > 600.0) {
      containerHeight = 599.0;
    } else if (containerHeight < 100.0) {
      containerHeight = 101.0;
    }
    if (containerWidth > 600.0) {
      containerWidth = 599.0;
    } else if (containerWidth < 100.0) {
      containerWidth = 101.0;
    }
  }

  @action
  resetContainer() {
    containerHeight = 100;
    containerWidth = 100;
  }
}
