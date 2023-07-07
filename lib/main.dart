import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/utls/api_dio_services.dart';
import 'package:bookly_app/core/utls/app_router.dart';
import 'package:bookly_app/core/utls/service_locator.dart';
import 'package:bookly_app/features/home/data/repo/home_repo_implementation.dart';
import 'package:bookly_app/features/home/presentation/view_models/newest_books/newest_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/view_models/recommended_books/recommended_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/view_models/similar_books/similar_books_cubit.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  setupServiceLocator();
  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => RecommendedBooksCubit(
           getIt.get<HomeRepoImplementation>()
          )..fetchRecommendedBooks(),
        ),
        BlocProvider(
          create: (context) => NewestBooksCubit(
           getIt.get<HomeRepoImplementation>()
          )..fetchNewestBooks() ,
        ),
       
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        theme: ThemeData.dark().copyWith(
            textTheme:
                GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
            scaffoldBackgroundColor: bkgCLr),
      ),
    );
  }
}
