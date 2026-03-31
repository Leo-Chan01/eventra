import 'package:dartz/dartz.dart';
import 'package:eventra/core/error/error_handler.dart';
import 'package:eventra/core/utils/failures.dart';
import 'package:eventra/core/utils/global_snackbar.dart';
import 'package:eventra/core/utils/type_defs.dart';

/// Mixin for Blocs/Cubits to handle errors consistently.
///
/// This mixin does NOT manage state (loading/error) because Bloc states
/// are managed by emitting new state classes. Instead, it provides
/// utility methods to handle results and show UI feedback.
mixin BlocErrorMixin {
  /// Handle failure by logging and showing a snackbar
  void onFailure(Failure failure, {String? context, bool showSnackbar = true}) {
    final userMessage = ErrorHandler.getUserFriendlyMessage(failure);
    if (showSnackbar) {
      GlobalSnackBar.showError(userMessage);
    }
    ErrorHandler.logError(failure, context: context ?? runtimeType.toString());
  }

  /// Handle a result of type [Either<Failure, T>]
  void handleResult<T>(
    Either<Failure, T> result, {
    required void Function(T data) onSuccess,
    void Function(Failure failure)? onError,
    String? context,
    bool showSnackbar = true,
  }) {
    result.fold(
      (failure) {
        if (onError != null) {
          onError(failure);
        } else {
          onFailure(failure, context: context, showSnackbar: showSnackbar);
        }
      },
      onSuccess,
    );
  }

  /// Handle a [FutureEither<T>] result
  Future<void> handleFutureResult<T>(
    FutureEither<T> futureResult, {
    required void Function(T data) onSuccess,
    void Function(Failure failure)? onError,
    String? context,
    bool showSnackbar = true,
  }) async {
    final result = await futureResult;
    handleResult(
      result,
      onSuccess: onSuccess,
      onError: onError,
      context: context,
      showSnackbar: showSnackbar,
    );
  }

  /// Handle async operation with automatic error handling
  /// for non-Either returns
  Future<T?> handleAsync<T>({
    required Future<T> Function() operation,
    String? errorContext,
    bool showErrorSnackbar = true,
    void Function(T result)? onSuccess,
    void Function(Failure failure)? onError,
  }) async {
    try {
      final result = await operation();
      onSuccess?.call(result);
      return result;
    } on Object catch (e, stackTrace) {
      final failure = ErrorHandler.handleException(e, stackTrace);
      if (onError != null) {
        onError(failure);
      } else {
        onFailure(
          failure,
          context: errorContext ?? runtimeType.toString(),
          showSnackbar: showErrorSnackbar,
        );
      }
      return null;
    }
  }

  /// Show success message
  void showSuccess(String message) {
    GlobalSnackBar.showSuccess(message);
  }

  /// Show warning message
  void showWarning(String message) {
    GlobalSnackBar.showWarning(message);
  }

  /// Show info message
  void showInfo(String message) {
    GlobalSnackBar.showInfo(message);
  }
}
