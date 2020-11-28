<?php

require_once dirname(__FILE__)."/../locales/Forms/SaleEmployeeCommissionNewForm.class.php";
 

class sales_ajaxNewEmployeeCommissionAction extends mfAction {
    
        
     
    function execute(mfWebRequest $request) {              
        $messages = mfMessages::getInstance();      
        $this->item = new SaleEmployeeCommission(); // new object       
        $this->form = new SaleEmployeeCommissionNewForm($request->getPostParameter('SaleEmployeeCommission'));      
        if (!$request->isMethod('POST') || !$request->getPostParameter('SaleEmployeeCommission'))
            return ;        
        try 
        {
            $this->form->bind($request->getPostParameter('SaleEmployeeCommission'));
            if ($this->form->isValid()) {
                $this->item->add($this->form->getValues());                   
                if ($this->item->isExist())
                    throw new mfException (__("Commission already exists"));                                                       
                $this->item->save();
                $messages->addInfo(__("Commission [%s] has been created.",$this->item->get('name')));                   
                $this->forward("sales","ajaxListPartialEmployeeCommission");
            }
            else
            {
               $messages->addError(__("Form has some errors."));   
               $this->item->add($request->getPostParameter('SaleEmployeeCommission')); // repopulate       
             //  var_dump($this->form->getErrorSchema()->getErrorsMessage());
            }    
        } 
        catch (mfException $e)
        {
           $messages->addError($e);
        }        
    }

}
