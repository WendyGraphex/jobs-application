<?php


 require_once dirname(__FILE__)."/../locales/Forms/EmployeeSkillViewForm.class.php";
 
class  employees_ajaxSaveSkillI18nAction extends mfAction {
    
          
    function execute(mfWebRequest $request) {                    
        $messages = mfMessages::getInstance();     
        $this->form = new EmployeeSkillViewForm($request->getPostParameter('EmployeeSkillI18n'));                 
        try
        {   
                     
            $this->item_i18n=new EmployeeSkillI18n($this->form->getDefault('skill_i18n'));               
            $this->form->bind($request->getPostParameter('EmployeeSkillI18n'),$request->getFiles('EmployeeSkillI18n'));                            
            if ($this->form->isValid())
            {              
                $this->item_i18n->add($this->form->getValuesForSkillI18n());
                $this->item_i18n->getSkill()->add($this->form->getValuesForSkill());  
                if ($this->item_i18n->getSkill()->isExist() || $this->item_i18n->isExist())
                    throw new mfException (__(" ContractSkill already exists"));                 
                $this->item_i18n->getSkill()->setIcon($this->form->getIcon());             
                $this->item_i18n->getSkill()->setPicture($this->form->getPicture());        
                $this->item_i18n->getSkill()->save();
                $this->item_i18n->save();
                $messages->addInfo(__('Employee Skill has been saved.'));
                $request->addRequestParameter('lang',$this->item_i18n->get('lang'));
                $this->forward($this->getModuleName(),'ajaxListPartialSkill');
            }   
            else
            {                    
              //  var_dump($this->form->getErrorSchema()->getErrorsMessage());
               $messages->addError(__('Form has some errors.'));              
               $this->item_i18n->getSkill()->add($this->form->getValuesForSkill());
               $this->item_i18n->add($this->form->getValuesForSkillI18n());   
            } 
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        }
   }

}

