<?php

class EmployerCategoryCollection extends mfObjectCollection3 {
    
     
   function getCategories()
    {
        if ($this->categories===null)
        {
            $this->categories=new PartnerWorkCategoryCollection();
            foreach ($this as $item)
                 $this->categories[$item->getCategory()->get('id')] = $item->getCategory();
        }
        return $this->categories;
        
    }
}

