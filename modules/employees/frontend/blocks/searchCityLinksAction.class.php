<?php

 

class employees_searchCityLinksActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request)
    {              
          $this->city_letters= EmployeeSearchCityLetter::getLetters();              
    } 
    
    
}



