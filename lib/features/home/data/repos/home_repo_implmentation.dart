import 'package:bookly/core/errors/failures.dart';
import 'package:bookly/core/utils/api_service.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/home/data/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImplmentation implements HomeRepo {
  final ApiService apiService;
  HomeRepoImplmentation(this.apiService);
  @override
  Future<Either<Failures, List<BookModel>>> fetchNewsetBooks() async {
    try {
      var data = await apiService.get(
        endPoint:
            'volumes?q=subject:programming&Filtering=free-ebooks&Sorting=newest&key=AIzaSyBdPB0_E5ljg2GqetTA7fTFsvDmGj2OkkI',
      );
      List<BookModel> books = [];
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }
      return right(books); // must specify right side
    } catch (e) {
      if (e is DioException) {
        //DioException is built-in method in dio
        return left(ServerFailure.fromDioException(e)); //must specify left side
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<List<BookModel>> fetchFeaturedBooks() {
    // TODO: implement fetchFeaturedBooks
    throw UnimplementedError();
  }
}
