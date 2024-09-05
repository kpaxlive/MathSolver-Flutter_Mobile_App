import 'package:equatable/equatable.dart';

abstract class PayWallEvent extends Equatable {
  const PayWallEvent();

  @override
  List get props => [];
}

class PayWallToggleMonthly extends PayWallEvent {}

class PayWallToggleAnnual extends PayWallEvent {}