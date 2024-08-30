import 'package:flutter/material.dart';

import '../../../core/base/mixins/controller_mixin.dart';
import 'loading_controller.dart';

class CircularLoadingWidget extends StatelessWidget
    with ControllerMixin<LoadingController> {
  const CircularLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
      stream: controller.isLoadingStream,
      builder: (_, loadingSnap) {
        if (loadingSnap.hasData && loadingSnap.data!) {
          return PopScope(
            canPop: false,
            child: Stack(
              children: <Widget>[
                ModalBarrier(
                  dismissible: false,
                  color: Colors.grey.withOpacity(.3),
                ),
                const Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(Colors.grey),
                  ),
                ),
              ],
            ),
          );
        }

        return const SizedBox();
      },
    );
  }
}
