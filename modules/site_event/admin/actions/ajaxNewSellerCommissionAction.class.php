<?php

require_once dirname(__FILE__)."/../locales/Forms/SiteEventSellerCommissionNewForm.class.php";
 

class site_event_ajaxNewSellerCommissionAction extends mfAction {
    
        
     
    function execute(mfWebRequest $request) {              
        $messages = mfMessages::getInstance();      
        $this->item = new SiteEventSellerCommission(); // new object       
        $this->form = new SiteEventSellerCommissionNewForm($request->getPostParameter('SiteEventSellerCommission'));      
        if (!$request->isMethod('POST') || !$request->getPostParameter('SiteEventSellerCommission'))
            return ;        
        try 
        {
            $this->form->bind($request->getPostParameter('SiteEventSellerCommission'));
            if ($this->form->isValid()) {
                $this->item->add($this->form->getValues());                   
                if ($this->item->isExist())
                    throw new mfException (__("Commission already exists"));                                                       
                $this->item->save();
                $messages->addInfo(__("Commission [%s] has been created.",$this->item->get('name')));                   
                $this->forward("site_event","ajaxListPartialSellerCommission");
            }
            else
            {
               $messages->addError(__("Form has some errors."));   
               $this->item->add($request->getPostParameter('SiteEventSellerCommission')); // repopulate       
             //  var_dump($this->form->getErrorSchema()->getErrorsMessage());
            }    
        } 
        catch (mfException $e)
        {
           $messages->addError($e);
        }        
    }

}
