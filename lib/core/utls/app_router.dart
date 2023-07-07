import 'package:bookly_app/core/utls/service_locator.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/repo/home_repo.dart';
import 'package:bookly_app/features/home/data/repo/home_repo_implementation.dart';
import 'package:bookly_app/features/home/presentation/views/book_details_view.dart';
import 'package:bookly_app/features/home/presentation/views/home_view.dart';
import 'package:bookly_app/features/search/presentation/views/search_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../features/home/presentation/view_models/similar_books/similar_books_cubit.dart';
import '../../features/splash/presentation/views/splash_screen.dart';

abstract class AppRouter {
  static const String homeViewPath = '/homeView';
  static const String bookDeatilsViewPath = '/bookDetails';
  static const String searchPath = '/search';
  static final router = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: searchPath,
      builder: (context, state) => const SearchView(),
    ),
    GoRoute(
      path: homeViewPath,
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: bookDeatilsViewPath,
      builder: (context, state) =>  BlocProvider(
        create: (context) => SimilarBooksCubit(getIt.get<HomeRepoImplementation>()),
        child: BookDetailsView(
       bookModel:   state.extra as BookModel
        ),
      ),
    ),
  ]);
}
