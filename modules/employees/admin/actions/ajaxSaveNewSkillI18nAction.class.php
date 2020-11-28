<?php

require_once dirname(__FILE__)."/../locales/Forms/EmployeeSkillNewForm.class.php";

class employees_ajaxSaveNewSkillI18nAction extends mfAction {
    
        
            
    function execute(mfWebRequest $request) {                       
        $messages = mfMessages::getInstance();                                  
        try
        {      
            $this->form= new EmployeeSkillNewForm($this->getUser()->getLanguage(),$request->getPostParameter('EmployeeSkillI18n'));             
            $this->item_i18n=new EmployeeSkillI18n();
            $this->form->bind($request->getPostParameter('EmployeeSkillI18n'),$request->getFiles('EmployeeSkillI18n'));
            if ($this->form->isValid())
            {
                $this->item_i18n->getSkill()->add($this->form['skill']->getValues());
                $this->item_i18n->add($this->form['skill_i18n']->getValues());
                 if ($this->item_i18n->getSkill()->isExist())
                    throw new mfException (__("Name already exists"));   
                if ($this->item_i18n->isExist())
                    throw new mfException (__("Title already exists"));                                       
                $this->item_i18n->getSkill()->setIcon($this->form->getIcon());                
                $this->item_i18n->getSkill()->setPicture($this->form->getPicture());           
                $this->item_i18n->getSkill()->save();                                                                      
                $this->item_i18n->set('skill_id',$this->item_i18n->getSkill());                                                                                                                                                                                  
                $this->item_i18n->save();
                $messages->addInfo(__("Employee skill has been saved."));
                $request->addRequestParameter('lang',$this->item_i18n->get('lang'));
                $this->forward($this->getModuleName(),'ajaxListPartialSkill');
            }   
            else
            {               
                 var_dump($this->form->getErrorSchema()->getErrorsMessage());
                // Repopulate
                $this->item_i18n->add($this->form['skill_i18n']->getValues());
                $this->item_i18n->getSkill()->add($this->form['skill']->getValues());
                $messages->addError(__("Form has some errors.")); 
            }    
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        }    
    }

}
