<?php

 

class employers_searchUserLanguageLinksActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request)
    {              
          $this->language_letters= EmployerSearchUserLanguageLetter::getLetters();              
    } 
    
    
}



