<?php


class Chart {
    
    
    function escape($value)
    {
        return str_replace(array("'",'"'),array("\'","\";"),$value);
    }
    
    function getJson($fieldName)
    {
        return json_encode($this->$fieldName);
    }
    
    function convertDateToTime($date)
    {
        return (7200 + strtotime($date)) * 1000;
    }
    
    
}


