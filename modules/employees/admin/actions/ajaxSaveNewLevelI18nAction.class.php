<?php

require_once dirname(__FILE__)."/../locales/Forms/EmployeeStudyLevelNewForm.class.php";

class employees_ajaxSaveNewLevelI18nAction extends mfAction {
    
        
            
    function execute(mfWebRequest $request) {                       
        $messages = mfMessages::getInstance();                                  
        try
        {      
            $this->form= new EmployeeStudyLevelNewForm($this->getUser()->getLanguage(),$request->getPostParameter('EmployeeStudyLevelI18n'));             
            $this->item_i18n=new EmployeeStudyLevelI18n();
            $this->form->bind($request->getPostParameter('EmployeeStudyLevelI18n'),$request->getFiles('EmployeeStudyLevelI18n'));
            if ($this->form->isValid())
            {
                $this->item_i18n->getLevel()->add($this->form['level']->getValues());
                $this->item_i18n->add($this->form['level_i18n']->getValues());
                 if ($this->item_i18n->getLevel()->isExist())
                    throw new mfException (__("Name already exists"));   
                if ($this->item_i18n->isExist())
                    throw new mfException (__("Title already exists"));                                       
                 $this->item_i18n->getLevel()->setIcon($this->form->getIcon());                
                $this->item_i18n->getLevel()->save();                                                                      
                $this->item_i18n->set('level_id',$this->item_i18n->getLevel());                                                                                                                                                                                  
                $this->item_i18n->save();
                $messages->addInfo(__("Contrac tLevel has been saved."));
                $request->addRequestParameter('lang',$this->item_i18n->get('lang'));
                $this->forward($this->getModuleName(),'ajaxListPartialLevel');
            }   
            else
            {               
                //var_dump($this->form->getErrorSchema()->getErrorsMessage());
                // Repopulate
                $this->item_i18n->add($this->form['level_i18n']->getValues());
                $this->item_i18n->getLevel()->add($this->form['level']->getValues());
                $messages->addError(__("Form has some errors.")); 
            }    
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        }    
    }

}
