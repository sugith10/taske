import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'navigation_event.dart';
part 'navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(NavigationHomeState()) {
    on<NavigationEvent>((event, emit) {
      if(event.index ==0){
        emit(NavigationHomeState());
      }else  if(event.index ==1){
        emit(NavigationUserState());
      }
    });
  }
}
