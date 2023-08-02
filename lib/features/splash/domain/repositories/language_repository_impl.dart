import 'package:dartz/dartz.dart';
import 'package:flutter_clean_arc_example/core/error/exceptions.dart';
import 'package:flutter_clean_arc_example/core/error/failures.dart';
import 'package:flutter_clean_arc_example/features/splash/data/datasources/language_local_datasource.dart';
import 'package:flutter_clean_arc_example/features/splash/domain/repositories/language_repository.dart';

class LanguageRepositoryImpl implements LanguageRepository{
  final LanguageLocalDataSource localDataSource;

  LanguageRepositoryImpl({required this.localDataSource});


  @override
  Future<Either<Failures, bool>> changeLang({required String languageCode}) async{
    try{
      return Right(await localDataSource.changeLang(languageCode: languageCode));
    }on CacheException{
      return Left(CashFailure());
    }
  }

  @override
  Future<Either<Failures, String?>> getSavedLanguage() async{
    try{
      return Right(await localDataSource.getSavedLanguage());
    }on CacheException{
      return Left(CashFailure());
    }
  }

}