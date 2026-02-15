// Package countydata provides a Go client for the County Data Lookup API.
//
// For more information, visit: https://apiverve.com/marketplace/countydata?utm_source=go&utm_medium=readme
package countydata

import (
	"fmt"
	"reflect"
	"regexp"
	"strings"
)

// ValidationRule defines validation constraints for a parameter.
type ValidationRule struct {
	Type      string
	Required  bool
	Min       *float64
	Max       *float64
	MinLength *int
	MaxLength *int
	Format    string
	Enum      []string
}

// ValidationError represents a parameter validation error.
type ValidationError struct {
	Errors []string
}

func (e *ValidationError) Error() string {
	return "Validation failed: " + strings.Join(e.Errors, "; ")
}

// Helper functions for pointers
func float64Ptr(v float64) *float64 { return &v }
func intPtr(v int) *int             { return &v }

// Format validation patterns
var formatPatterns = map[string]*regexp.Regexp{
	"email":    regexp.MustCompile(`^[^\s@]+@[^\s@]+\.[^\s@]+$`),
	"url":      regexp.MustCompile(`^https?://.+`),
	"ip":       regexp.MustCompile(`^(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$|^([0-9a-fA-F]{1,4}:){7}[0-9a-fA-F]{1,4}$`),
	"date":     regexp.MustCompile(`^\d{4}-\d{2}-\d{2}$`),
	"hexColor": regexp.MustCompile(`^#?([0-9a-fA-F]{3}|[0-9a-fA-F]{6})$`),
}

// Request contains the parameters for the County Data Lookup API.
//
// Parameters:
//   - state (required): string - The two letter name of the US state the county is in (e.g., MO) [minLength: 2, maxLength: 2]
//   - county (required): string - The name of the US county to get data about (e.g. Jackson)
type Request struct {
	State string `json:"state"` // Required
	County string `json:"county"` // Required
}

// ToQueryParams converts the request struct to a map of query parameters.
// Only non-zero values are included.
func (r *Request) ToQueryParams() map[string]string {
	params := make(map[string]string)
	if r == nil {
		return params
	}

	v := reflect.ValueOf(*r)
	t := v.Type()

	for i := 0; i < v.NumField(); i++ {
		field := v.Field(i)
		fieldType := t.Field(i)

		// Get the json tag for the field name
		jsonTag := fieldType.Tag.Get("json")
		if jsonTag == "" {
			continue
		}
		// Handle tags like `json:"name,omitempty"`
		jsonName := strings.Split(jsonTag, ",")[0]
		if jsonName == "-" {
			continue
		}

		// Skip zero values
		if field.IsZero() {
			continue
		}

		// Convert to string
		params[jsonName] = fmt.Sprintf("%v", field.Interface())
	}

	return params
}

// Validate checks the request parameters against validation rules.
// Returns a ValidationError if validation fails, nil otherwise.
func (r *Request) Validate() error {
	rules := map[string]ValidationRule{
		"state": {Type: "string", Required: true, MinLength: intPtr(2), MaxLength: intPtr(2)},
		"county": {Type: "string", Required: true},
	}

	if len(rules) == 0 {
		return nil
	}

	var errors []string
	v := reflect.ValueOf(*r)
	t := v.Type()

	for i := 0; i < v.NumField(); i++ {
		field := v.Field(i)
		fieldType := t.Field(i)

		jsonTag := fieldType.Tag.Get("json")
		if jsonTag == "" {
			continue
		}
		jsonName := strings.Split(jsonTag, ",")[0]

		rule, exists := rules[jsonName]
		if !exists {
			continue
		}

		// Check required
		if rule.Required && field.IsZero() {
			errors = append(errors, fmt.Sprintf("Required parameter [%s] is missing", jsonName))
			continue
		}

		if field.IsZero() {
			continue
		}

		// Type-specific validation
		switch rule.Type {
		case "integer", "number":
			var numVal float64
			switch field.Kind() {
			case reflect.Int, reflect.Int64:
				numVal = float64(field.Int())
			case reflect.Float64:
				numVal = field.Float()
			}
			if rule.Min != nil && numVal < *rule.Min {
				errors = append(errors, fmt.Sprintf("Parameter [%s] must be at least %v", jsonName, *rule.Min))
			}
			if rule.Max != nil && numVal > *rule.Max {
				errors = append(errors, fmt.Sprintf("Parameter [%s] must be at most %v", jsonName, *rule.Max))
			}

		case "string":
			strVal := field.String()
			if rule.MinLength != nil && len(strVal) < *rule.MinLength {
				errors = append(errors, fmt.Sprintf("Parameter [%s] must be at least %d characters", jsonName, *rule.MinLength))
			}
			if rule.MaxLength != nil && len(strVal) > *rule.MaxLength {
				errors = append(errors, fmt.Sprintf("Parameter [%s] must be at most %d characters", jsonName, *rule.MaxLength))
			}
			if rule.Format != "" {
				if pattern, ok := formatPatterns[rule.Format]; ok {
					if !pattern.MatchString(strVal) {
						errors = append(errors, fmt.Sprintf("Parameter [%s] must be a valid %s", jsonName, rule.Format))
					}
				}
			}
		}

		// Enum validation
		if len(rule.Enum) > 0 {
			strVal := fmt.Sprintf("%v", field.Interface())
			found := false
			for _, enumVal := range rule.Enum {
				if strVal == enumVal {
					found = true
					break
				}
			}
			if !found {
				errors = append(errors, fmt.Sprintf("Parameter [%s] must be one of: %s", jsonName, strings.Join(rule.Enum, ", ")))
			}
		}
	}

	if len(errors) > 0 {
		return &ValidationError{Errors: errors}
	}
	return nil
}

