<?php


abstract class mfGPSObject extends mfObject2 {
    
    static function getDistanceFormula($class="",$name="`distance`")
    {
        if ($class && !class_exists($class))
            throw new mfDatabaseException("Class ".$class." is invalid");          
        $lat=($class)?$class::getTableField('lat'):"lat";                     
        $lng=($class)?$class::getTableField('lng'):"lng";                     
        return " (acos(sin(radians({lat})) * sin(radians(".$lat.")) + ".
               " cos(radians({lat})) * cos(radians(".$lat.")) * cos(radians({lng}) - radians(".$lng."))) * ".GPSCoordinate::EARTH_RADIUS_METERS.") as ".$name." ";
    }
    
    static function  getBoundingCoordinates(GPSCoordinate $coordinates,$radius)  // meters
    {       
         $class=get_called_class()."Collection";
         $collection=new $class();
         $db=mfSiteDatabase::getInstance()
            ->setParameters(array('lat'=>$coordinates->getLatitude(),'lng'=>$coordinates->getLongitude(),'radius'=>$radius))            
            ->setQuery("SELECT (acos(sin(radians({lat})) * sin(radians(lat)) + ".
                       " cos(radians({lat})) * cos(radians(lat)) * cos(radians({lng}) - radians(lng))) * ". GPSCoordinate::EARTH_RADIUS_METERS.") as distance ".
                       " FROM ".static::getTable().       
                       " WHERE distance >= {radius}".
                       ";")
            ->makeSqlQuery();   
          if (!$db->getNumRows())
            return $collection;           
        while ($item=$db->fetchObject(get_called_class()))
        {
            $collection[$item->getKey()]=$item->loaded();
        }        
        return $collection;
    }   
}


