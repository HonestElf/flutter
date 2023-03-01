import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

class PlatformWidget extends StatelessWidget {
  const PlatformWidget({super.key});

  // void _onPlatformWebViewCreated(int id) {
  //   print('PlatformView with id: $id created');
  // }

  @override
  Widget build(BuildContext context) {
    late final Widget view;
    if (defaultTargetPlatform == TargetPlatform.android) {
      // view = AndroidView(
      //   viewType: 'INTEGRATION_ANDROID',
      //   onPlatformViewCreated: _onPlatformWebViewCreated,
      // );

      const viewType = 'INTEGRATION_ANDROID';
      final Map<String, dynamic> creationParams = <String, dynamic>{};

      view = PlatformViewLink(
        viewType: viewType,
        surfaceFactory:
            (BuildContext context, PlatformViewController controller) {
          return AndroidViewSurface(
            controller: controller as AndroidViewController,
            gestureRecognizers: const <Factory<OneSequenceGestureRecognizer>>{},
            hitTestBehavior: PlatformViewHitTestBehavior.opaque,
          );
        },
        onCreatePlatformView: (PlatformViewCreationParams params) {
          return PlatformViewsService.initSurfaceAndroidView(
            id: params.id,
            viewType: viewType,
            layoutDirection: TextDirection.ltr,
            creationParams: creationParams,
            creationParamsCodec: const StandardMessageCodec(),
            onFocus: () {
              params.onFocusChanged(true);
            },
          )
            ..addOnPlatformViewCreatedListener(params.onPlatformViewCreated)
            ..create();
        },
      );
    } else if (defaultTargetPlatform == TargetPlatform.iOS) {
      view = const Text('iOS is not supported yet');
    } else {
      view = Text('$defaultTargetPlatform is not supported yet');
    }
    return SizedBox(
      height: 50,
      width: 200,
      child: view,
    );
  }
}