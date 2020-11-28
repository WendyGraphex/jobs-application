<?php

class EmployerGalleryCompanyCollection extends  mfObjectCollection3 {
    
       
    function getEmployers()
    {
          if ($this->employers===null)
        {
            $this->employers= new EmployerCompanyCollection();
            foreach ($this as $item)
            {
               $this->employer[$item->getEmployer()->get('id')]=$item->getEmployer();
            }    
        }   
        return $this->employers;
    }
    
   
}

