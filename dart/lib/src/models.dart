/// Response models for the County Data Lookup API.

/// API Response wrapper.
class CountydataResponse {
  final String status;
  final dynamic error;
  final CountydataData? data;

  /// Set only when the current plan locks one or more fields; null otherwise.
  final PremiumInfo? premium;

  CountydataResponse({
    required this.status,
    this.error,
    this.data,
    this.premium,
  });

  factory CountydataResponse.fromJson(Map<String, dynamic> json) => CountydataResponse(
    status: json['status'] as String? ?? '',
    error: json['error'],
    data: json['data'] != null ? CountydataData.fromJson(json['data']) : null,
    premium: json['premium'] != null ? PremiumInfo.fromJson(json['premium']) : null,
  );

  Map<String, dynamic> toJson() => {
    'status': status,
    if (error != null) 'error': error,
    if (data != null) 'data': data,
    if (premium != null) 'premium': premium!.toJson(),
  };
}

/// Describes fields the current plan does not unlock. Locked fields arrive as null
/// in [data], and [lockedFields] names them (nested ones use dot paths).
class PremiumInfo {
  final String? message;
  final String? upgradeUrl;
  final List<String>? lockedFields;

  PremiumInfo({this.message, this.upgradeUrl, this.lockedFields});

  factory PremiumInfo.fromJson(Map<String, dynamic> json) => PremiumInfo(
    message: json['message'] as String?,
    upgradeUrl: json['upgrade_url'] as String?,
    lockedFields: (json['locked_fields'] as List?)?.map((e) => e.toString()).toList(),
  );

  Map<String, dynamic> toJson() => {
    if (message != null) 'message': message,
    if (upgradeUrl != null) 'upgrade_url': upgradeUrl,
    if (lockedFields != null) 'locked_fields': lockedFields,
  };
}

/// Response data for the County Data Lookup API.

class CountydataData {
  String? name;
  String? state;
  CountydataDataAge? age;
  num? male;
  num? female;
  CountydataDataHealth? health;
  num? longitude;
  num? latitude;
  CountydataDataEducation? education;
  List<String>? zipcodes;
  num? lifeexpectancy;
  num? avgincome;
  num? povertyrate;
  CountydataDataCostofliving? costofliving;
  num? landareakm2;
  num? areakm2;

  CountydataData({
    this.name,
    this.state,
    this.age,
    this.male,
    this.female,
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
  num? 0-4;
  num? 5-9;
  num? 10-14;
  num? 15-19;
  num? 20-24;
  num? 25-29;
  num? 30-34;
  num? 35-39;
  num? 40-44;
  num? 45-49;
  num? 50-54;
  num? 55-59;
  num? 60-64;
  num? 65-69;
  num? 70-74;
  num? 75-79;
  num? 80-84;
  num? 85+;

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

class CountydataDataHealth {
  num? poorhealth;
  num? physicallyunhealthydays;
  num? mentallyunhealthydays;
  num? lowbirthweightpercent;
  num? smokerspercent;
  num? obesitypercent;
  num? foodenvindex;
  num? physicallyinactivepercent;
  num? excessivedrinkingpercent;
  num? alcoholimpaireddrivingdeaths;
  num? teenbirthrate;
  num? uninsured;
  num? withannualmammogram;
  num? vaccinated;
  num? childreninpoverty;
  num? 80thpercentileincome;
  num? 20thpercentileincome;
  num? childreninsingleparenthouseholds;
  num? violentcrimerate;
  num? averagedailypm25;
  num? severehousingproblems;
  num? drivealonetowork;
  num? longcommutedrivesalone;

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
  num? lessthanhighschool;
  num? highschool;
  num? somecollege;
  num? bachelors;

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
  num? livingwage;
  num? foodcosts;
  num? medicalcosts;
  num? housingcosts;
  num? taxcosts;

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
