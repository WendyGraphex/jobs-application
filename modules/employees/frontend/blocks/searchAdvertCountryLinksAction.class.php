<?php

 

class employees_searchAdvertCountryLinksActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request)
    {              
          $this->country_letters= EmployeeAdvertSearchCountryLetter::getLetters();              
    } 
    
    
}



