<?php

require_once dirname(__FILE__)."/../locales/Forms/SaleEmployerCommissionNewForm.class.php";
 

class sales_ajaxNewEmployerCommissionAction extends mfAction {
    
        
     
    function execute(mfWebRequest $request) {              
        $messages = mfMessages::getInstance();      
        $this->item = new SaleEmployerCommission(); // new object       
        $this->form = new SaleEmployerCommissionNewForm($request->getPostParameter('SaleEmployerCommission'));      
        if (!$request->isMethod('POST') || !$request->getPostParameter('SaleEmployerCommission'))
            return ;        
        try 
        {
            $this->form->bind($request->getPostParameter('SaleEmployerCommission'));
            if ($this->form->isValid()) {
                $this->item->add($this->form->getValues());                   
                if ($this->item->isExist())
                    throw new mfException (__("Commission already exists"));                                                       
                $this->item->save();
                $messages->addInfo(__("Commission [%s] has been created.",$this->item->get('name')));                   
                $this->forward("sales","ajaxListPartialEmployerCommission");
            }
            else
            {
               $messages->addError(__("Form has some errors."));   
               $this->item->add($request->getPostParameter('SaleEmployerCommission')); // repopulate       
             //  var_dump($this->form->getErrorSchema()->getErrorsMessage());
            }    
        } 
        catch (mfException $e)
        {
           $messages->addError($e);
        }        
    }

}
