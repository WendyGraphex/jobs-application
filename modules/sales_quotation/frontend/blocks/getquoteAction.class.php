<?php

// Page employer :   Employee => Employer
class sales_quotation_getquoteActionComponent extends mfActionComponent {
    
    function execute(mfWebRequest $request)
    {              
       $this->user=$this->getUser();   
       $this->item_i18n=$this->getUser()->getStorage()->read('advert_i18n');
       $this->max_characters=500;      
    } 
        
}