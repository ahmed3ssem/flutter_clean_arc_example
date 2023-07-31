import 'package:flutter_clean_arc_example/core/api/api_consumer.dart';
import 'package:flutter_clean_arc_example/core/api/end_points.dart';
import 'package:flutter_clean_arc_example/features/random_quote/data/models/quote_model.dart';

abstract class RandomQuoteRemoteDataSource{

  Future<QuoteModel> getRandomQuote();
}

class RandomQuoteRemoteDataSourceImpl implements RandomQuoteRemoteDataSource{
  ApiConsumer consumer;

  RandomQuoteRemoteDataSourceImpl({required this.consumer});
  @override
  Future<QuoteModel> getRandomQuote() async{
    final res = await consumer.get(EndPoints.randomQuote);
    return QuoteModel.fromJson(res[1]);
  }

}
