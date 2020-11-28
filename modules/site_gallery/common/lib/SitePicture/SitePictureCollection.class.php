<?php


class SitePictureCollection extends mfObjectCollection3 {
    
    
    function get($name)
    {
        $values=array();
        foreach ($this->collection as $item)
        {
            $values[]=$item->get($name);
        }    
        return $values;
    }
    
    function setStatusDelete()
    {
        foreach ($this->collection as $item)
        {
            $item->set('status','DELETE');
        } 
        $this->save();
    }
    
}

