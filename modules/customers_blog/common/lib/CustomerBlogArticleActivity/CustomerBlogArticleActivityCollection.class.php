<?php

class CustomerBlogArticleActivityCollection extends mfObjectCollection3 {
    
     
   function getActivities()
    {
        if ($this->activities===null)
        {
            $this->activities=new CustomerBlogActivityCollection();
            foreach ($this as $item)
                 $this->activities[$item->getActivity()->get('id')] = $item->getActivity();
        }
        return $this->activities;
        
    }
}

