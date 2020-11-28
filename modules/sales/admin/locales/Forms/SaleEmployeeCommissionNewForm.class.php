<?php


class SaleEmployeeCommissionNewForm extends SaleEmployeeCommissionBaseForm {
    
   
     function configure() {              
        parent::configure();
        unset($this['id']);        
     }
    
}


