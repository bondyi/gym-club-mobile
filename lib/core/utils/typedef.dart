import 'package:dartz/dartz.dart';
import 'package:gym_club_mobile/core/errors/failure.dart';

typedef ResultFuture<T> = Future<Either<Failure, T>>;
typedef DataMap = Map<String, dynamic>;
