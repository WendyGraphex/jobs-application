<?php

 

class employees_searchSkillLinksActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request)
    {              
         $this->skill_letters= EmployeeSearchSkillLetter::getLetters();         
    } 
    
    
}



