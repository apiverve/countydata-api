County Data Lookup API
============

County Data is a simple tool for getting data about US counties. It returns information such as average income, area, and more based on the county name provided.

![Build Status](https://img.shields.io/badge/build-passing-green)
![Code Climate](https://img.shields.io/badge/maintainability-B-purple)
![Prod Ready](https://img.shields.io/badge/production-ready-blue)

This is a Python API Wrapper for the [County Data Lookup API](https://apiverve.com/marketplace/countydata?utm_source=pypi&utm_medium=readme)

---

## Installation

Using `pip`:

```bash
pip install apiverve-countydatalookup
```

Using `pip3`:

```bash
pip3 install apiverve-countydatalookup
```

---

## Configuration

Before using the countydata API client, you have to setup your account and obtain your API Key.
You can get it by signing up at [https://apiverve.com](https://apiverve.com?utm_source=pypi&utm_medium=readme)

---

## Quick Start

Here's a simple example to get you started quickly:

```python
from apiverve_countydatalookup.apiClient import CountydataAPIClient

# Initialize the client with your APIVerve API key
api = CountydataAPIClient("[YOUR_API_KEY]")

query = {
    "state": "MO",
    "county": "Jackson"
}

try:
    # Make the API call
    result = api.execute(query)

    # Print the result
    print(result)
except Exception as e:
    print(f"Error: {e}")
```

---

## Usage

The County Data Lookup API documentation is found here: [https://docs.apiverve.com/ref/countydata](https://docs.apiverve.com/ref/countydata?utm_source=pypi&utm_medium=readme).
You can find parameters, example responses, and status codes documented here.

### Setup

```python
# Import the client module
from apiverve_countydatalookup.apiClient import CountydataAPIClient

# Initialize the client with your APIVerve API key
api = CountydataAPIClient("[YOUR_API_KEY]")
```

---

## Perform Request

Using the API client, you can perform requests to the API.

###### Define Query

```python
query = {
    "state": "MO",
    "county": "Jackson"
}
```

###### Simple Request

```python
# Make a request to the API
result = api.execute(query)

# Print the result
print(result)
```

###### Example Response

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

---

## Error Handling

The API client provides comprehensive error handling through the `CountydataAPIClientError` exception. Here are some examples:

### Basic Error Handling

```python
from apiverve_countydatalookup.apiClient import CountydataAPIClient, CountydataAPIClientError

api = CountydataAPIClient("[YOUR_API_KEY]")

query = {
    "state": "MO",
    "county": "Jackson"
}

try:
    result = api.execute(query)
    print("Success!")
    print(result)
except CountydataAPIClientError as e:
    print(f"API Error: {e.message}")
    if e.status_code:
        print(f"Status Code: {e.status_code}")
    if e.response:
        print(f"Response: {e.response}")
```

### Handling Specific Error Types

```python
from apiverve_countydatalookup.apiClient import CountydataAPIClient, CountydataAPIClientError

api = CountydataAPIClient("[YOUR_API_KEY]")

query = {
    "state": "MO",
    "county": "Jackson"
}

try:
    result = api.execute(query)

    # Check for successful response
    if result.get('status') == 'success':
        print("Request successful!")
        print(result.get('data'))
    else:
        print(f"API returned an error: {result.get('error')}")

except CountydataAPIClientError as e:
    # Handle API client errors
    if e.status_code == 401:
        print("Unauthorized: Invalid API key")
    elif e.status_code == 429:
        print("Rate limit exceeded")
    elif e.status_code >= 500:
        print("Server error - please try again later")
    else:
        print(f"API error: {e.message}")
except Exception as e:
    # Handle unexpected errors
    print(f"Unexpected error: {str(e)}")
```

### Using Context Manager (Recommended)

The client supports the context manager protocol for automatic resource cleanup:

```python
from apiverve_countydatalookup.apiClient import CountydataAPIClient, CountydataAPIClientError

query = {
    "state": "MO",
    "county": "Jackson"
}

# Using context manager ensures proper cleanup
with CountydataAPIClient("[YOUR_API_KEY]") as api:
    try:
        result = api.execute(query)
        print(result)
    except CountydataAPIClientError as e:
        print(f"Error: {e.message}")
# Session is automatically closed here
```

---

## Advanced Features

### Debug Mode

Enable debug logging to see detailed request and response information:

```python
from apiverve_countydatalookup.apiClient import CountydataAPIClient

# Enable debug mode
api = CountydataAPIClient("[YOUR_API_KEY]", debug=True)

query = {
    "state": "MO",
    "county": "Jackson"
}

# Debug information will be printed to console
result = api.execute(query)
```

### Manual Session Management

If you need to manually manage the session lifecycle:

```python
from apiverve_countydatalookup.apiClient import CountydataAPIClient

api = CountydataAPIClient("[YOUR_API_KEY]")

query = {
    "state": "MO",
    "county": "Jackson"
}

try:
    result = api.execute(query)
    print(result)
finally:
    # Manually close the session when done
    api.close()
```

---

## Customer Support

Need any assistance? [Get in touch with Customer Support](https://apiverve.com/contact?utm_source=pypi&utm_medium=readme).

---

## Updates
Stay up to date by following [@apiverveHQ](https://twitter.com/apiverveHQ) on Twitter.

---

## Legal

All usage of the APIVerve website, API, and services is subject to the [APIVerve Terms of Service](https://apiverve.com/terms?utm_source=pypi&utm_medium=readme) and all legal documents and agreements.

---

## License
Licensed under the The MIT License (MIT)

Copyright (&copy;) 2026 APIVerve, and EvlarSoft LLC

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
