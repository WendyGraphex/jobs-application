<?php

require_once __DIR__."/../locales/Forms/SiteCurrencyViewForm.class.php";
 

class site_currency_ajaxSaveCurrencyAction extends mfAction {
    
   
    function execute(mfWebRequest $request) {      
        $messages = mfMessages::getInstance();       
        try
        {        
                $this->item=new SiteCurrency($request->getPostParameter('SiteCurrency'));   
                if ($this->item->isNotLoaded() || !$request->isMethod('Post') || !$request->getPostParameter('SiteCurrency'))
                   return ;
                $this->form = new SiteCurrencyViewForm();
                $this->form->bind($request->getPostParameter('SiteCurrency'));
                if ($this->form->isValid()) {
                    $this->item->add($this->form->getValues());    
                    if ($this->item->isExist())
                        throw new mfException (__("Currency already exists"));
                    $this->item->save();                        
                    $messages->addInfo(__("Currency for site [%s] has been saved.",$this->item->get('code')));
                    $this->forward('site_currency','ajaxListPartialCurrency');
                }
                else
                {
                   $this->item->add($request->getPostParameter('SiteCurrency'));    // Repopulate                     
                   $messages->addError(__("Form has some errors."));
                }    
             
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        }      
    }

}

