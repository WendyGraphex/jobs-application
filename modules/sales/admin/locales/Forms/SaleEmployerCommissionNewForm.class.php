<?php


class SaleEmployerCommissionNewForm extends SaleEmployerCommissionBaseForm {
    
   
     function configure() {              
        parent::configure();
        unset($this['id']);        
     }
    
}


