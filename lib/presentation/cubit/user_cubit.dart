import 'package:bloc/bloc.dart';
import 'package:clean_arhitecture/data/models/user_model.dart';
import 'package:clean_arhitecture/domain/usecase/get_users_usecase.dart';
import 'package:clean_arhitecture/presentation/common/state_renderer/state_render_impl.dart';
import 'package:clean_arhitecture/presentation/common/state_renderer/state_renderer.dart';
import 'package:equatable/equatable.dart';

import '../../domain/entities/user.dart';

part 'user_state.dart';

class UserCubit extends Cubit<FlowState> {
  UserCubit({required GetUsersUseCase getUsersUseCase})
      : _getUsersUseCase = getUsersUseCase,
        super(InitalState());

  final GetUsersUseCase _getUsersUseCase;

  Future<void> getUsers() async {
    emit(LoadingState(
        stateRendererType: StateRendererType.POPUP_LOADING_STATE,
        message: "Loading...."));

    try {
      final result = await _getUsersUseCase.call();

      result.fold((failure) {
        emit(ErrorState(
            stateRendererType: StateRendererType.POPUP_ERROR_STATE,
            message: "Hello Failure"));
      }, (users) {
        emit(ContentState(users));
      });
    } catch (error) {
      emit(ErrorState(
          stateRendererType: StateRendererType.POPUP_ERROR_STATE,
          message: "Hello Failure $error"));
    }
  }
}
