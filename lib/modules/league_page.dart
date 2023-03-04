import 'package:flutter/material.dart';
import 'package:socre/modules/germany/maIn_league_screen.dart';
import 'package:socre/shared/component/component.dart';

var leagueCode;
var leagueName;
var leagueCountry;
var leagueImage;
var leagueColor;

class LeaguesPage extends StatelessWidget {
  const LeaguesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        elevation: 0,
        title: Center(child: Text('Commpetitions',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  leagueItem('assets/premier-league-2-logo.png',(){
                    leagueCode=152;
                    leagueName='Premier League';
                    leagueCountry='England';
                    leagueImage='assets/english.png';
                    leagueColor=0xff3d195b;
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>MainLeaguePage()));
                  }),
                  leagueItem('assets/laliga-logo.png',(){
                    leagueCode=302;
                    leagueName='La Liga';
                    leagueCountry='Spain';
                    leagueImage='assets/laliga-logo.png';
                    leagueColor=0xff0c519c;

                    Navigator.push(context, MaterialPageRoute(builder: (context)=>MainLeaguePage()));

                  })

                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  leagueItem('assets/bundesliga-logo.png',(){
                    leagueCode=175;
                    leagueName='Bundesliga';
                    leagueCountry='Germany';
                    leagueImage='assets/bundesliga-logo.png';
                    leagueColor=0xffd20515;

                    Navigator.push(context, MaterialPageRoute(builder: (context)=>MainLeaguePage()));

                  }),
                  leagueItem('assets/serie-a-logo.png',(){
                    leagueCode=207;
                    leagueName='Serie-A';
                    leagueCountry='Italy';
                    leagueImage='assets/serie-a-logo.png';
                    leagueColor=0xff024494;

                    Navigator.push(context, MaterialPageRoute(builder: (context)=>MainLeaguePage()));

                  }),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  leagueItem('assets/ligue-1-logo.png',(){
                    leagueCode=168;
                    leagueName='Ligue 1';
                    leagueCountry='France';
                    leagueImage='assets/ligue-1-logo.png';
                    leagueColor=0xff12233f;

                    Navigator.push(context, MaterialPageRoute(builder: (context)=>MainLeaguePage()));

                  }),
                  leagueItem('assets/egy.png',
                          (){
                        leagueCode=141;
                        leagueName='Egyptian Premire League';
                        leagueCountry='Egypt';
                        leagueImage='assets/egy.png';
                        leagueColor=0xff66c0b6;
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>MainLeaguePage()));

                          }),
                ],
              ),
            ),

            // MaterialButton(onPressed: (){
            //   leagueCode=207;
            //   Navigator.push(context, MaterialPageRoute(builder: (context)=>MainGermanyPage()));
            // },child: Text('italy'),),
            // MaterialButton(onPressed: (){
            //   leagueCode=175;
            //   Navigator.push(context, MaterialPageRoute(builder: (context)=>MainGermanyPage()));
            //
            // },child: Text('germany'),),
          ],
        ),
      ),
    );
  }
}
