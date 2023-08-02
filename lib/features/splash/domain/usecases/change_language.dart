import 'package:dartz/dartz.dart';
import 'package:flutter_clean_arc_example/core/error/failures.dart';
import 'package:flutter_clean_arc_example/core/usecase/usecase.dart';
import 'package:flutter_clean_arc_example/features/splash/domain/repositories/language_repository.dart';

class ChangeLanguageUseCase implements UseCase<bool , String>{
  final LanguageRepository repository;

  ChangeLanguageUseCase({required this.repository});


  @override
  Future<Either<Failures, bool>> call(String languageCode) async => await repository.changeLang(languageCode: languageCode);

}