<?php


 require_once dirname(__FILE__)."/../locales/Forms/CustomerClaimTypeViewForm.class.php";
 
class  customers_ajaxSaveTypeI18nAction extends mfAction {
    
          
    function execute(mfWebRequest $request) {                    
        $messages = mfMessages::getInstance();     
        $this->form = new CustomerClaimTypeViewForm($request->getPostParameter('CustomerClaimTypeI18n'));                 
        try
        {   
                     
            $this->item_i18n=new CustomerClaimTypeI18n($this->form->getDefault('type_i18n'));               
            $this->form->bind($request->getPostParameter('CustomerClaimTypeI18n'),$request->getFiles('CustomerClaimTypeI18n'));                            
            if ($this->form->isValid())
            {              
                $this->item_i18n->add($this->form->getValuesForTypeI18n());
                $this->item_i18n->getType()->add($this->form->getValuesForType());  
                if ($this->item_i18n->getType()->isExist() || $this->item_i18n->isExist())
                    throw new mfException (__(" Type already exists"));                 
                $this->item_i18n->getType()->setIcon($this->form->getIcon());             
                $this->item_i18n->getType()->save();
                $this->item_i18n->save();
                $messages->addInfo(__('Type has been saved.'));
                $request->addRequestParameter('lang',$this->item_i18n->get('lang'));
                $this->forward($this->getModuleName(),'ajaxListPartialType');
            }   
            else
            {                    
                var_dump($this->form->getErrorSchema()->getErrorsMessage());
               $messages->addError(__('Form has some errors.'));              
               $this->item_i18n->getType()->add($this->form->getValuesForType());
               $this->item_i18n->add($this->form->getValuesForTypeI18n());   
            } 
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        }
   }

}

