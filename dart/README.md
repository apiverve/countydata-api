# County Data Lookup API - Dart/Flutter Client

County Data is a simple tool for getting data about US counties. It returns information such as average income, area, and more based on the county name provided.

[![pub package](https://img.shields.io/pub/v/apiverve_countydata.svg)](https://pub.dev/packages/apiverve_countydata)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

This is the Dart/Flutter client for the [County Data Lookup API](https://apiverve.com/marketplace/countydata?utm_source=dart&utm_medium=readme).

## Installation

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  apiverve_countydata: ^1.1.14
```

Then run:

```bash
dart pub get
# or for Flutter
flutter pub get
```

## Usage

```dart
import 'package:apiverve_countydata/apiverve_countydata.dart';

void main() async {
  final client = CountydataClient('YOUR_API_KEY');

  try {
    final response = await client.execute({
      'state': 'MO',
      'county': 'Jackson'
    });

    print('Status: ${response.status}');
    print('Data: ${response.data}');
  } catch (e) {
    print('Error: $e');
  }
}
```

## Response

```json
{
  "status": "ok",
  "error": null,
  "data": {
    "name": "jackson county",
    "state": "MO",
    "age": {
      "0-4": 0.0644100874666257,
      "5-9": 0.06532756955438819,
      "10-14": 0.06595060390235714,
      "15-19": 0.05967616438434107,
      "20-24": 0.059725950234064615,
      "25-29": 0.08192474939936928,
      "30-34": 0.07523353119652466,
      "35-39": 0.06868029092005673,
      "40-44": 0.05831060964906666,
      "45-49": 0.058805623240603636,
      "50-54": 0.05858087569042305,
      "55-59": 0.0674783182624454,
      "60-64": 0.06208437705811146,
      "65-69": 0.05099777955110233,
      "70-74": 0.03891546504962227,
      "75-79": 0.026437708656052324,
      "80-84": 0.01748905778145719,
      "85+": 0.01997123800338828
    },
    "male": 339932,
    "female": 363079,
    "deaths": {
      "suicides": 106.71428571428571,
      "homicides": 115.42857142857143,
      "vehicle": 93,
      "firearmsuicides": 55.095238095238095
    },
    "health": {
      "poorhealth": 20.588989742,
      "physicallyunhealthydays": 4.247736361,
      "mentallyunhealthydays": 4.8111015035,
      "lowbirthweightpercent": 9.1518749808,
      "smokerspercent": 20.957241772,
      "obesitypercent": 31.5,
      "foodenvindex": 7.5,
      "physicallyinactivepercent": 23.2,
      "excessivedrinkingpercent": 18.940103365,
      "alcoholimpaireddrivingdeaths": 152,
      "teenbirthrate": 31.109351559,
      "uninsured": 12.486314662,
      "withannualmammogram": 45,
      "vaccinated": 51,
      "childreninpoverty": 19.6,
      "80thpercentileincome": 108296,
      "20thpercentileincome": 23275,
      "childreninsingleparenthouseholds": 33.224850811,
      "violentcrimerate": 941.43198334,
      "averagedailypm25": 9.1,
      "severehousingproblems": 15.347550638,
      "drivealonetowork": 83.470246386,
      "longcommutedrivesalone": 33.7
    },
    "longitude": -94.34749665503394,
    "latitude": 39.016701918102484,
    "education": {
      "lessthanhighschool": 9.4,
      "highschool": 28.3,
      "somecollege": 30.7,
      "bachelors": 31.6
    },
    "zipcodes": [
      "64137",
      "64111",
      "64053",
      "64055",
      "64064",
      "64029",
      "64106",
      "64108",
      "64034",
      "64118",
      "64136",
      "64139",
      "64125",
      "64030",
      "64014",
      "64066",
      "64080",
      "64123",
      "64131",
      "64145",
      "64128",
      "64121",
      "64170",
      "64050",
      "64057",
      "64133",
      "64109",
      "64130",
      "64134",
      "64129",
      "64158",
      "64163",
      "64070",
      "64102",
      "64105",
      "64086",
      "64101",
      "64124",
      "64157",
      "64088",
      "64061",
      "64051",
      "64002",
      "64081",
      "64013",
      "64016",
      "64112",
      "64114",
      "64110",
      "64152",
      "64127",
      "64147",
      "64120",
      "64146",
      "64199",
      "64058",
      "64054",
      "64074",
      "64119",
      "64138",
      "64149",
      "64156",
      "64132",
      "64171",
      "64148",
      "64141",
      "64999",
      "64052",
      "64015",
      "64063",
      "64075",
      "64056",
      "64082",
      "64113",
      "64155",
      "64126",
      "64197",
      "64065",
      "64198"
    ],
    "lifeexpectancy": 77.19,
    "avgincome": 47054,
    "povertyrate": 13.7,
    "costofliving": {
      "livingwage": 14.55,
      "foodcosts": 3246,
      "medicalcosts": 2681,
      "housingcosts": 8136,
      "taxcosts": 6263
    },
    "landareakm2": 1565.601892,
    "areakm2": 1596.319707
  }
}
```

## API Reference

- **API Home:** [County Data Lookup API](https://apiverve.com/marketplace/countydata?utm_source=dart&utm_medium=readme)
- **Documentation:** [docs.apiverve.com/ref/countydata](https://docs.apiverve.com/ref/countydata?utm_source=dart&utm_medium=readme)

## Authentication

All requests require an API key. Get yours at [apiverve.com](https://apiverve.com?utm_source=dart&utm_medium=readme).

## License

MIT License - see [LICENSE](LICENSE) for details.

---

Built with Dart for [APIVerve](https://apiverve.com?utm_source=dart&utm_medium=readme)
