import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socre/modules/germany/cubit/state.dart';
import 'package:socre/shared/network/dio.dart';

class GermanyCubit extends Cubit<GermanyState> {
  GermanyCubit() : super(GermanyInitialState());

  static GermanyCubit get(context) => BlocProvider.of(context);


  List<dynamic> stand = [];
  Map<String, dynamic> stand1 = {};


  var leagueCode;

  void getStanding(leagueCode) {
    DioHelper.getData(url: 'football', query: {
      'met': 'Standings',
      'leagueId': '$leagueCode',
      'APIkey':
      '97b7020d5605cfc3dbcc1c8a83ad561af94810aa7c0a1b93f3e51a06135f04fd',
    }).then((value) {
      stand = value.data['result']['total'];

      // for(int i=0;i<league.length;i++){
      //   if(league[i]['league_name']=='Serie A')
      //     {
      //       league1=league[i];
      //       print(league1);
      //     }
      // }
      emit(GetGermanyStandingState());
    }).catchError((error) {
      print(error.toString());
    });
  }

  List<dynamic>topScore = [];

  void getTopScorerGermany(leagueCode) {
    DioHelper.getData(url: 'football', query: {
      'met': 'Topscorers',
      'leagueId': '$leagueCode',
      'APIkey': '97b7020d5605cfc3dbcc1c8a83ad561af94810aa7c0a1b93f3e51a06135f04fd'
    }).then((value) {
      topScore = value.data['result'];
      emit(GetGermanyScorerState());
    }).catchError((error) {
      print(error);
    });
  }

  DateTime now= new DateTime.now();
  var year;
  var month;
  var monthS;
  var monthE;
  var dayfrom;
  var dayto;
  var dateS;
  var dateE;
  void getdate(){
    month=now.month;
    year=now.year;
    if(month==1 ||month==3 ||month==5 ||month==7 ||month==8 ||month==10 ||month==12)
    {
      if(now.day>=8&&now.day<25){
        dayfrom=now.day-7;
        dayto=now.day+7;
        monthE=now.month;
        monthS=now.month;


      }
      else if(now.day<8){
        if(month==1)
        {
          dayfrom=now.day+24;
          dayto=now.day+7;
          month=12;
          year=now.year-1;
        }
        else {
          dayfrom = now.day + 23;
          monthS=now.month-1;
          monthE=now.month;
          dayto=now.day+7;
        }
      }
      else if(now.day>24)
      {
        if(month==12){
          monthE=1;
          year=now.year+1;
          dayto=now.day-24;
          dayfrom=now.day-7;
          monthS=now.month;

        }
        else {
          dayto = now.day - 24;
          dayfrom=now.day-7;
          monthE=now.month+1;
          monthS=now.month;
        }
      }
    }
    if(month==4||month==6||month==9||month==11)
    {
      if(now.day>=8&&now.day<25){
        dayfrom=now.day-7;
        dayto=now.day+7;
        monthE=now.month;
        monthS=now.month;
      }
      if(now.day<8) {
        dayfrom = now.day - 24;
        dayto=now.day+7;
        monthS=now.month-1;
        monthE=now.month;
      } else if(now.day>23) {
        dayto = now.day - 23;
        dayfrom=now.day-7;
        monthE=month+1;
        monthS=now.month;
      }
    }
    if(month==2)
    {
      if(now.day>=8&&now.day<21){
        dayfrom=now.day-7;
        dayto=now.day+7;
        monthE=now.month;
        monthS=now.month;
      }
      if(now.day<8) {
        dayfrom = now.day - 24;
        dayto=now.day+7;
        monthS=now.month-1;
        monthE=now.month;
      } else if( now.day>21) {
        dayto = now.day - 20;
        dayfrom=now.day-7;
        monthE=month+1;
        monthS=now.month;
      }
    }
    dateS='$year-$monthS-$dayfrom';
    dateE='$year-$monthE-$dayto';
    print(dateS);
    print(dateE);


  }

  List<dynamic> fixture=[];
  List<dynamic> germanyFix=[];
  void getFixture(leagueCode) {
    getdate();
    DioHelper.getData(url: 'football',
        query: {
          'met': 'Fixtures',
          'APIkey': '97b7020d5605cfc3dbcc1c8a83ad561af94810aa7c0a1b93f3e51a06135f04fd',
          'from': '$dateS',
          'to': '$dateE'
        }).then((value) {
      fixture=value.data['result'];
      for(int i=0;i<fixture.length;i++){
        if(fixture[i]['league_key']==leagueCode)
        {
          germanyFix.add(fixture[i]);
        }
      }
      // print(fixture)
      emit(GetGermanyFixtureSuccessStates());
    }).catchError((error){
      print(error.toString());
      emit(GetGermanyFixtureErrorStates());
    });
  }

}
