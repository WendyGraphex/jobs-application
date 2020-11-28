<?php

 

class employees_searchAdvertLanguageLinksActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request)
    {              
          $this->language_letters= EmployeeAdvertSearchLanguageLetter::getLetters();              
    } 
    
    
}



