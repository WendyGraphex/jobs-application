<?php

class EmployerUserCollection extends mfObjectCollection3 {
    
    function __construct($data) {
        if ($data instanceof EmployerCompany);
        {
            $this->company=$data;
            return parent::__construct();
        }
        parent::__construct($data);
    }
    
    function getCompany()
    {
        return $this->company;
    }
    
    
   
}

