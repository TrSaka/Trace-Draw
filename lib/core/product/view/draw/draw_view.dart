// ignore_for_file: no_leading_underscores_for_local_identifiers, avoid_init_to_null
import 'package:camera/camera.dart';
import 'package:easy_draw/core/base/view/base_view.dart';
import 'package:easy_draw/core/product/view_model/draw/draw_view_model.dart';
import 'package:easy_draw/core/services/camera/camera_services.dart';
import 'package:easy_draw/core/widgets/loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../widgets/floating_action_buttons.dart';

CameraController? cameraController = null;

class DrawView extends ConsumerStatefulWidget {
  const DrawView(this.imageUrl, {super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DrawViewState();

  final String imageUrl;
}

class _DrawViewState extends ConsumerState<DrawView> {
  @override
  Widget build(BuildContext context) {
    DrawViewModel _viewModel = DrawViewModel();

    return BaseView(
      viewModel: _viewModel,
      onModelReady: (model) async {
        _viewModel = model;
        await CameraService().getPermission().then(
          (cameraList) async {
            if (cameraList == null) {
              throw Exception('Camera has not been granted ');
            } else {
              await CameraService()
                  .initalizeCamera(cameraList)
                  ?.then((cameraControllerValue) {
                if (cameraControllerValue == null) {
                  setState(() {});
                  throw Exception('Camera Controller has not been initalized');
                } else {
                  cameraController ??= cameraControllerValue;
                  setState(() {});
                }
              });
            }
          },
        );
      },
      onDispose: () async {
        await cameraController?.dispose();

      },
      onPageBuilder: (context, value) {
        return Scaffold(
            floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
            floatingActionButton: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                OpacityFloatingActionButton(
                  icon: Icons.minimize_rounded,
                  callback: () => _viewModel.decreaseContainerOpacity(),
                  position: 'decreaser_floating_action_tag',
                ),
                OpacityFloatingActionButton(
                  icon: Icons.add_rounded,
                  callback: () => _viewModel.increaseContainerOpacity(),
                  position: 'increaser_floating_action_tag',
                ),
                const ExitFloatingActionButton(),
              ],
            ),
            body: Observer(builder: (context) {
              final containerTop = _viewModel.containerTop;
              final containerHeight = _viewModel.containerHeight;
              final containerLeft = _viewModel.containerLeft;
              final containerWidth = _viewModel.containerWidth;
              var containerOpacity = _viewModel.containerOpacity;
              debugPrint(containerOpacity.toString());

              //this variables created here because when observer not build anything in initstate it exp
              //so I added this two parameters from our view model

              return Listener(
                onPointerMove: (event) {
                  _viewModel.dragContainer(event.delta.dx, event.delta.dy);
                },
                child: GestureDetector(
                  onScaleUpdate: (ScaleUpdateDetails details) {
                    if (details.scale != 1.0 && details.scale != 0.0) {
                      final double scaleFactor = 0.9 + details.scale * 0.1;
                      _viewModel.resizeContainer(scaleFactor);
                    }
                  },
                  child: Stack(
                    children: [
                      cameraController != null
                          ? cameraController!.value.isInitialized
                              ? SizedBox(
                                  height: MediaQuery.of(context).size.height,
                                  width: MediaQuery.of(context).size.width,
                                  child: CameraPreview(cameraController!),
                                )
                              : const LoaderWidget()
                          : const LoaderWidget(),
                      Positioned(
                        top: containerTop,
                        left: containerLeft,
                        child: InkWell(
                          onDoubleTap: () {
                            _viewModel.resetContainer();
                          },
                          child: Center(
                            child: Container(
                              height: containerHeight,
                              width: containerWidth,
                              color: Colors.white.withOpacity(containerOpacity),
                              child: Image(
                                image:
                                    NetworkImage(widget.imageUrl, scale: 0.8),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            }));
      },
    );
  }
}
