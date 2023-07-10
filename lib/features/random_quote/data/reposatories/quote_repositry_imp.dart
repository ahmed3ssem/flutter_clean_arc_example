import 'package:dartz/dartz.dart';
import 'package:flutter_clean_arc_example/core/error/exceptions.dart';
import 'package:flutter_clean_arc_example/core/error/failures.dart';
import 'package:flutter_clean_arc_example/core/network/network_info.dart';
import 'package:flutter_clean_arc_example/features/random_quote/data/datasources/random_quote_local_data.dart';
import 'package:flutter_clean_arc_example/features/random_quote/data/datasources/random_quote_remote_data_source.dart';
import 'package:flutter_clean_arc_example/features/random_quote/domain/entities/quate.dart';
import 'package:flutter_clean_arc_example/features/random_quote/domain/reposatories/quote_repo.dart';

class QuoteRepositoryImpl implements QuoteRepository{
  final NetworkInfo networkInfo;
  final RandomQuoteRemoteDataSource remoteDataSource;
  final RandomQuoteLocalDataSource localDataSource;

  QuoteRepositoryImpl({required this.networkInfo , required this.remoteDataSource , required this.localDataSource});

  @override
  Future<Either<Failures, Quote>> getRandomQuote() async{
    if(await networkInfo.isConnected){
      try{
        final remoteQuote = await remoteDataSource.getRandomQuote();
        localDataSource.cacheQuote(remoteQuote);
        return Right(remoteQuote);
      } on ServerException{
        return Left(ServerFailure());
      }
    }
    else {
      try{
        final cacheQuote = await localDataSource.getLastRandomQuote();
        return Right(cacheQuote);
      } on CacheException{
        return Left(CashFailure());
      }
    }
  }

}