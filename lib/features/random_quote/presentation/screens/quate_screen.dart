import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_arc_example/config/local/app_localizations.dart';
import 'package:flutter_clean_arc_example/core/utils/app_colors.dart';
import 'package:flutter_clean_arc_example/core/widgets/error_widget.dart';
import 'package:flutter_clean_arc_example/features/random_quote/presentation/cubit/random_quote_cubit.dart';
import 'package:flutter_clean_arc_example/features/random_quote/presentation/cubit/random_quote_state.dart';
import 'package:flutter_clean_arc_example/features/random_quote/presentation/widgets/quate_content.dart';
import 'package:flutter_clean_arc_example/features/splash/presentation/cubit/local_cubit.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class QuateScreen extends StatefulWidget {
  const QuateScreen({super.key});

  @override
  State<QuateScreen> createState() => _QuateScreenState();
}

class _QuateScreenState extends State<QuateScreen> {

  Widget buildBodyContent(){
    return BlocBuilder<RandomQuoteCubit , RandomQuoteState>(builder: (context , state){
      if(state is RandomQuoteIsLoading){
        return Center(
          child: SpinKitFadingCircle(
            color: AppColors.primary,
          ),
        );
      } else if(state is RandomQuoteError){
        return ErrorrWidget(onTap: (){});
      } else if(state is RandomQuoteLoaded){
        return Column(
          children: [
            QuateContent(quote: state.quote),
            InkWell(
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 15),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.primary
                ),
                child: const Icon(Icons.refresh , size: 28 , color: Colors.white,),
              ),
              onTap: ()=>getData(),
            )
          ],
        );
      } else {
        return Center(
          child: SpinKitFadingCircle(
            color: AppColors.primary,
          ),
        );
      }
    });
  }

  getData() =>BlocProvider.of<RandomQuoteCubit>(context).getRandomQuote();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(child: Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.translate('app_name')!),
        leading: IconButton(
          icon: Icon(Icons.translate_outlined , color: AppColors.primary,),
          onPressed: () {
            if (AppLocalizations.of(context)!.isEnLocale) {
              BlocProvider.of<LocalCubit>(context).toArabic();
              debugPrint('Hadeer');
            } else {
              BlocProvider.of<LocalCubit>(context).toEnglish();
            }}
        )
      ),
      body: buildBodyContent(),
    ), onRefresh: ()=>getData());
  }
}
