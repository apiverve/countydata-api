/// Response models for the County Data Lookup API.

/// API Response wrapper.
class CountydataResponse {
  final String status;
  final dynamic error;
  final CountydataData? data;

  CountydataResponse({
    required this.status,
    this.error,
    this.data,
  });

  factory CountydataResponse.fromJson(Map<String, dynamic> json) => CountydataResponse(
    status: json['status'] as String? ?? '',
    error: json['error'],
    data: json['data'] != null ? CountydataData.fromJson(json['data']) : null,
  );

  Map<String, dynamic> toJson() => {
    'status': status,
    if (error != null) 'error': error,
    if (data != null) 'data': data,
  };
}

/// Response data for the County Data Lookup API.

class CountydataData {
  String? name;
  String? state;
  CountydataDataAge? age;
  int? male;
  int? female;
  CountydataDataDeaths? deaths;
  CountydataDataHealth? health;
  double? longitude;
  double? latitude;
  CountydataDataEducation? education;
  List<String>? zipcodes;
  double? lifeexpectancy;
  int? avgincome;
  double? povertyrate;
  CountydataDataCostofliving? costofliving;
  double? landareakm2;
  double? areakm2;

  CountydataData({
    this.name,
    this.state,
    this.age,
    this.male,
    this.female,
    this.deaths,
    this.health,
    this.longitude,
    this.latitude,
    this.education,
    this.zipcodes,
    this.lifeexpectancy,
    this.avgincome,
    this.povertyrate,
    this.costofliving,
    this.landareakm2,
    this.areakm2,
  });

  factory CountydataData.fromJson(Map<String, dynamic> json) => CountydataData(
      name: json['name'],
      state: json['state'],
      age: json['age'] != null ? CountydataDataAge.fromJson(json['age']) : null,
      male: json['male'],
      female: json['female'],
      deaths: json['deaths'] != null ? CountydataDataDeaths.fromJson(json['deaths']) : null,
      health: json['health'] != null ? CountydataDataHealth.fromJson(json['health']) : null,
      longitude: json['longitude'],
      latitude: json['latitude'],
      education: json['education'] != null ? CountydataDataEducation.fromJson(json['education']) : null,
      zipcodes: (json['zipcodes'] as List?)?.cast<String>(),
      lifeexpectancy: json['lifeexpectancy'],
      avgincome: json['avgincome'],
      povertyrate: json['povertyrate'],
      costofliving: json['costofliving'] != null ? CountydataDataCostofliving.fromJson(json['costofliving']) : null,
      landareakm2: json['landareakm2'],
      areakm2: json['areakm2'],
    );
}

class CountydataDataAge {
  double? 0-4;
  double? 5-9;
  double? 10-14;
  double? 15-19;
  double? 20-24;
  double? 25-29;
  double? 30-34;
  double? 35-39;
  double? 40-44;
  double? 45-49;
  double? 50-54;
  double? 55-59;
  double? 60-64;
  double? 65-69;
  double? 70-74;
  double? 75-79;
  double? 80-84;
  double? 85+;

  CountydataDataAge({
    this.0-4,
    this.5-9,
    this.10-14,
    this.15-19,
    this.20-24,
    this.25-29,
    this.30-34,
    this.35-39,
    this.40-44,
    this.45-49,
    this.50-54,
    this.55-59,
    this.60-64,
    this.65-69,
    this.70-74,
    this.75-79,
    this.80-84,
    this.85+,
  });

  factory CountydataDataAge.fromJson(Map<String, dynamic> json) => CountydataDataAge(
      0-4: json['0-4'],
      5-9: json['5-9'],
      10-14: json['10-14'],
      15-19: json['15-19'],
      20-24: json['20-24'],
      25-29: json['25-29'],
      30-34: json['30-34'],
      35-39: json['35-39'],
      40-44: json['40-44'],
      45-49: json['45-49'],
      50-54: json['50-54'],
      55-59: json['55-59'],
      60-64: json['60-64'],
      65-69: json['65-69'],
      70-74: json['70-74'],
      75-79: json['75-79'],
      80-84: json['80-84'],
      85+: json['85+'],
    );
}

class CountydataDataDeaths {
  double? suicides;
  double? homicides;
  int? vehicle;
  double? firearmsuicides;

  CountydataDataDeaths({
    this.suicides,
    this.homicides,
    this.vehicle,
    this.firearmsuicides,
  });

  factory CountydataDataDeaths.fromJson(Map<String, dynamic> json) => CountydataDataDeaths(
      suicides: json['suicides'],
      homicides: json['homicides'],
      vehicle: json['vehicle'],
      firearmsuicides: json['firearmsuicides'],
    );
}

