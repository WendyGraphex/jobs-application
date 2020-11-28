<?php

require_once dirname(__FILE__)."/../locales/Forms/CustomerClaimTypeNewForm.class.php";

class customers_ajaxSaveNewTypeI18nAction extends mfAction {
    
        
            
    function execute(mfWebRequest $request) {                       
        $messages = mfMessages::getInstance();                                  
        try
        {      
            $this->form= new CustomerClaimTypeNewForm($this->getUser()->getLanguage(),$request->getPostParameter('CustomerClaimTypeI18n'));             
            $this->item_i18n=new CustomerClaimTypeI18n();
            $this->form->bind($request->getPostParameter('CustomerClaimTypeI18n'),$request->getFiles('CustomerClaimTypeI18n'));
            if ($this->form->isValid())
            {
                $this->item_i18n->getType()->add($this->form['type']->getValues());
                $this->item_i18n->add($this->form['type_i18n']->getValues());
                 if ($this->item_i18n->getType()->isExist())
                    throw new mfException (__("Name already exists"));   
                if ($this->item_i18n->isExist())
                    throw new mfException (__("Title already exists"));                                       
                 $this->item_i18n->getType()->setIcon($this->form->getIcon());                
                $this->item_i18n->getType()->save();                                                                      
                $this->item_i18n->set('type_id',$this->item_i18n->getType());                                                                                                                                                                                  
                $this->item_i18n->save();
                $messages->addInfo(__("Claim Type has been saved."));
                $request->addRequestParameter('lang',$this->item_i18n->get('lang'));
                $this->forward($this->getModuleName(),'ajaxListPartialType');
            }   
            else
            {               
             //  var_dump($this->form->getErrorSchema()->getErrorsMessage());
                // Repopulate
                $this->item_i18n->add($this->form['type_i18n']->getValues());
                $this->item_i18n->getType()->add($this->form['type']->getValues());
                $messages->addError(__("Form has some errors.")); 
            }    
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        }    
    }

}
