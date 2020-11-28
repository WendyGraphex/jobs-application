<?php

require_once dirname(__FILE__)."/../locales/Forms/EmployeeExperienceNewForm.class.php";

class employees_ajaxSaveNewExperienceI18nAction extends mfAction {
    
        
            
    function execute(mfWebRequest $request) {                       
        $messages = mfMessages::getInstance();                                  
        try
        {      
            $this->form= new EmployeeExperienceNewForm($this->getUser()->getLanguage(),$request->getPostParameter('EmployeeExperienceI18n'));             
            $this->item_i18n=new EmployeeExperienceI18n();
            $this->form->bind($request->getPostParameter('EmployeeExperienceI18n'),$request->getFiles('EmployeeExperienceI18n'));
            if ($this->form->isValid())
            {
                $this->item_i18n->getExperience()->add($this->form['experience']->getValues());
                $this->item_i18n->add($this->form['experience_i18n']->getValues());
                 if ($this->item_i18n->getExperience()->isExist())
                    throw new mfException (__("Name already exists"));   
                if ($this->item_i18n->isExist())
                    throw new mfException (__("Title already exists"));                                       
                 $this->item_i18n->getExperience()->setIcon($this->form->getIcon());                
                $this->item_i18n->getExperience()->save();                                                                      
                $this->item_i18n->set('experience_id',$this->item_i18n->getExperience());                                                                                                                                                                                  
                $this->item_i18n->save();
                $messages->addInfo(__("Experience has been saved."));
                $request->addRequestParameter('lang',$this->item_i18n->get('lang'));
                $this->forward($this->getModuleName(),'ajaxListPartialExperience');
            }   
            else
            {               
                 var_dump($this->form->getErrorSchema()->getErrorsMessage());
                // Repopulate
                $this->item_i18n->add($this->form['experience_i18n']->getValues());
                $this->item_i18n->getExperience()->add($this->form['experience']->getValues());
                $messages->addError(__("Form has some errors.")); 
            }    
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        }    
    }

}
