import 'package:dartz/dartz.dart';
import 'package:flutter_clean_arc_example/core/error/failures.dart';
import 'package:flutter_clean_arc_example/core/usecase/usecase.dart';
import 'package:flutter_clean_arc_example/features/splash/domain/repositories/language_repository.dart';

class GetSavedLanguageUseCase implements UseCase<String? , NoParams>{
  final LanguageRepository repository;

  GetSavedLanguageUseCase({required this.repository});


  @override
  Future<Either<Failures, String?>> call(NoParams params) async => await repository.getSavedLanguage();

}