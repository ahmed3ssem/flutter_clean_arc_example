import 'package:dartz/dartz.dart';
import 'package:flutter_clean_arc_example/core/error/failures.dart';
import 'package:flutter_clean_arc_example/features/random_quote/domain/entities/quate.dart';

abstract class QuoteRepository{

  Future<Either<Failures , Quote>> getRandomQuote();

}