class CountydataDataHealth {
  double? poorhealth;
  double? physicallyunhealthydays;
  double? mentallyunhealthydays;
  double? lowbirthweightpercent;
  double? smokerspercent;
  double? obesitypercent;
  double? foodenvindex;
  double? physicallyinactivepercent;
  double? excessivedrinkingpercent;
  int? alcoholimpaireddrivingdeaths;
  double? teenbirthrate;
  double? uninsured;
  int? withannualmammogram;
  int? vaccinated;
  double? childreninpoverty;
  int? 80thpercentileincome;
  int? 20thpercentileincome;
  double? childreninsingleparenthouseholds;
  double? violentcrimerate;
  double? averagedailypm25;
  double? severehousingproblems;
  double? drivealonetowork;
  double? longcommutedrivesalone;

  CountydataDataHealth({
    this.poorhealth,
    this.physicallyunhealthydays,
    this.mentallyunhealthydays,
    this.lowbirthweightpercent,
    this.smokerspercent,
    this.obesitypercent,
    this.foodenvindex,
    this.physicallyinactivepercent,
    this.excessivedrinkingpercent,
    this.alcoholimpaireddrivingdeaths,
    this.teenbirthrate,
    this.uninsured,
    this.withannualmammogram,
    this.vaccinated,
    this.childreninpoverty,
    this.80thpercentileincome,
    this.20thpercentileincome,
    this.childreninsingleparenthouseholds,
    this.violentcrimerate,
    this.averagedailypm25,
    this.severehousingproblems,
    this.drivealonetowork,
    this.longcommutedrivesalone,
  });

  factory CountydataDataHealth.fromJson(Map<String, dynamic> json) => CountydataDataHealth(
      poorhealth: json['poorhealth'],
      physicallyunhealthydays: json['physicallyunhealthydays'],
      mentallyunhealthydays: json['mentallyunhealthydays'],
      lowbirthweightpercent: json['lowbirthweightpercent'],
      smokerspercent: json['smokerspercent'],
      obesitypercent: json['obesitypercent'],
      foodenvindex: json['foodenvindex'],
      physicallyinactivepercent: json['physicallyinactivepercent'],
      excessivedrinkingpercent: json['excessivedrinkingpercent'],
      alcoholimpaireddrivingdeaths: json['alcoholimpaireddrivingdeaths'],
      teenbirthrate: json['teenbirthrate'],
      uninsured: json['uninsured'],
      withannualmammogram: json['withannualmammogram'],
      vaccinated: json['vaccinated'],
      childreninpoverty: json['childreninpoverty'],
      80thpercentileincome: json['80thpercentileincome'],
      20thpercentileincome: json['20thpercentileincome'],
      childreninsingleparenthouseholds: json['childreninsingleparenthouseholds'],
      violentcrimerate: json['violentcrimerate'],
      averagedailypm25: json['averagedailypm25'],
      severehousingproblems: json['severehousingproblems'],
      drivealonetowork: json['drivealonetowork'],
      longcommutedrivesalone: json['longcommutedrivesalone'],
    );
}

class CountydataDataEducation {
  double? lessthanhighschool;
  double? highschool;
  double? somecollege;
  double? bachelors;

  CountydataDataEducation({
    this.lessthanhighschool,
    this.highschool,
    this.somecollege,
    this.bachelors,
  });

  factory CountydataDataEducation.fromJson(Map<String, dynamic> json) => CountydataDataEducation(
      lessthanhighschool: json['lessthanhighschool'],
      highschool: json['highschool'],
      somecollege: json['somecollege'],
      bachelors: json['bachelors'],
    );
}

class CountydataDataCostofliving {
  double? livingwage;
  int? foodcosts;
  int? medicalcosts;
  int? housingcosts;
  int? taxcosts;

  CountydataDataCostofliving({
    this.livingwage,
    this.foodcosts,
    this.medicalcosts,
    this.housingcosts,
    this.taxcosts,
  });

  factory CountydataDataCostofliving.fromJson(Map<String, dynamic> json) => CountydataDataCostofliving(
      livingwage: json['livingwage'],
      foodcosts: json['foodcosts'],
      medicalcosts: json['medicalcosts'],
      housingcosts: json['housingcosts'],
      taxcosts: json['taxcosts'],
    );
}

class CountydataRequest {
  String state;
  String county;

  CountydataRequest({
    required this.state,
    required this.county,
  });

  Map<String, dynamic> toJson() => {
      'state': state,
      'county': county,
    };
}
