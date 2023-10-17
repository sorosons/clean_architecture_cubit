import 'package:another_flushbar/flushbar.dart';
import 'package:clean_arhitecture/core/utils/logger_settigns.dart';
import 'package:clean_arhitecture/presentation/common/state_renderer/state_renderer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../../../data/mapper/user_mapper.dart';
import '../../resources/strings_manager.dart';

abstract class FlowState {
  StateRendererType getStateRendererType();
  dynamic getMessage();
}

// Loading State (POPUP, FULL SCREEN)

class InitalState extends FlowState {
  @override
  getMessage() {
    // TODO: implement getMessage
    throw UnimplementedError();
  }

  @override
  StateRendererType getStateRendererType() {
    // TODO: implement getStateRendererType
    throw UnimplementedError();
  }
}

class LoadingState extends FlowState {
  StateRendererType stateRendererType;
  String message;

  LoadingState({required this.stateRendererType, String? message})
      : message = message ?? AppStrings.loading;

  @override
  String getMessage() => message;

  @override
  StateRendererType getStateRendererType() => stateRendererType;
}

// error state (POPUP, FULL LOADING)
class ErrorState extends FlowState {
  StateRendererType stateRendererType;
  String message;

  ErrorState({required this.stateRendererType, required this.message});

  @override
  String getMessage() => message;

  @override
  StateRendererType getStateRendererType() => stateRendererType;
}

//LOADED STATE
class LoadedState extends FlowState {
  dynamic data; // Verilerinizi içeren bir liste veya model sınıfı

  LoadedState(this.data);

  @override
  String getMessage() => EMPTY;

  @override
  StateRendererType getStateRendererType() =>
      StateRendererType.CONTENT_SCREEN_STATE;
}

// CONTENT STATE
class ContentState extends FlowState {
  dynamic data; // Verilerinizi içeren bir liste veya model sınıfı

  ContentState(this.data);
  @override
  String getMessage() => EMPTY;

  @override
  StateRendererType getStateRendererType() =>
      StateRendererType.CONTENT_SCREEN_STATE;
}

// EMPTY STATE

class EmptyState extends FlowState {
  String message;

  EmptyState(this.message);

  @override
  String getMessage() => message;

  @override
  StateRendererType getStateRendererType() =>
      StateRendererType.EMPTY_SCREEN_STATE;
}

// success state
class SuccessState extends FlowState {
  String message;

  SuccessState(this.message);

  @override
  String getMessage() => message;

  @override
  StateRendererType getStateRendererType() => StateRendererType.POPUP_SUCCESS;
}

// success state
class PopupInfoState extends FlowState {
  String message;

  PopupInfoState(this.message);

  @override
  String getMessage() => message;

  @override
  StateRendererType getStateRendererType() => StateRendererType.POPUP_SUCCESS;
}

// success state
class FlushBarState extends FlowState {
  dynamic message;

  FlushBarState(this.message);

  @override
  dynamic getMessage() => message;

  @override
  StateRendererType getStateRendererType() => StateRendererType.FLUSH_BAR_STATE;
}

extension FlowStateExtension on FlowState {
  Widget getScreenWidget(BuildContext context, Widget contentScreenWidget,
      Function retryActionFunction) {
    switch (runtimeType) {
      case LoadingState:
        {
          logger.i("XXXXXxLOADİNGSTATE");
          if (getStateRendererType() == StateRendererType.POPUP_LOADING_STATE) {
            // showing popup dialog

            showPopUp(context, getStateRendererType(), getMessage(),
                retryActionFunction);
            // return the content ui of the screen
            return contentScreenWidget;
          } else // StateRendererType.FULL_SCREEN_LOADING_STATE
          {
            logger.i("XXXXX2");
            return StateRenderer(
              stateRendererType: getStateRendererType(),
              message: getMessage(),
              retryActionFunction: retryActionFunction,
            );
          }
        }
      case ErrorState:
        {
          //   dismissDialog(context);
          if (getStateRendererType() == StateRendererType.POPUP_ERROR_STATE) {
            // showing popup dialog
            showPopUp(context, getStateRendererType(), getMessage(),
                retryActionFunction);
            // return the content ui of the screen

            return contentScreenWidget;
          } else // StateRendererType.FULL_SCREEN_ERROR_STATE
          {
            return StateRenderer(
                stateRendererType: getStateRendererType(),
                message: getMessage(),
                retryActionFunction: retryActionFunction);
          }
        }
      case ContentState:
        {
          logger.e("XXXXXXXContentState");
          dismissDialog(context);
          return contentScreenWidget;
        }
      case EmptyState:
        {
          return StateRenderer(
            stateRendererType: getStateRendererType(),
            message: getMessage(),
            retryActionFunction: retryActionFunction,
          );
        }
      case SuccessState:
        {
          logger.e("SuccessState");
          // i should check if we are showing loading popup to remove it before showing success popup
          //dismissDialog(context);

          // show popup

          showPopUp(context, StateRendererType.POPUP_SUCCESS, getMessage(),
              retryActionFunction,
              title: AppStrings.success);
          // return content ui of the screen
          return contentScreenWidget;
        }

      case FlushBarState:
        {
          //  dismissDialog(context);
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
            var name = "Tittle";
            var status = "available";

            Flushbar(
              message: status == "available"
                  ? name + " " + AppStrings.online
                  : name + " " + AppStrings.offline,
              flushbarPosition: FlushbarPosition.TOP,
              duration: Duration(seconds: 2),
              backgroundColor:
                  status == "unavailable" ? Colors.red : Colors.green,
            )..show(context);
          });

          return contentScreenWidget;
        }

      case PopupInfoState:
        {
          {
            // i should check if we are showing loading popup to remove it before showing success popup
            dismissDialog(context);

            // show popup
            showPopUp(
              context,
              StateRendererType.POPUP_INFO,
              getMessage(),
              retryActionFunction,
              title: AppStrings.info,
            );
            // return content ui of the screen
            return contentScreenWidget;
          }
        }
      default:
        {
          return contentScreenWidget;
        }
    }
  }

  dismissDialog(BuildContext context) {
    if (_isThereCurrentDialogShowing(context)) {
      SchedulerBinding.instance.addPostFrameCallback((_) {
        Navigator.of(context, rootNavigator: true).pop();
      });
    }
  }

  _isThereCurrentDialogShowing(BuildContext context) =>
      ModalRoute.of(context)?.isCurrent != true;

  showPopUp(BuildContext context, StateRendererType stateRendererType,
      String message, Function okFunc,
      {String title = EMPTY}) {
    logger.i("WidgetsBinding");

    if (!_isThereCurrentDialogShowing(context)) {
      WidgetsBinding.instance.addPostFrameCallback((_) => showDialog(
          context: context,
          builder: (BuildContext context) => StateRenderer(
                stateRendererType: stateRendererType,
                message: message,
                title: title,
                retryActionFunction: () {
                  okFunc.call();
                },
              )));
    }
  }
}
