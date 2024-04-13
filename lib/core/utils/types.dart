import 'package:either_dart/either.dart';
import 'package:real_estate_app/core/exceptions/auth_exceptions.dart';

typedef FutureEither0 = Future<Either<Failure, Success>>;
typedef FutureEither1<T> = Future<Either<Failure, T>>;
typedef Either0 = Either<Failure, Success>;
