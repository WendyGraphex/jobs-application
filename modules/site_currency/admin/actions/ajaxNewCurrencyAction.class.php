<?php

require_once __DIR__."/../locales/Forms/SiteCurrencyNewForm.class.php";
 
class site_currency_ajaxNewCurrencyAction extends mfAction {

    
     
    function execute(mfWebRequest $request) {      
        $messages = mfMessages::getInstance();      
        try 
        {        
            $this->form = new SiteCurrencyNewForm();   
            $this->item = new SiteCurrency($request->getPostParameter('SiteCurrency'));
            if (!$request->isMethod('POST') || !$request->getPostParameter('SiteCurrency'))
                return ;
            $this->form->bind($request->getPostParameter('SiteCurrency'));
            if ($this->form->isValid())
            {
                $this->item->add($this->form->getValues());
                if ($this->item->isExist())
                    throw new mfException(__('Currency already exists'));
                $this->item->save();
                $messages->addError(__('Currency has been created.'));
                $this->forward($this->getModuleName(), 'ajaxListPartialCurrency');
            }   
            else
            {
                $messages->addError(__('Form has some errors.'));
                $this->item->add($request->getPostParameter('SiteCurrency'));
            }    
        } 
        catch (mfException $e)
        {
           $messages->addError($e);
        }      
    }

}