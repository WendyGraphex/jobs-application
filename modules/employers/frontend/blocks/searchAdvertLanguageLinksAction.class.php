<?php

 

class employers_searchAdvertLanguageLinksActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request)
    {              
          $this->language_letters= EmployerAdvertSearchLanguageLetter::getLetters();              
    } 
    
    
}



