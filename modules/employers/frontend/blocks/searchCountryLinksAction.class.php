<?php

 

class employers_searchCountryLinksActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request)
    {              
          $this->country_letters= EmployerSearchCountryLetter::getLetters();              
    } 
    
    
}



