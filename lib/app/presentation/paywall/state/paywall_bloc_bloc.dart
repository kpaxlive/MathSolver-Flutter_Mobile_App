import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:math_solver/app/presentation/paywall/state/paywall_bloc_event.dart';

part 'paywall_bloc_state.dart';

class PayWallBloc extends Bloc<PayWallEvent, PayWallState>{
  PayWallBloc() : super(const PayWallInitial()) 
  {
    on<PayWallToggleMonthly>((event, emit) 
    {
      emit(PayWallMonthlySelected(monthly: !state.monthly, annual: false));
    });

    on<PayWallToggleAnnual>((event, emit) {
      emit(PayWallAnnualSelected(monthly: false, annual: !state.annual));
    });
  }
}
