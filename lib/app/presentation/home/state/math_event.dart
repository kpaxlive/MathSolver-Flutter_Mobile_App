import 'package:equatable/equatable.dart';

abstract class MathSolverEvent extends Equatable {
  @override
  List get props => [];
}

class UploadImageEvent extends MathSolverEvent {}

class CaptureImageEvent extends MathSolverEvent {}
