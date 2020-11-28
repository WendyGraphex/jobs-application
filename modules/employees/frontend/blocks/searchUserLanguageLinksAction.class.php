<?php

 

class employees_searchUserLanguageLinksActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request)
    {              
          $this->language_letters= EmployeeSearchUserLanguageLetter::getLetters();              
    } 
    
    
}



