import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socre/modules/germany/cubit/cubit.dart';
import 'package:socre/modules/germany/cubit/state.dart';
import 'package:socre/modules/league_page.dart';
import 'package:socre/shared/component/component.dart';

class Standing extends StatelessWidget {
  const Standing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GermanyCubit, GermanyState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                // CircleAvatar(
                //   // backgroundImage: NetworkImage('${NewsCubit.get(context).country}'),
                // ),
                // Center(
                //   child: MaterialButton(onPressed: (){
                //     NewsCubit.get(context).getStanding();
                //     },child: Text('click me')),
                // ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('#'),

                      Expanded(
                          flex: 3,
                          child: Text('Team')),
                      Expanded(
                        flex: 2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text('PL',),

                            Text('W'),

                            Text('D'),

                            Text('L'),

                            Text('Pt'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16,),
                GermanyCubit.get(context).stand.length==0?Center(child: CircularProgressIndicator(color: Color(leagueColor),)):
                Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: ListView.separated(
                          itemBuilder: (context, index) =>
                              standingItem(GermanyCubit.get(context).stand[index]),
                          separatorBuilder: (context, index) => SizedBox(
                                height: 16,
                              ),
                          itemCount: GermanyCubit.get(context).stand.length),
                    ))
              ],
            ),
          ),
        );
      },
    );
  }
}
