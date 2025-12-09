using System;
using System.Collections.Generic;
using System.Text;
using Newtonsoft.Json;

namespace APIVerve.API.CountyDataLookup
{
    /// <summary>
    /// Query options for the County Data Lookup API
    /// </summary>
    public class CountyDataLookupQueryOptions
    {
        /// <summary>
        /// The two letter name of the US state the county is in (e.g., MO)
        /// Example: MO
        /// </summary>
        [JsonProperty("state")]
        public string State { get; set; }

        /// <summary>
        /// The name of the US county to get data about (e.g. Jackson)
        /// Example: Jackson
        /// </summary>
        [JsonProperty("county")]
        public string County { get; set; }
    }
}
