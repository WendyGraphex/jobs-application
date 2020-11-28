<?php

require_once __DIR__."/../locales/Forms/SystemModelEmailNewForm.class.php";

class system_emails_ajaxSaveNewModelI18nAction extends mfAction {
    
        
            
    function execute(mfWebRequest $request) {                     
        $messages = mfMessages::getInstance();                                     
        try
        {      
            $this->form= new SystemModelEmailNewForm($this->getUser()->getCountry(),$request->getPostParameter('SystemModelEmail'));             
            $this->item_i18n=new SystemModelEmailI18n();
            $this->form->bind($request->getPostParameter('SystemModelEmail'));
            if ($this->form->isValid())
            {
                $this->item_i18n->getModel()->add($this->form['model']->getValues());
                $this->item_i18n->add($this->form['model_i18n']->getValues());
                if ($this->item_i18n->getModel()->isExist())
                    throw new mfException (__("Model already exists."));                                                      
                if ($this->item_i18n->isExist())
                    throw new mfException (__("Model already exists"));          
                $this->item_i18n->getModel()->save();
                $this->item_i18n->set('model_id',$this->item_i18n->getModel());  
                $this->item_i18n->save();
                $messages->addInfo(__("Model [%s] has been created.",$this->item_i18n->get('value')));
                $request->addRequestParameter('lang',$this->item_i18n->get('lang'));
                $this->forward('system_emails','ajaxListPartialModel');
            }   
            else
            {               
                // Repopulate
                $this->item_i18n->add($this->form['model_i18n']->getValues());
                $this->item_i18n->getModel()->add($this->form['model']->getValues());
                $messages->addError("Form has some errors."); 
            }    
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        }    
    }

}
