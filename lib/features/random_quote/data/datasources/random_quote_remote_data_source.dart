import 'dart:convert';
import 'package:flutter_clean_arc_example/core/api/end_points.dart';
import 'package:flutter_clean_arc_example/core/error/exceptions.dart';
import 'package:flutter_clean_arc_example/features/random_quote/data/models/quote_model.dart';
import 'package:http/http.dart' as http;

abstract class RandomQuoteRemoteDataSource{

  Future<QuoteModel> getRandomQuote();
}

class RandomQuoteRemoteDataSourceImpl implements RandomQuoteRemoteDataSource{
  http.Client client;

  RandomQuoteRemoteDataSourceImpl(this.client);
  @override
  Future<QuoteModel> getRandomQuote() async{
    final remoteQuoteUrl = Uri.parse(EndPoints.baseUrl+EndPoints.randomQuote);
    final res = await client.get(remoteQuoteUrl);
    if(res.statusCode == 200){
      return QuoteModel.fromJson(jsonDecode(res.body)[1]);
    } else {
      throw ServerException();
    }
  }

}
