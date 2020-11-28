<?php

 

class employees_searchAdvertUserLanguageLinksActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request)
    {              
          $this->language_letters= EmployeeAdvertSearchUserLanguageLetter::getLetters();              
    } 
    
    
}



