<?php

require_once dirname(__FILE__)."/../locales/Forms/SaleQuotationStateNewForm.class.php";

class sales_quotation_ajaxSaveNewStateI18nAction extends mfAction {
    
        
            
    function execute(mfWebRequest $request) {                       
        $messages = mfMessages::getInstance();                                  
        try
        {      
            $this->form= new SaleQuotationStateNewForm($this->getUser()->getLanguage(),$request->getPostParameter('SaleQuotationStateI18n'));             
            $this->item_i18n=new SaleQuotationStateI18n();
            $this->form->bind($request->getPostParameter('SaleQuotationStateI18n'),$request->getFiles('SaleQuotationStateI18n'));
            if ($this->form->isValid())
            {
                $this->item_i18n->getState()->add($this->form['state']->getValues());
                $this->item_i18n->add($this->form['state_i18n']->getValues());
                 if ($this->item_i18n->getState()->isExist())
                    throw new mfException (__("Name already exists"));   
                if ($this->item_i18n->isExist())
                    throw new mfException (__("Title already exists"));                                       
                 $this->item_i18n->getState()->setIcon($this->form->getIcon());                
                $this->item_i18n->getState()->save();                                                                      
                $this->item_i18n->set('state_id',$this->item_i18n->getState());                                                                                                                                                                                  
                $this->item_i18n->save();
                $messages->addInfo(__("State has been saved."));
                $request->addRequestParameter('lang',$this->item_i18n->get('lang'));
                $this->forward($this->getModuleName(),'ajaxListPartialState');
            }   
            else
            {               
                //var_dump($this->form->getErrorSchema()->getErrorsMessage());
                // Repopulate
                $this->item_i18n->add($this->form['state_i18n']->getValues());
                $this->item_i18n->getState()->add($this->form['state']->getValues());
                $messages->addError(__("Form has some errors.")); 
            }    
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        }    
    }

}
