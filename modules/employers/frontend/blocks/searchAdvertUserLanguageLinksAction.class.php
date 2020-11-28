<?php

 

class employers_searchAdvertUserLanguageLinksActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request)
    {              
          $this->language_letters= EmployerAdvertSearchUserLanguageLetter::getLetters();              
    } 
    
    
}



