<?php

require_once dirname(__FILE__)."/../locales/Forms/EmployerFunctionNewForm.class.php";

class employers_ajaxSaveNewFunctionI18nAction extends mfAction {
    
        
            
    function execute(mfWebRequest $request) {                       
        $messages = mfMessages::getInstance();                                  
        try
        {      
            $this->form= new EmployerFunctionNewForm($this->getUser()->getLanguage(),$request->getPostParameter('EmployerFunctionI18n'));             
            $this->item_i18n=new EmployerFunctionI18n();
            $this->form->bind($request->getPostParameter('EmployerFunctionI18n'),$request->getFiles('EmployerFunctionI18n'));
            if ($this->form->isValid())
            {
                $this->item_i18n->getFunction()->add($this->form['function']->getValues());
                $this->item_i18n->add($this->form['function_i18n']->getValues());
                 if ($this->item_i18n->getFunction()->isExist())
                    throw new mfException (__("Name already exists"));   
                if ($this->item_i18n->isExist())
                    throw new mfException (__("Title already exists"));                                       
                 $this->item_i18n->getFunction()->setIcon($this->form->getIcon());                
                $this->item_i18n->getFunction()->save();                                                                      
                $this->item_i18n->set('function_id',$this->item_i18n->getFunction());                                                                                                                                                                                  
                $this->item_i18n->save();
                $messages->addInfo(__("Function has been saved."));
                $request->addRequestParameter('lang',$this->item_i18n->get('lang'));
                $this->forward($this->getModuleName(),'ajaxListPartialFunction');
            }   
            else
            {               
                //var_dump($this->form->getErrorSchema()->getErrorsMessage());
                // Repopulate
                $this->item_i18n->add($this->form['function_i18n']->getValues());
                $this->item_i18n->getFunction()->add($this->form['function']->getValues());
                $messages->addError(__("Form has some errors.")); 
            }    
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        }    
    }

}
