import 'package:bookly_app/core/errors/fauilers.dart';
import 'package:bookly_app/core/utls/api_dio_services.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/repo/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImplementation implements HomeRepo {
  final ApiService apiService;

  HomeRepoImplementation(this.apiService);

  @override
  Future<Either<Failure, List<BookModel>>> fetchNewestBooks() async {
    try {
      var res = await apiService.get(
          endPoint:
              'volumes?Filtering=free-ebooks&Sorting=newest &q=computer science');
      List<BookModel> data = [];
      for (var book in res['items']) {
        data.add(
          BookModel.fromJson(book),
        );
      }
      return right(data);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.formDioException(e),
        );
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchRecommendedBooks() async {
    try {
      var res = await apiService.get(
          endPoint:
              'volumes?Filtering=free-ebooks&q=programming');
      List<BookModel> data = [];
      for (var book in res['items']) {
        data.add(
          BookModel.fromJson(book),
        );
      }
      return right(data);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.formDioException(e),
        );
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }
  
  @override
  Future<Either<Failure, List<BookModel>>> fetchSimilartBooks({required String category}) async{
    try {
      var res = await apiService.get(
          endPoint:
              'volumes?Filtering=free-ebooks&Sorting=relevance &q=programming');
      List<BookModel> data = [];
      for (var book in res['items']) {
        data.add(
          BookModel.fromJson(book),
        );
      }
      return right(data);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.formDioException(e),
        );
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }
}
