<?php

require_once dirname(__FILE__)."/../locales/Forms/SaleEmployeeCommissionViewForm.class.php";
 

class sales_ajaxSaveEmployeeCommissionAction extends mfAction {
    
        
     
    function execute(mfWebRequest $request) {              
        $messages = mfMessages::getInstance();       
        $this->item = new SaleEmployeeCommission($request->getPostParameter('SaleEmployeeCommission')); // new object       
        $this->form = new SaleEmployeeCommissionViewForm();  
        if ($request->getPostParameter('SaleEmployeeCommission') && $request->isMethod('POST'))
        {
            $this->form->bind($request->getPostParameter('SaleEmployeeCommission'));
            try
            {
                 if ($this->form->isValid())
                 {
                     $this->item->add($this->form->getValues()); // repopulate     
                     if ($this->item->isExist())
                         throw new mfException(__("Commission already exists."));
                     $this->item->save();
                     $messages->addInfo(__("Commission [%s] has been updated.",$this->item->get('name')));                   
                     $this->forward("sales","ajaxListPartialEmployeeCommission");
                 }    
                 else
                 {
                      $messages->addError(__("Form has some errors."));   
                      $this->item->add($request->getPostParameter('SaleEmployeeCommission')); // repopulate      
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
