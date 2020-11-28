<?php

require_once dirname(__FILE__)."/../locales/Forms/CustomerAbuseTypeNewForm.class.php";

class customers_contact_ajaxSaveNewAbuseTypeI18nAction extends mfAction {
    
        
            
    function execute(mfWebRequest $request) {                       
        $messages = mfMessages::getInstance();                                  
        try
        {      
            $this->form= new CustomerAbuseTypeNewForm($this->getUser()->getLanguage(),$request->getPostParameter('CustomerAbuseTypeI18n'));             
            $this->item_i18n=new CustomerAbuseTypeI18n();
            $this->form->bind($request->getPostParameter('CustomerAbuseTypeI18n'),$request->getFiles('CustomerAbuseTypeI18n'));
            if ($this->form->isValid())
            {
                $this->item_i18n->getAbuse()->add($this->form['abuse']->getValues());
                $this->item_i18n->add($this->form['abuse_i18n']->getValues());
                 if ($this->item_i18n->getAbuse()->isExist())
                    throw new mfException (__("Name already exists"));   
                if ($this->item_i18n->isExist())
                    throw new mfException (__("Title already exists"));                                       
                 $this->item_i18n->getAbuse()->setIcon($this->form->getIcon());                
                $this->item_i18n->getAbuse()->save();                                                                      
                $this->item_i18n->set('abuse_id',$this->item_i18n->getAbuse());                                                                                                                                                                                  
                $this->item_i18n->save();
                $messages->addInfo(__("Customer abuse has been saved."));
                $request->addRequestParameter('lang',$this->item_i18n->get('lang'));
                $this->forward($this->getModuleName(),'ajaxListPartialAbuseType');
            }   
            else
            {               
                // var_dump($this->form->getErrorSchema()->getErrorsMessage());
                // Repopulate
                $this->item_i18n->add($this->form['abuse_i18n']->getValues());
                $this->item_i18n->getAbuse()->add($this->form['abuse']->getValues());
                $messages->addError(__("Form has some errors.")); 
            }    
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        }    
    }

}
