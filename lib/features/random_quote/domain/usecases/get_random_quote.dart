import 'package:dartz/dartz.dart';
import 'package:flutter_clean_arc_example/core/error/failures.dart';
import 'package:flutter_clean_arc_example/core/usecase/usecase.dart';
import 'package:flutter_clean_arc_example/features/random_quote/domain/reposatories/quote_repo.dart';

import '../entities/quate.dart';

class GetRandomQuote implements UseCase<Quote , NoParams>{
  final QuoteRepository quoteRepo;
  GetRandomQuote({required this.quoteRepo});
  @override
  Future<Either<Failures, Quote>> call(NoParams params)=>quoteRepo.getRandomQuote();
}

/*
   ///  Example for class with params
class LoginParams extends Equatable{
  final String userName;
  final String password;

  LoginParams({required this.userName,required this.password});

  @override
  List<Object?> get props => [userName , password];
}*/
