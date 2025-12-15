import 'package:freezed_annotation/freezed_annotation.dart';

part 'page_state.freezed.dart';

@freezed
abstract class PageState<T> with _$PageState<T> {
  const factory PageState.loading() = _Loading<T>;
  const factory PageState.success(T data) = _Success<T>;
  const factory PageState.error(String message) = _Error<T>;
}
