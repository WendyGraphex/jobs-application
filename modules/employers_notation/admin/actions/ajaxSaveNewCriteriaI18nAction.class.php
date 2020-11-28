<?php

require_once dirname(__FILE__)."/../locales/Forms/EmployerNotationCriteriaNewForm.class.php";

class employers_notation_ajaxSaveNewCriteriaI18nAction extends mfAction {
    
        
            
    function execute(mfWebRequest $request) {                       
        $messages = mfMessages::getInstance();                                  
        try
        {      
            $this->form= new EmployerNotationCriteriaNewForm($this->getUser()->getLanguage(),$request->getPostParameter('EmployerNotationCriteriaI18n'));             
            $this->item_i18n=new EmployerNotationCriteriaI18n();
            $this->form->bind($request->getPostParameter('EmployerNotationCriteriaI18n'),$request->getFiles('EmployerNotationCriteriaI18n'));
            if ($this->form->isValid())
            {
              //  var_dump($this->form['criteria']->getValues());
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
                $messages->addInfo(__("Employer criteria has been saved."));
                $request->addRequestParameter('lang',$this->item_i18n->get('lang'));
                $this->forward($this->getModuleName(),'ajaxListPartialCriteria');
            }   
            else
            {               
                 var_dump($this->form->getErrorSchema()->getErrorsMessage());
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
