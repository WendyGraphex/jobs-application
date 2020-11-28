<?php

require_once dirname(__FILE__)."/../locales/Forms/SiteEventSellerCommissionViewForm.class.php";
 

class site_event_ajaxSaveSellerCommissionAction extends mfAction {
    
        
     
    function execute(mfWebRequest $request) {              
        $messages = mfMessages::getInstance();       
        $this->item = new SiteEventSellerCommission($request->getPostParameter('SiteEventSellerCommission')); // new object       
        $this->form = new SiteEventSellerCommissionViewForm();  
        if ($request->getPostParameter('SiteEventSellerCommission') && $request->isMethod('POST'))
        {
            $this->form->bind($request->getPostParameter('SiteEventSellerCommission'));
            try
            {
                 if ($this->form->isValid())
                 {
                     $this->item->add($this->form->getValues()); // repopulate     
                     if ($this->item->isExist())
                         throw new mfException(__("Commission already exists."));
                     $this->item->save();
                     $messages->addInfo(__("Commission [%s] has been updated.",$this->item->get('name')));                   
                     $this->forward("site_event","ajaxListPartialSellerCommission");
                 }    
                 else
                 {
                      $messages->addError(__("Form has some errors."));   
                      $this->item->add($request->getPostParameter('SiteEventSellerCommission')); // repopulate      
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