// ResponseData contains the data returned by the County Data Lookup API.
type ResponseData struct {
	Name string `json:"name"`
	State string `json:"state"`
	Age AgeData `json:"age"`
	Male int `json:"male"`
	Female int `json:"female"`
	Deaths DeathsData `json:"deaths"`
	Health HealthData `json:"health"`
	Longitude float64 `json:"longitude"`
	Latitude float64 `json:"latitude"`
	Education EducationData `json:"education"`
	Zipcodes []string `json:"zipcodes"`
	Lifeexpectancy float64 `json:"lifeexpectancy"`
	Avgincome int `json:"avgincome"`
	Povertyrate float64 `json:"povertyrate"`
	Costofliving CostoflivingData `json:"costofliving"`
	Landareakm2 float64 `json:"landareakm2"`
	Areakm2 float64 `json:"areakm2"`
}

// AgeData represents the age object.
type AgeData struct {
	0-4 float64 `json:"0-4"`
	5-9 float64 `json:"5-9"`
	10-14 float64 `json:"10-14"`
	15-19 float64 `json:"15-19"`
	20-24 float64 `json:"20-24"`
	25-29 float64 `json:"25-29"`
	30-34 float64 `json:"30-34"`
	35-39 float64 `json:"35-39"`
	40-44 float64 `json:"40-44"`
	45-49 float64 `json:"45-49"`
	50-54 float64 `json:"50-54"`
	55-59 float64 `json:"55-59"`
	60-64 float64 `json:"60-64"`
	65-69 float64 `json:"65-69"`
	70-74 float64 `json:"70-74"`
	75-79 float64 `json:"75-79"`
	80-84 float64 `json:"80-84"`
	85+ float64 `json:"85+"`
}

// DeathsData represents the deaths object.
type DeathsData struct {
	Suicides float64 `json:"suicides"`
	Homicides float64 `json:"homicides"`
	Vehicle int `json:"vehicle"`
	Firearmsuicides float64 `json:"firearmsuicides"`
}

// HealthData represents the health object.
type HealthData struct {
	Poorhealth float64 `json:"poorhealth"`
	Physicallyunhealthydays float64 `json:"physicallyunhealthydays"`
	Mentallyunhealthydays float64 `json:"mentallyunhealthydays"`
	Lowbirthweightpercent float64 `json:"lowbirthweightpercent"`
	Smokerspercent float64 `json:"smokerspercent"`
	Obesitypercent float64 `json:"obesitypercent"`
	Foodenvindex float64 `json:"foodenvindex"`
	Physicallyinactivepercent float64 `json:"physicallyinactivepercent"`
	Excessivedrinkingpercent float64 `json:"excessivedrinkingpercent"`
	Alcoholimpaireddrivingdeaths int `json:"alcoholimpaireddrivingdeaths"`
	Teenbirthrate float64 `json:"teenbirthrate"`
	Uninsured float64 `json:"uninsured"`
	Withannualmammogram int `json:"withannualmammogram"`
	Vaccinated int `json:"vaccinated"`
	Childreninpoverty float64 `json:"childreninpoverty"`
	80thpercentileincome int `json:"80thpercentileincome"`
	20thpercentileincome int `json:"20thpercentileincome"`
	Childreninsingleparenthouseholds float64 `json:"childreninsingleparenthouseholds"`
	Violentcrimerate float64 `json:"violentcrimerate"`
	Averagedailypm25 float64 `json:"averagedailypm25"`
	Severehousingproblems float64 `json:"severehousingproblems"`
	Drivealonetowork float64 `json:"drivealonetowork"`
	Longcommutedrivesalone float64 `json:"longcommutedrivesalone"`
}

// EducationData represents the education object.
type EducationData struct {
	Lessthanhighschool float64 `json:"lessthanhighschool"`
	Highschool float64 `json:"highschool"`
	Somecollege float64 `json:"somecollege"`
	Bachelors float64 `json:"bachelors"`
}

// CostoflivingData represents the costofliving object.
type CostoflivingData struct {
	Livingwage float64 `json:"livingwage"`
	Foodcosts int `json:"foodcosts"`
	Medicalcosts int `json:"medicalcosts"`
	Housingcosts int `json:"housingcosts"`
	Taxcosts int `json:"taxcosts"`
}
