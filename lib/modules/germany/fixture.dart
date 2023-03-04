import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socre/modules/germany/cubit/cubit.dart';
import 'package:socre/modules/germany/cubit/state.dart';
import 'package:socre/modules/league_page.dart';
import 'package:socre/shared/component/component.dart';

class Fixture extends StatelessWidget {
  const Fixture({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GermanyCubit,GermanyState>(
      listener: (context,state){},
      builder: (context,state){
        
        return Scaffold(
          backgroundColor: Colors.grey[300],
          body: GermanyCubit.get(context).germanyFix.length==0?Center(child: CircularProgressIndicator(color: Color(leagueColor),)):Column(
            children: [
              Expanded(child: ListView.separated(itemBuilder: (context,index)=>matchItem(GermanyCubit.get(context).germanyFix[index]), separatorBuilder:(context,index)=> SizedBox(height: 0,), itemCount: GermanyCubit.get(context).germanyFix.length))
            ],
          ),
        );
      },
    );
  }
}
