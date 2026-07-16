# [County Data Lookup API](https://apiverve.com/marketplace/countydata?utm_source&#x3D;github&amp;utm_medium&#x3D;readme)

County Data is a simple tool for getting data about US counties. It returns information such as average income, area, and more based on the county name provided.

The County Data Lookup API provides a simple, reliable way to integrate county data lookup functionality into your applications. Built for developers who need production-ready county data lookup capabilities without the complexity of building from scratch.

**[View API Details →](https://apiverve.com/marketplace/countydata?utm_source&#x3D;github&amp;utm_medium&#x3D;readme)**

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![API Status](https://img.shields.io/badge/Status-Active-green.svg)](https://apiverve.com/marketplace/countydata?utm_source&#x3D;github&amp;utm_medium&#x3D;readme)
[![Method](https://img.shields.io/badge/Method-GET-blue.svg)](#)
[![Platform](https://img.shields.io/badge/Platform-Multi--Platform-orange.svg)](#installation)

**Available on:**
[![npm](https://img.shields.io/badge/npm-CB3837?style=flat&logo=npm&logoColor=white)](https://www.npmjs.com/package/@apiverve/countydata)
[![NuGet](https://img.shields.io/badge/NuGet-004880?style=flat&logo=nuget&logoColor=white)](https://www.nuget.org/packages/APIVerve.API.CountyDataLookup)
[![PyPI](https://img.shields.io/badge/PyPI-3776AB?style=flat&logo=python&logoColor=white)](https://pypi.org/project/apiverve-countydata/)
[![RubyGems](https://img.shields.io/badge/RubyGems-E9573F?style=flat&logo=rubygems&logoColor=white)](https://rubygems.org/gems/apiverve_countydata)
[![Packagist](https://img.shields.io/badge/Packagist-F28D1A?style=flat&logo=packagist&logoColor=white)](https://packagist.org/packages/apiverve/countydata)
[![Go](https://img.shields.io/badge/Go-00ADD8?style=flat&logo=go&logoColor=white)](#-go)
[![Dart](https://img.shields.io/badge/Dart-0175C2?style=flat&logo=dart&logoColor=white)](https://pub.dev/packages/apiverve_countydata)
[![JitPack](https://img.shields.io/badge/JitPack-2E7D32?style=flat&logo=android&logoColor=white)](#-android-jitpack)

---

## Quick Start

### Using JavaScript

```javascript
async function callCountyDataLookupAPI() {
    try {
        const params = new URLSearchParams({
            state: 'MO',
            county: 'Jackson'
        });

        const response = await fetch(`https://api.apiverve.com/v1/countydata?${params}`, {
            method: 'GET',
            headers: {
                'x-api-key': 'YOUR_API_KEY_HERE'
            }
        });

        const data = await response.json();
        console.log(data);
    } catch (error) {
        console.error('Error:', error);
    }
}

callCountyDataLookupAPI();
```

### Using cURL

```bash
curl -X GET "https://api.apiverve.com/v1/countydata?state=MO&county=Jackson" \
  -H "x-api-key: YOUR_API_KEY_HERE"
```

**Get your API key:** [https://apiverve.com](https://apiverve.com)

**📁 For more examples, see the [examples folder](./examples/)**

---

## Installation

Choose your preferred programming language:

### 📦 NPM (JavaScript/Node.js)

```bash
npm install @apiverve/countydata
```

[**View NPM Package →**](https://www.npmjs.com/package/@apiverve/countydata) | [**Package Code →**](./npm/)

---

### 🔷 NuGet (.NET/C#)

```bash
dotnet add package APIVerve.API.CountyDataLookup
```

[**View NuGet Package →**](https://www.nuget.org/packages/APIVerve.API.CountyDataLookup) | [**Package Code →**](./nuget/)

---

### 🐍 Python (PyPI)

```bash
pip install apiverve-countydata
```

[**View PyPI Package →**](https://pypi.org/project/apiverve-countydata/) | [**Package Code →**](./python/)

---

### 💎 Ruby (RubyGems)

```bash
gem install apiverve_countydata
```

[**View RubyGems Package →**](https://rubygems.org/gems/apiverve_countydata) | [**Package Code →**](./ruby/)

---

### 🐘 PHP (Packagist)

```bash
composer require apiverve/countydata
```

[**View Packagist Package →**](https://packagist.org/packages/apiverve/countydata) | [**Package Code →**](./php/)

---

### 🎯 Dart (pub.dev)

```bash
dart pub add apiverve_countydata
```

[**View pub.dev Package →**](https://pub.dev/packages/apiverve_countydata) | [**Package Code →**](./dart/)

---

### 🤖 Android (JitPack)

```gradle
implementation 'com.github.apiverve:countydata-api:1.0.0'
```

[**Package Code →**](./android/)

---

### 🐹 Go

```bash
go get github.com/apiverve/countydata-api/go
```

[**Package Code →**](./go/)

---

## Why Use This API?

| Feature | Benefit |
|---------|---------|
| **Multi-language SDKs** | Native packages for JavaScript, Python, C#, Go, and Android |
| **Simple Integration** | Single API key authentication, consistent response format |
| **Production Ready** | 99.9% uptime SLA, served from 24 global regions |
| **Comprehensive Docs** | Full examples, OpenAPI spec, and dedicated support |

---

## Documentation

- 🏠 **API Home:** [County Data Lookup API](https://apiverve.com/marketplace/countydata?utm_source&#x3D;github&amp;utm_medium&#x3D;readme)
- 📚 **API Reference:** [docs.apiverve.com/ref/countydata](https://docs.apiverve.com/ref/countydata)
- 📖 **OpenAPI Spec:** [openapi.yaml](./openapi.yaml)
- 💡 **Examples:** [examples/](./examples/)

---

## What Can You Build?

The County Data Lookup API is commonly used for:

- **Web Applications** - Add county data lookup features to your frontend or backend
- **Mobile Apps** - Native SDKs for Android development
- **Automation** - Integrate with n8n, Zapier, or custom workflows
- **SaaS Products** - Enhance your product with county data lookup capabilities
- **Data Pipelines** - Process and analyze data at scale

---

## API Reference

### Authentication
All requests require an API key in the header:
```
x-api-key: YOUR_API_KEY_HERE
```

Get your API key: [https://apiverve.com](https://apiverve.com)

### Response Format

Every APIVerve endpoint returns the same envelope — check `status`, then read `data`:

```json
{
  "status": "ok",
  "error": null,
  "data": { ... }
}
```

### Example Response

A real response from the County Data Lookup API:

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

---

## Support & Community

- 🏠 **API Home**: [County Data Lookup API](https://apiverve.com/marketplace/countydata?utm_source&#x3D;github&amp;utm_medium&#x3D;readme)
- 💬 **Support**: [https://apiverve.com/contact](https://apiverve.com/contact)
- 🐛 **Issues**: [GitHub Issues](../../issues)
- 📖 **Documentation**: [https://docs.apiverve.com](https://docs.apiverve.com)
- 🌐 **Website**: [https://apiverve.com](https://apiverve.com)

---

## Contributing

We welcome contributions! Please see [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

---

## Security

For security concerns, please review our [Security Policy](SECURITY.md).

---

## License

This project is licensed under the **MIT License** - see the [LICENSE](LICENSE) file for details.

---

## Acknowledgments

Built with ❤️ by [APIVerve](https://apiverve.com)

Copyright © 2026 APIVerve. All rights reserved.
