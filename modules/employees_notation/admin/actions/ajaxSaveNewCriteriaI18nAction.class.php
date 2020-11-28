<?php

require_once dirname(__FILE__)."/../locales/Forms/EmployeeNotationCriteriaNewForm.class.php";

class employees_notation_ajaxSaveNewCriteriaI18nAction extends mfAction {
    
        
            
    function execute(mfWebRequest $request) {                       
        $messages = mfMessages::getInstance();                                  
        try
        {      
            $this->form= new EmployeeNotationCriteriaNewForm($this->getUser()->getLanguage(),$request->getPostParameter('EmployeeNotationCriteriaI18n'));             
            $this->item_i18n=new EmployeeNotationCriteriaI18n();
            $this->form->bind($request->getPostParameter('EmployeeNotationCriteriaI18n'),$request->getFiles('EmployeeNotationCriteriaI18n'));
            if ($this->form->isValid())
            {
                $this->item_i18n->getCriteria()->add($this->form['criteria']->getValues());
                $this->item_i18n->add($this->form['criteria_i18n']->getValues());
                 if ($this->item_i18n->getCriteria()->isExist())
                    throw new mfException (__("Name already exists"));   
                if ($this->item_i18n->isExist())
                    throw new mfException (__("Title already exists"));                                       
                 $this->item_i18n->getCriteria()->setIcon($this->form->getIcon());                
                $this->item_i18n->getCriteria()->save();                                                                      
                $this->item_i18n->set('criteria_id',$this->item_i18n->getCriteria());                                                                                                                                                                                  
                $this->item_i18n->save();
                $messages->addInfo(__("Employee criteria has been saved."));
                $request->addRequestParameter('lang',$this->item_i18n->get('lang'));
                $this->forward($this->getModuleName(),'ajaxListPartialCriteria');
            }   
            else
            {               
               //  var_dump($this->form->getErrorSchema()->getErrorsMessage());
                // Repopulate
                $this->item_i18n->add($this->form['criteria_i18n']->getValues());
                $this->item_i18n->getCriteria()->add($this->form['criteria']->getValues());
                $messages->addError(__("Form has some errors.")); 
            }    
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        }    
    }

}
