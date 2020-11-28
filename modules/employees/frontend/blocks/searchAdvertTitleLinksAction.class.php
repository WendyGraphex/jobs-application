<?php

 

class employees_searchAdvertTitleLinksActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request)
    {              
          $this->title_letters= EmployeeAdvertSearchTitleLetter::getLetters();              
    } 
    
    
}



