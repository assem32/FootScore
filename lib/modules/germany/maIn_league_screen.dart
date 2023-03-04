import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socre/modules/germany/top_scorer.dart';
import 'package:socre/modules/germany/standing.dart';
import 'package:socre/modules/germany/cubit/cubit.dart';
import 'package:socre/modules/germany/cubit/state.dart';
import 'package:socre/modules/germany/fixture.dart';

import 'package:socre/modules/league_page.dart';
import 'package:socre/shared/component/component.dart';

class MainLeaguePage extends StatelessWidget {
  const MainLeaguePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>GermanyCubit()..getFixture(leagueCode)..getTopScorerGermany(leagueCode)..getStanding(leagueCode),
      child: BlocConsumer<GermanyCubit,GermanyState>(
        listener: (context,state){},
        builder: (context,state){
          return  DefaultTabController(length: 3, child: Scaffold(
            body: SafeArea(
              child: Column(

                children: [
                  leagueTitle(colorCode: leagueColor,countryName: '$leagueCountry',leagueName: '$leagueName',image: '$leagueImage'),
                  Material(
                    color: Color(leagueColor),
                    child: TabBar(

                        tabs:[
                          Tab(
                            child: Text('Standing'),
                          ),Tab(
                            child: Text('Fixtuer'),
                          ),Tab(
                            child: Text('Top Scorer'),
                          )
                        ]
                    ),
                  ),
                  Expanded(
                    child: TabBarView(children: [
                      Standing(),
                      Fixture(),
                      TopScorer()
                    ]),
                  )
                ],
              ),
            ),
          ));
        },
      ),
    );
  }
}
