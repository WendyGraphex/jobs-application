<?php



class mfCountryInfoI18n extends mfCountryInfo {
    
 
    static function getI18nCountries()
    {
        $values=new mfCountryCollection();
        foreach (self::getCountries() as $country)
        {
            if (in_array($country,['BQ','CW','SS','SX']))
                    continue;
            $values[$country]=new CountryFormatter($country);
        }    
        return $values;
    }
    
    static function getI18nCountriesToArray()
    {
        $values=new mfArray();
        foreach (self::getCountries() as $country)
        {
            if (in_array($country,['BQ','CW','SS','SX']))
                    continue;
            $values[$country]=ucfirst(format_country($country));
        }    
        return $values;
    }
    
  
}