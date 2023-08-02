import 'package:dartz/dartz.dart';
import 'package:flutter_clean_arc_example/core/error/failures.dart';

abstract class LanguageRepository{

  Future<Either<Failures , bool>> changeLang({required String languageCode});
  Future<Either<Failures , String?>> getSavedLanguage();
}