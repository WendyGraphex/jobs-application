<?php


class DayTimeCollection extends mfArray {
    
    
    function getTimeCollection()
    {
        $values= new TimeCollection();
        foreach ($this->collection as $day)
        {
            $values[]=$day->getTime()->getHourMinute();
        }    
        return $values;
    }
}

