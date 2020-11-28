<?php

 

class employees_searchCountryLinksActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request)
    {              
          $this->country_letters= EmployeeSearchCountryLetter::getLetters();              
    } 
    
    
}



