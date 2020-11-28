<?php

 

class employers_searchAdvertCityLinksActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request)
    {              
          $this->city_letters= EmployerAdvertSearchCityLetter::getLetters();              
    } 
    
    
}



