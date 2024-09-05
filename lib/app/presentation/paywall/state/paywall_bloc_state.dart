part of 'paywall_bloc_bloc.dart';

abstract class PayWallState extends Equatable 
{
  final bool monthly;
  final bool annual;

  const PayWallState({required this.monthly, required this.annual});

  @override
  List get props => [monthly, annual];
}

class PayWallInitial extends PayWallState 
{
  const PayWallInitial() : super(monthly: false, annual: false);
}

class PayWallMonthlySelected extends PayWallState 
{
  const PayWallMonthlySelected({required super.monthly, required super.annual});


}

class PayWallAnnualSelected extends PayWallState 
{
  const PayWallAnnualSelected({required super.monthly, required super.annual});


}