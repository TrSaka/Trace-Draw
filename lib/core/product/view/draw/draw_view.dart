import 'package:camera/camera.dart';
import 'package:easy_draw/core/product/view_model/draw/draw_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../widgets/exit_floating_action_button.dart';

class DrawView extends ConsumerStatefulWidget {
  const DrawView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DrawViewState();
}

class _DrawViewState extends ConsumerState<DrawView> {
  @override
  Widget build(BuildContext context) {
    DrawViewModel _viewModel = DrawViewModel();

    return Scaffold(
        floatingActionButton: const ExitFloatingActionButton(),
        body: GestureDetector(
          onPanUpdate: (DragUpdateDetails details) {
            _viewModel.dragContainer(details.delta.dx, details.delta.dy);
          },
          onScaleUpdate: (ScaleUpdateDetails details) {
            _viewModel.resizeContainer(details.scale);
          },
          child: Stack(
            children: [
              Positioned(
                  top: _viewModel.containerTop,
                  left: _viewModel.containerLeft,
                  child: GestureDetector(
                    onDoubleTap: () {
                      _viewModel.resetContainer();
                    },
                    child: Container(
                      height: _viewModel.containerHeight,
                      width: _viewModel.containerWidth,
                      color: Colors.blue,
                    ),
                  ))
            ],
          ),
        ));
  }
}
