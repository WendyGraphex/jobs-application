<?php

class customers_academy_student_profileActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request)
    {               
       $this->user=$this->getUser()->getGuardUser();        
    } 
    
    
}