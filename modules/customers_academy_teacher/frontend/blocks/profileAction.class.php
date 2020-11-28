<?php

class customers_academy_teacher_profileActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request)
    {               
       $this->user=$this->getUser()->getGuardUser();        
    } 
    
    
}