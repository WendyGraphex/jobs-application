<?php

 

class employees_searchAdvertCityLinksActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request)
    {              
          $this->city_letters= EmployeeAdvertSearchCityLetter::getLetters();              
    } 
    
    
}



