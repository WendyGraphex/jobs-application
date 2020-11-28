<?php

 

class employees_searchAdvertSkillLinksActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request)
    {              
         $this->skill_letters= EmployeeAdvertSearchSkillLetter::getLetters();         
    } 
    
    
}



