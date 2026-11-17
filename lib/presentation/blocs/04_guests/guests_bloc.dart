import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_cubits/domain/domain.dart';

part 'guests_event.dart';
part 'guests_state.dart';

class GuestsBloc extends Bloc<GuestsEvent, GuestsState> {
  GuestsBloc() : super(GuestsState()) {
    on<SetInvitedFilterEvent>((event, emit) {
      emit(state.copyWith(filter: GuestFilter.invited));
    });

    on<SetNoInvitedFilterEvent>((event, emit) {
      emit(state.copyWith(filter: GuestFilter.noInvited));
    });

    on<SetAllFilterEvent>((event, emit) {
      emit(state.copyWith(filter: GuestFilter.all));
    });
  }

  void changeFilter(GuestFilter newFilter) {
    switch (newFilter) {
      case GuestFilter.all:
        add(SetAllFilterEvent());
        break;
      case GuestFilter.invited:
        add(SetInvitedFilterEvent());
        break;
      case GuestFilter.noInvited:
        add(SetNoInvitedFilterEvent());
        break;
    }
  }
}
