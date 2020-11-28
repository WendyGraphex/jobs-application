<?php


 require_once dirname(__FILE__)."/../locales/Forms/CustomerAbuseTypeViewForm.class.php";
 
class  customers_contact_ajaxSaveAbuseTypeI18nAction extends mfAction {
    
          
    function execute(mfWebRequest $request) {                    
        $messages = mfMessages::getInstance();     
        $this->form = new CustomerAbuseTypeViewForm($request->getPostParameter('CustomerAbuseTypeI18n'));                 
        try
        {   
                     
            $this->item_i18n=new CustomerAbuseTypeI18n($this->form->getDefault('abuse_i18n'));               
            $this->form->bind($request->getPostParameter('CustomerAbuseTypeI18n'),$request->getFiles('CustomerAbuseTypeI18n'));                            
            if ($this->form->isValid())
            {              
                $this->item_i18n->add($this->form->getValuesForAbuseTypeI18n());
                $this->item_i18n->getAbuse()->add($this->form->getValuesForAbuseType());  
                if ($this->item_i18n->getAbuse()->isExist() || $this->item_i18n->isExist())
                    throw new mfException (__(" ContractAbuseType already exists"));                 
                $this->item_i18n->getAbuse()->setIcon($this->form->getIcon());             
                $this->item_i18n->getAbuse()->save();
                $this->item_i18n->save();
                $messages->addInfo(__('Customer Abuse Type has been saved.'));
                $request->addRequestParameter('lang',$this->item_i18n->get('lang'));
                $this->forward($this->getModuleName(),'ajaxListPartialAbuseType');
            }   
            else
            {                    
              //   var_dump($this->form->getErrorSchema()->getErrorsMessage());
               $messages->addError(__('Form has some errors.'));              
               $this->item_i18n->getAbuse()->add($this->form->getValuesForAbuseType());
               $this->item_i18n->add($this->form->getValuesForAbuseTypeI18n());   
            } 
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        }
   }

}

