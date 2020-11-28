<?php

 

class employers_searchAdvertCountryLinksActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request)
    {              
          $this->country_letters= EmployerAdvertSearchCountryLetter::getLetters();              
    } 
    
    
}



