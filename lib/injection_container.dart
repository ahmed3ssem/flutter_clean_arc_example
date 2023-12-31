import 'package:dio/dio.dart';
import 'package:flutter_clean_arc_example/core/api/api_consumer.dart';
import 'package:flutter_clean_arc_example/core/api/app_interceptor.dart';
import 'package:flutter_clean_arc_example/core/api/dio_consumer.dart';
import 'package:flutter_clean_arc_example/core/network/network_info.dart';
import 'package:flutter_clean_arc_example/features/random_quote/data/datasources/random_quote_local_data.dart';
import 'package:flutter_clean_arc_example/features/random_quote/data/datasources/random_quote_remote_data_source.dart';
import 'package:flutter_clean_arc_example/features/random_quote/data/reposatories/quote_repositry_imp.dart';
import 'package:flutter_clean_arc_example/features/random_quote/domain/reposatories/quote_repo.dart';
import 'package:flutter_clean_arc_example/features/random_quote/domain/usecases/get_random_quote.dart';
import 'package:flutter_clean_arc_example/features/random_quote/presentation/cubit/random_quote_cubit.dart';
import 'package:flutter_clean_arc_example/features/splash/data/datasources/language_local_datasource.dart';
import 'package:flutter_clean_arc_example/features/splash/domain/repositories/language_repository.dart';
import 'package:flutter_clean_arc_example/features/splash/domain/repositories/language_repository_impl.dart';
import 'package:flutter_clean_arc_example/features/splash/domain/usecases/change_language.dart';
import 'package:flutter_clean_arc_example/features/splash/domain/usecases/get_saved_lang.dart';
import 'package:flutter_clean_arc_example/features/splash/presentation/cubit/local_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';


final sl = GetIt.instance;

Future<void> init() async {
  //!Features
  //Blocs
  sl.registerFactory(() => RandomQuoteCubit(getRandomQuoteUseCase: sl()));
  sl.registerFactory<LocalCubit>(() => LocalCubit(savedLanguageUseCase: sl() , changeLanguageUseCase: sl()));

  //UserCases
  sl.registerLazySingleton(() => GetRandomQuote(quoteRepo: sl()));
  sl.registerLazySingleton<ChangeLanguageUseCase>(() => ChangeLanguageUseCase(repository: sl()));
  sl.registerLazySingleton<GetSavedLanguageUseCase>(() => GetSavedLanguageUseCase(repository: sl()));

  //Repository
  sl.registerLazySingleton<QuoteRepository>(() => QuoteRepositoryImpl(networkInfo: sl(), remoteDataSource: sl(), localDataSource: sl()));
  sl.registerLazySingleton<LanguageRepository>(() => LanguageRepositoryImpl(localDataSource: sl()));

  //Data Source
  sl.registerLazySingleton<RandomQuoteLocalDataSource>(() => RandomQuoteLocalDataSourceImpl(sl()));
  sl.registerLazySingleton<RandomQuoteRemoteDataSource>(() => RandomQuoteRemoteDataSourceImpl(consumer: sl()));
  sl.registerLazySingleton<LanguageLocalDataSource>(() => LanguageLocalDataSourceImpl(sharedPreferences: sl()));

  //core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
  sl.registerLazySingleton<ApiConsumer>(() => DioConsumer(client: sl()));

  //External
  final sharedPreference = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => AppInterceptor());
  sl.registerLazySingleton(() => LogInterceptor(
    error: true,
    request: true,
    requestBody: true,
    requestHeader: true,
    responseBody: true,
    responseHeader: true
  ));
  sl.registerLazySingleton(() => sharedPreference);
  sl.registerLazySingleton(() => InternetConnectionChecker());
  sl.registerLazySingleton(() => Dio());
}