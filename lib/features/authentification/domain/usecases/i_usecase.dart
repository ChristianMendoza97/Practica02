import 'package:flutter_application_2/core/errors/failure.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class IUseCase<SuccessType, Params> {
  Future <Either<Failure, SuccessType>> call(Params params);
}