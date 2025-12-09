// Converter.java

// To use this code, add the following Maven dependency to your project:
//
//
//     com.fasterxml.jackson.core     : jackson-databind          : 2.9.0
//     com.fasterxml.jackson.datatype : jackson-datatype-jsr310   : 2.9.0
//
// Import this package:
//
//     import com.apiverve.data.Converter;
//
// Then you can deserialize a JSON string with
//
//     CountyDataLookupData data = Converter.fromJsonString(jsonString);

package com.apiverve.countydata.data;

import java.io.IOException;
import com.fasterxml.jackson.databind.*;
import com.fasterxml.jackson.databind.module.SimpleModule;
import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.JsonProcessingException;
import java.util.*;
import java.time.LocalDate;
import java.time.OffsetDateTime;
import java.time.OffsetTime;
import java.time.ZoneOffset;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeFormatterBuilder;
import java.time.temporal.ChronoField;

public class Converter {
    // Date-time helpers

    private static final DateTimeFormatter DATE_TIME_FORMATTER = new DateTimeFormatterBuilder()
            .appendOptional(DateTimeFormatter.ISO_DATE_TIME)
            .appendOptional(DateTimeFormatter.ISO_OFFSET_DATE_TIME)
            .appendOptional(DateTimeFormatter.ISO_INSTANT)
            .appendOptional(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.SX"))
            .appendOptional(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ssX"))
            .appendOptional(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"))
            .toFormatter()
            .withZone(ZoneOffset.UTC);

    public static OffsetDateTime parseDateTimeString(String str) {
        return ZonedDateTime.from(Converter.DATE_TIME_FORMATTER.parse(str)).toOffsetDateTime();
    }

    private static final DateTimeFormatter TIME_FORMATTER = new DateTimeFormatterBuilder()
            .appendOptional(DateTimeFormatter.ISO_TIME)
            .appendOptional(DateTimeFormatter.ISO_OFFSET_TIME)
            .parseDefaulting(ChronoField.YEAR, 2020)
            .parseDefaulting(ChronoField.MONTH_OF_YEAR, 1)
            .parseDefaulting(ChronoField.DAY_OF_MONTH, 1)
            .toFormatter()
            .withZone(ZoneOffset.UTC);

    public static OffsetTime parseTimeString(String str) {
        return ZonedDateTime.from(Converter.TIME_FORMATTER.parse(str)).toOffsetDateTime().toOffsetTime();
    }
    // Serialize/deserialize helpers

    public static CountyDataLookupData fromJsonString(String json) throws IOException {
        return getObjectReader().readValue(json);
    }

    public static String toJsonString(CountyDataLookupData obj) throws JsonProcessingException {
        return getObjectWriter().writeValueAsString(obj);
    }

    private static ObjectReader reader;
    private static ObjectWriter writer;

    private static void instantiateMapper() {
        ObjectMapper mapper = new ObjectMapper();
        mapper.findAndRegisterModules();
        mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
        mapper.configure(SerializationFeature.WRITE_DATES_AS_TIMESTAMPS, false);
        SimpleModule module = new SimpleModule();
        module.addDeserializer(OffsetDateTime.class, new JsonDeserializer<OffsetDateTime>() {
            @Override
            public OffsetDateTime deserialize(JsonParser jsonParser, DeserializationContext deserializationContext) throws IOException, JsonProcessingException {
                String value = jsonParser.getText();
                return Converter.parseDateTimeString(value);
            }
        });
        mapper.registerModule(module);
        reader = mapper.readerFor(CountyDataLookupData.class);
        writer = mapper.writerFor(CountyDataLookupData.class);
    }

    private static ObjectReader getObjectReader() {
        if (reader == null) instantiateMapper();
        return reader;
    }

    private static ObjectWriter getObjectWriter() {
        if (writer == null) instantiateMapper();
        return writer;
    }
}

// CountyDataLookupData.java

package com.apiverve.countydata.data;

import com.fasterxml.jackson.annotation.*;
import java.util.Map;

public class CountyDataLookupData {
    private String name;
    private String state;
    private Map<String, Double> age;
    private long male;
    private long female;
    private Deaths deaths;
    private Map<String, Double> health;
    private double longitude;
    private double latitude;
    private Education education;
    private String[] zipcodes;
    private double lifeexpectancy;
    private long avgincome;
    private double povertyrate;
    private Costofliving costofliving;
    private double landareakm2;
    private double areakm2;

    @JsonProperty("name")
    public String getName() { return name; }
    @JsonProperty("name")
    public void setName(String value) { this.name = value; }

    @JsonProperty("state")
    public String getState() { return state; }
    @JsonProperty("state")
    public void setState(String value) { this.state = value; }

    @JsonProperty("age")
    public Map<String, Double> getAge() { return age; }
    @JsonProperty("age")
    public void setAge(Map<String, Double> value) { this.age = value; }

    @JsonProperty("male")
    public long getMale() { return male; }
    @JsonProperty("male")
    public void setMale(long value) { this.male = value; }

    @JsonProperty("female")
    public long getFemale() { return female; }
    @JsonProperty("female")
    public void setFemale(long value) { this.female = value; }

    @JsonProperty("deaths")
    public Deaths getDeaths() { return deaths; }
    @JsonProperty("deaths")
    public void setDeaths(Deaths value) { this.deaths = value; }

    @JsonProperty("health")
    public Map<String, Double> getHealth() { return health; }
    @JsonProperty("health")
    public void setHealth(Map<String, Double> value) { this.health = value; }

    @JsonProperty("longitude")
    public double getLongitude() { return longitude; }
    @JsonProperty("longitude")
    public void setLongitude(double value) { this.longitude = value; }

    @JsonProperty("latitude")
    public double getLatitude() { return latitude; }
    @JsonProperty("latitude")
    public void setLatitude(double value) { this.latitude = value; }

    @JsonProperty("education")
    public Education getEducation() { return education; }
    @JsonProperty("education")
    public void setEducation(Education value) { this.education = value; }

    @JsonProperty("zipcodes")
    public String[] getZipcodes() { return zipcodes; }
    @JsonProperty("zipcodes")
    public void setZipcodes(String[] value) { this.zipcodes = value; }

    @JsonProperty("lifeexpectancy")
    public double getLifeexpectancy() { return lifeexpectancy; }
    @JsonProperty("lifeexpectancy")
    public void setLifeexpectancy(double value) { this.lifeexpectancy = value; }

    @JsonProperty("avgincome")
    public long getAvgincome() { return avgincome; }
    @JsonProperty("avgincome")
    public void setAvgincome(long value) { this.avgincome = value; }

    @JsonProperty("povertyrate")
    public double getPovertyrate() { return povertyrate; }
    @JsonProperty("povertyrate")
    public void setPovertyrate(double value) { this.povertyrate = value; }

    @JsonProperty("costofliving")
    public Costofliving getCostofliving() { return costofliving; }
    @JsonProperty("costofliving")
    public void setCostofliving(Costofliving value) { this.costofliving = value; }

    @JsonProperty("landareakm2")
    public double getLandareakm2() { return landareakm2; }
    @JsonProperty("landareakm2")
    public void setLandareakm2(double value) { this.landareakm2 = value; }

    @JsonProperty("areakm2")
    public double getAreakm2() { return areakm2; }
    @JsonProperty("areakm2")
    public void setAreakm2(double value) { this.areakm2 = value; }
}

// Costofliving.java

package com.apiverve.countydata.data;

import com.fasterxml.jackson.annotation.*;

public class Costofliving {
    private double livingwage;
    private long foodcosts;
    private long medicalcosts;
    private long housingcosts;
    private long taxcosts;

    @JsonProperty("livingwage")
    public double getLivingwage() { return livingwage; }
    @JsonProperty("livingwage")
    public void setLivingwage(double value) { this.livingwage = value; }

    @JsonProperty("foodcosts")
    public long getFoodcosts() { return foodcosts; }
    @JsonProperty("foodcosts")
    public void setFoodcosts(long value) { this.foodcosts = value; }

    @JsonProperty("medicalcosts")
    public long getMedicalcosts() { return medicalcosts; }
    @JsonProperty("medicalcosts")
    public void setMedicalcosts(long value) { this.medicalcosts = value; }

    @JsonProperty("housingcosts")
    public long getHousingcosts() { return housingcosts; }
    @JsonProperty("housingcosts")
    public void setHousingcosts(long value) { this.housingcosts = value; }

    @JsonProperty("taxcosts")
    public long getTaxcosts() { return taxcosts; }
    @JsonProperty("taxcosts")
    public void setTaxcosts(long value) { this.taxcosts = value; }
}

// Deaths.java

package com.apiverve.countydata.data;

import com.fasterxml.jackson.annotation.*;

public class Deaths {
    private double suicides;
    private double homicides;
    private long vehicle;
    private double firearmsuicides;

    @JsonProperty("suicides")
    public double getSuicides() { return suicides; }
    @JsonProperty("suicides")
    public void setSuicides(double value) { this.suicides = value; }

    @JsonProperty("homicides")
    public double getHomicides() { return homicides; }
    @JsonProperty("homicides")
    public void setHomicides(double value) { this.homicides = value; }

    @JsonProperty("vehicle")
    public long getVehicle() { return vehicle; }
    @JsonProperty("vehicle")
    public void setVehicle(long value) { this.vehicle = value; }

    @JsonProperty("firearmsuicides")
    public double getFirearmsuicides() { return firearmsuicides; }
    @JsonProperty("firearmsuicides")
    public void setFirearmsuicides(double value) { this.firearmsuicides = value; }
}

// Education.java

package com.apiverve.countydata.data;

import com.fasterxml.jackson.annotation.*;

public class Education {
    private double lessthanhighschool;
    private double highschool;
    private double somecollege;
    private double bachelors;

    @JsonProperty("lessthanhighschool")
    public double getLessthanhighschool() { return lessthanhighschool; }
    @JsonProperty("lessthanhighschool")
    public void setLessthanhighschool(double value) { this.lessthanhighschool = value; }

    @JsonProperty("highschool")
    public double getHighschool() { return highschool; }
    @JsonProperty("highschool")
    public void setHighschool(double value) { this.highschool = value; }

    @JsonProperty("somecollege")
    public double getSomecollege() { return somecollege; }
    @JsonProperty("somecollege")
    public void setSomecollege(double value) { this.somecollege = value; }

    @JsonProperty("bachelors")
    public double getBachelors() { return bachelors; }
    @JsonProperty("bachelors")
    public void setBachelors(double value) { this.bachelors = value; }
}