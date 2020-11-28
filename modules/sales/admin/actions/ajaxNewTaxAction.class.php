<?php

require_once __DIR__."/../locales/Forms/SaleTaxNewForm.class.php";

class sales_ajaxNewTaxAction extends mfAction {
    
  
    function execute(mfWebRequest $request) {
      
        $messages = mfMessages::getInstance(); 
             
        $this->form= new SaleTaxNewForm($request->getPostParameter('SaleTax'));             
        $this->item=new SaleTax();      
        if (!$request->isMethod('POST') || !$request->getPostParameter('SaleTax'))
            return ;
        try
        {
            $this->form->bind($request->getPostParameter('SaleTax'));
            if ($this->form->isvalid())
            {
                $this->item->add($this->form->getValues());
                if ($this->item->isExist()) 
                     throw new mfException (__("Tax already exists.")); 
                $this->item->save();
                $messages->addInfo(__('Tax has been created.'));             
                $this->forward('sales','ajaxListPartialTax');
            }   
            else
            {
               // var_dump($this->form->getErrorSchema()->getErrorsMessage());
                $messages->addError(__('Form has some errors.'));             
                $this->item->add($this->form->getDefaults());
            }
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        }
    }
}
