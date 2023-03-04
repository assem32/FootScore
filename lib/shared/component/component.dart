import 'package:flutter/material.dart';

Widget standingItem(model) => Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text('${model['standing_place']}-'),
        Expanded(flex: 3, child: Text('${model['standing_team']}')),
        Expanded(
          flex: 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text('${model['standing_P']}'),
              Text('${model['standing_W']}'),
              Text('${model['standing_D']}'),
              Text('${model['standing_L']}'),
              Text('${model['standing_PTS']}'),
            ],
          ),
        ),
      ],
    );

Widget leagueTitle({colorCode, image, leagueName, countryName}) => Container(
      color: Color(colorCode),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
                height: 105,
                width: leagueName == 'Bundesliga' ? 100 : 75,
                child: Image.asset(image)),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '$leagueName',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              Text(
                '$countryName',
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );

Widget scorerItem(model) => Container(
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(20),
    color: Colors.white
  ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          children: [
            Text('${model['player_place']}'),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Row(
                          children: [
                            Flexible(child: Text('${model['player_name']}')),
                          ],
                          mainAxisAlignment: MainAxisAlignment.start,
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(

                        flex: 4,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Flexible(

                                child: Text(
                              'Teams: ${model['team_name']}',
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.start,
                            )
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Text(
                    'Penalty: ${model['penalty_goals']}',
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              ),
            ),
            Text(
              'Goals: ${model['goals']}',
              textAlign: TextAlign.end,
            )
          ],
        ),
      ),
    );

Widget matchItem(model) => Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Colors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: Text(
                    '${model['event_home_team']}',
                    overflow: TextOverflow.clip,
                    maxLines: 1,
                    softWrap: false,
                    textAlign: TextAlign.end,
                  ),
                ),
              ],
            )),
            Container(
                width: 40,
                height: 40,
                child:
                    Image(image: NetworkImage('${model['home_team_logo']}'))),
            SizedBox(
              width: 4,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text('${model['event_date']}'),
                      model['event_ft_result'] == ''
                          ? Text('Didn\'t started')
                          : Text('${model['event_ft_result']}'),
                      Text('${model['event_time']}'),
                    ],
                  ),
                  SizedBox(
                    width: 4,
                  )
                ],
              ),
            ),
            SizedBox(
              width: 4,
            ),
            Container(
                width: 40,
                height: 40,
                child:
                    Image(image: NetworkImage('${model['away_team_logo']}'))),
            SizedBox(
              width: 4,
            ),
            Expanded(
                child: Text(
              '${model['event_away_team']}',
              overflow: TextOverflow.fade,
            ))
          ],
        ),
      ),
    );

Widget leagueItem(image, function) => Expanded(
      child: InkWell(
        onTap: () {
          function();
        },
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: Colors.white),
            child: Image.asset(image),
          ),
        ),
      ),
    );
