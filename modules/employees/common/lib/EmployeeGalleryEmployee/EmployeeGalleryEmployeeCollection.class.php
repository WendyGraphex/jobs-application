<?php

class EmployeeGalleryEmployeeCollection extends  mfObjectCollection3 {
    
       
    function getEmployees()
    {
          if ($this->employees===null)
        {
            $this->employees= new EmployeeCollection();
            foreach ($this as $item)
            {
               $this->employee[$item->getEmployeeUser()->get('id')]=$item->getEmployeeUser();
            }    
        }   
        return $this->employees;
    }
    
   
}

