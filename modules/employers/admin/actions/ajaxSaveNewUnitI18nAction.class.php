<?php

require_once dirname(__FILE__)."/../locales/Forms/EmployerBudgetUnitNewForm.class.php";

class employers_ajaxSaveNewUnitI18nAction extends mfAction {
    
        
            
    function execute(mfWebRequest $request) {                       
        $messages = mfMessages::getInstance();                                  
        try
        {      
            $this->form= new EmployerBudgetUnitNewForm($this->getUser()->getLanguage(),$request->getPostParameter('EmployerBudgetUnitI18n'));             
            $this->item_i18n=new EmployerBudgetUnitI18n();
            $this->form->bind($request->getPostParameter('EmployerBudgetUnitI18n'),$request->getFiles('EmployerBudgetUnitI18n'));
            if ($this->form->isValid())
            {
                $this->item_i18n->getUnit()->add($this->form['unit']->getValues());
                $this->item_i18n->add($this->form['unit_i18n']->getValues());
                 if ($this->item_i18n->getUnit()->isExist())
                    throw new mfException (__("Name already exists"));   
                if ($this->item_i18n->isExist())
                    throw new mfException (__("Title already exists"));                                       
                 $this->item_i18n->getUnit()->setIcon($this->form->getIcon());                
                $this->item_i18n->getUnit()->save();                                                                      
                $this->item_i18n->set('unit_id',$this->item_i18n->getUnit());                                                                                                                                                                                  
                $this->item_i18n->save();
                $messages->addInfo(__("Budget Unit has been saved."));
                $request->addRequestParameter('lang',$this->item_i18n->get('lang'));
                $this->forward($this->getModuleName(),'ajaxListPartialUnit');
            }   
            else
            {               
                //var_dump($this->form->getErrorSchema()->getErrorsMessage());
                // Repopulate
                $this->item_i18n->add($this->form['unit_i18n']->getValues());
                $this->item_i18n->getUnit()->add($this->form['unit']->getValues());
                $messages->addError(__("Form has some errors.")); 
            }    
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        }    
    }

}
