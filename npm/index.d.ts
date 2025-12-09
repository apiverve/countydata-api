declare module '@apiverve/countydata' {
  export interface countydataOptions {
    api_key: string;
    secure?: boolean;
  }

  export interface countydataResponse {
    status: string;
    error: string | null;
    data: CountyDataLookupData;
    code?: number;
  }


  interface CountyDataLookupData {
      name:           string;
      state:          string;
      age:            { [key: string]: number };
      male:           number;
      female:         number;
      deaths:         Deaths;
      health:         { [key: string]: number };
      longitude:      number;
      latitude:       number;
      education:      Education;
      zipcodes:       string[];
      lifeexpectancy: number;
      avgincome:      number;
      povertyrate:    number;
      costofliving:   Costofliving;
      landareakm2:    number;
      areakm2:        number;
  }
  
  interface Costofliving {
      livingwage:   number;
      foodcosts:    number;
      medicalcosts: number;
      housingcosts: number;
      taxcosts:     number;
  }
  
  interface Deaths {
      suicides:        number;
      homicides:       number;
      vehicle:         number;
      firearmsuicides: number;
  }
  
  interface Education {
      lessthanhighschool: number;
      highschool:         number;
      somecollege:        number;
      bachelors:          number;
  }

  export default class countydataWrapper {
    constructor(options: countydataOptions);

    execute(callback: (error: any, data: countydataResponse | null) => void): Promise<countydataResponse>;
    execute(query: Record<string, any>, callback: (error: any, data: countydataResponse | null) => void): Promise<countydataResponse>;
    execute(query?: Record<string, any>): Promise<countydataResponse>;
  }
}
