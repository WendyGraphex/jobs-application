<?php

 

class employers_searchCityLinksActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request)
    {              
          $this->city_letters= EmployerSearchCityLetter::getLetters();              
    } 
    
    
}



