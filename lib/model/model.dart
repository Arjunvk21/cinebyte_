import 'dart:io';

class Scriptmodel {
  String? scriptname;
  String? scriptdescription;
  String? Scriptgenre;
  String? userid;
  DateTime? date;

  Scriptmodel(
      {required this.scriptname,
      required this.scriptdescription,
      required this.Scriptgenre,
      this.userid , this.date
  });

  Map<String, dynamic> tojson(id) => {
        'scriptname': scriptname,
        'scriptdescription': scriptdescription,
        'scriptge nre': Scriptgenre,
        'userid':userid,
        'date': date?.toIso8601String(),
      };
  factory Scriptmodel.fromData(Map<String, dynamic> i) {
    return Scriptmodel(
        scriptname: i['scriptname'],
        scriptdescription: i['scriptdescription'],
        Scriptgenre: i['scriptgenre'],
        userid: i['userid'],
         date: i['date'] != null ? DateTime.parse(i['date']) : null,);
  }
}

class Castingcallmodel {
  String? castingId;
  File? poster;
  Castingcallmodel({required this.castingId, required this.poster});
  Map<String, dynamic> tojson() => {
        'castingId': castingId,
        'poster': poster,
      };
  factory Castingcallmodel.fromData(Map<String, dynamic> i) {
    return Castingcallmodel(castingId: i['castingId'], poster: i['poster']);
  }
}
