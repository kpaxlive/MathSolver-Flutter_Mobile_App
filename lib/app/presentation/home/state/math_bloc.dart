import 'package:bloc/bloc.dart';
import 'package:math_solver/app/core/constants/string_constants.dart';
import 'package:math_solver/app/data/services/get_it_service.dart';

import 'package:math_solver/app/presentation/home/state/math_event.dart';
import 'package:math_solver/app/presentation/home/state/math_state.dart';
import 'package:math_solver/app/presentation/home/widgets/response_dialog.dart';

class MathSolverBloc extends Bloc<MathSolverEvent, MathSolverState>
    with ServicesMixin {
  MathSolverBloc() : super(MathSolverInitial()) {
    on<UploadImageEvent>(_onUploadImageEvent);
    on<CaptureImageEvent>(_onCaptureImageEvent);
  }

  Future _onUploadImageEvent(UploadImageEvent event, Emitter emit) async {
    emit(MathSolverLoading());
    try {
      final canUse = await hiveService.canUseFeature();
      if (canUse) {
        final imageFile = await mediaService.pickImageFromGallery();

        if (imageFile != null) {
          showResponseDialog(
              // ignore: use_build_context_synchronously
              navigationService.navigatorKey!.currentState!.context);
          final response = await apiService.sendImageRequest(imageFile.path);
          if (response != null) {
            emit(MathSolverSuccess(response));
            hiveService.addMathItem(response);
            hiveService.userUsedRights();
          } else {
            emit(MathSolverFailure(TextConstants.noResponseText));
          }
        } else {
          emit(MathSolverFailure(TextConstants.imageNotSelectedText));
        }
      } else {
        navigationService.pushReplacementNamed('/paywallView');
      }
    } catch (e) {
      emit(MathSolverFailure(e.toString()));
    }
  }

  Future _onCaptureImageEvent(CaptureImageEvent event, Emitter emit) async {
    emit(MathSolverLoading());
    try {
      final canUse = await hiveService.canUseFeature();
      if (canUse) {
        final imageFile = await mediaService.captureImageWithCamera();
        if (imageFile != null) {
          showResponseDialog(
              // ignore: use_build_context_synchronously
              navigationService.navigatorKey!.currentState!.context);
          final response = await apiService.sendImageRequest(imageFile.path);
          if (response != null) {
            emit(MathSolverSuccess(response));
            hiveService.addMathItem(response);
          } else {
            emit(MathSolverFailure(TextConstants.noResponseText));
          }
        } else {
          emit(MathSolverFailure(TextConstants.imageNotCapturedText));
        }
      } else {
        navigationService.pushReplacementNamed('/paywallView');
      }
    } catch (e) {
      emit(MathSolverFailure(e.toString()));
    }
  }
}
