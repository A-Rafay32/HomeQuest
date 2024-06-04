import 'package:either_dart/either.dart';
import 'package:real_estate_app/core/exceptions/exceptions.dart';

typedef FutureEither0 = Future<Either<Failure, Success>>;
typedef FutureEither1<T> = Future<Either<Failure, T>>;
typedef Either0 = Either<Failure, Success>;
typedef Either1<T> = Either<Failure, T>;
typedef failure<T> = Left<Failure, T>;

// Left<Failure, Success> failure(String message) {
//   return Left(Failure(message: message));
// }

Right<Failure, Success> success(String message) {
  return Right(Success(message: message));
}



typedef FailureResult = Left<Failure>;

FailureResult failure(String message) {
  return Left(Failure(message: message));
}
