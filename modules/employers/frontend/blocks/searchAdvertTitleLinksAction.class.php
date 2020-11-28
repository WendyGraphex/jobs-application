<?php

 

class employers_searchAdvertTitleLinksActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request)
    {              
          $this->title_letters= EmployerAdvertSearchTitleLetter::getLetters();              
    } 
    
    
}



