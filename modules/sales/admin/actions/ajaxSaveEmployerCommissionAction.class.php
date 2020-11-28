<?php

require_once dirname(__FILE__)."/../locales/Forms/SaleEmployerCommissionViewForm.class.php";
 

class sales_ajaxSaveEmployerCommissionAction extends mfAction {
    
        
     
    function execute(mfWebRequest $request) {              
        $messages = mfMessages::getInstance();       
        $this->item = new SaleEmployerCommission($request->getPostParameter('SaleEmployerCommission')); // new object       
        $this->form = new SaleEmployerCommissionViewForm();  
        if ($request->getPostParameter('SaleEmployerCommission') && $request->isMethod('POST'))
        {
            $this->form->bind($request->getPostParameter('SaleEmployerCommission'));
            try
            {
                 if ($this->form->isValid())
                 {
                     $this->item->add($this->form->getValues()); // repopulate     
                     if ($this->item->isExist())
                         throw new mfException(__("Commission already exists."));
                     $this->item->save();
                     $messages->addInfo(__("Commission [%s] has been updated.",$this->item->get('name')));                   
                     $this->forward("sales","ajaxListPartialEmployerCommission");
                 }    
                 else
                 {
                      $messages->addError(__("Form has some errors."));   
                      $this->item->add($request->getPostParameter('SaleEmployerCommission')); // repopulate      
                    //   var_dump($this->form->getErrorSchema()->getErrorsMessage());
                 }    
             }
             catch (mfException $e)
             {
                 $messages->addError($e);   
             } 
            }    
        }

}
