<?php


class employees_listSkillsActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request)
    {              
        $this->tpl=$this->getParameter('tpl','default');      
        $this->skills=EmployeeSkill::getAllOrdered() ;
    } 
    
    
}