<?php

require_once dirname(__FILE__)."/../locales/Forms/EmployeeSkillPositionsForm.class.php";

class employees_ajaxPositionsSkillAction extends mfAction {
    
       
    function execute(mfWebRequest $request) {
        $messages = mfMessages::getInstance();     
    
        $this->user=$this->getUser();        
        $this->form=new EmployeeSkillPositionsForm($request->getPostParameter('EmployeeSkillPositions'));
        if (!$request->isMethod('POST') || !$request->getPostParameter('EmployeeSkillPositions'))
            return ;       
        $this->form->bind($request->getPostParameter('EmployeeSkillPositions'));
        if ($this->form->isValid())
        {           
            EmployeeSkill::updatePositions($this->form->getPositions());
            $messages->addInfo(__('Positions have been updated.'));                     
            $this->forward($this->getModuleName(),'ajaxListPartialSkill');
        }  
        else 
        {
            //   echo "<pre>"; var_dump($this->form->getErrorSchema()->getErrorsMessage()); echo "</pre>";
             $messages->addError(__('Form has some errors.'));      
        }
    }
    
}