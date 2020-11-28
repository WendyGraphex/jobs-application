<?php

class GoogleMarkerCollection  extends mfCollectionCore  {
    
   
      function toJson()
      {
          $values=array();
          foreach ($this->collection as $name=>$value)
              $values[$name]=$value->toArray();
          return json_encode($values);
      }
    
    
}

