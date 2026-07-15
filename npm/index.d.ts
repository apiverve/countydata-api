declare module '@apiverve/countydata' {
  export interface countydataOptions {
    api_key: string;
    secure?: boolean;
  }

  /**
   * Describes fields the current plan does not unlock. Locked fields arrive as null
   * in `data`; `locked_fields` names them, using dot paths for nested fields.
   * Absent when the plan unlocks everything.
   */
  export interface PremiumInfo {
    message: string;
    upgrade_url: string;
    locked_fields: string[];
  }

  export interface countydataResponse {
    status: string;
    error: string | null;
    data: CountyDataLookupData;
    code?: number;
    premium?: PremiumInfo;
  }


  interface CountyDataLookupData {
      name:           null | string;
      state:          null | string;
      age:            { [key: string]: number | null };
      male:           number | null;
      female:         number | null;
      health:         { [key: string]: number | null };
      longitude:      number | null;
      latitude:       number | null;
      education:      Education;
      zipcodes:       (null | string)[];
      lifeexpectancy: number | null;
      avgincome:      number | null;
      povertyrate:    number | null;
      costofliving:   Costofliving;
      landareakm2:    number | null;
      areakm2:        number | null;
  }
  
  interface Costofliving {
      livingwage:   number | null;
      foodcosts:    number | null;
      medicalcosts: number | null;
      housingcosts: number | null;
      taxcosts:     number | null;
  }
  
  interface Education {
      lessthanhighschool: number | null;
      highschool:         number | null;
      somecollege:        number | null;
      bachelors:          number | null;
  }

  export default class countydataWrapper {
    constructor(options: countydataOptions);

    execute(callback: (error: any, data: countydataResponse | null) => void): Promise<countydataResponse>;
    execute(query: Record<string, any>, callback: (error: any, data: countydataResponse | null) => void): Promise<countydataResponse>;
    execute(query?: Record<string, any>): Promise<countydataResponse>;
  }
}
