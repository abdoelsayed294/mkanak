import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mkanak/core/networking/Failure.dart';


part 'result.freezed.dart';

@Freezed()
abstract class Result<T> with _$Result<T> {
  const factory Result.success(T data) = Success<T>;
  
  const factory Result.failure(Failure failure) = FailureResult<T>;
}