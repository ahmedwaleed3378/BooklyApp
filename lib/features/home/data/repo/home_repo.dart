import 'package:bookly_app/core/errors/fauilers.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BookModel>>> fetchRecommendedBooks();
   Future<Either<Failure, List<BookModel>>>fetchNewestBooks();
   Future<Either<Failure, List<BookModel>>>fetchSimilartBooks({required String category});
}
