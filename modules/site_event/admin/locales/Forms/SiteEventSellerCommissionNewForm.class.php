<?php


class SiteEventSellerCommissionNewForm extends SiteEventSellerCommissionBaseForm {
    
   
     function configure() {              
        parent::configure();
        unset($this['id']);        
     }
    
}


