<?php

require_once dirname(__FILE__)."/../locales/Forms/SaleQuotationStateViewForm.class.php";
 
class  sales_quotation_ajaxSaveStateI18nAction extends mfAction {
    
          
    function execute(mfWebRequest $request) {                    
        $messages = mfMessages::getInstance();     
        $this->form = new SaleQuotationStateViewForm($request->getPostParameter('SaleQuotationStateI18n'));                 
        try
        {                        
            $this->item_i18n=new SaleQuotationStateI18n($this->form->getDefault('state_i18n'));               
            $this->form->bind($request->getPostParameter('SaleQuotationStateI18n'),$request->getFiles('SaleQuotationStateI18n'));                            
            if ($this->form->isValid())
            {              
                $this->item_i18n->add($this->form->getValuesForStateI18n());
                $this->item_i18n->getState()->add($this->form->getValuesForState());  
                if ($this->item_i18n->getState()->isExist() || $this->item_i18n->isExist())
                    throw new mfException (__(" State already exists"));                 
                $this->item_i18n->getState()->setIcon($this->form->getIcon());             
                $this->item_i18n->getState()->save();
                $this->item_i18n->save();
                $messages->addInfo(__('State has been saved.'));
                $request->addRequestParameter('lang',$this->item_i18n->get('lang'));
                $this->forward($this->getModuleName(),'ajaxListPartialState');
            }   
            else
            {                    
               // var_dump($this->form->getErrorSchema()->getErrorsMessage());
               $messages->addError(__('Form has some errors.'));              
               $this->item_i18n->getState()->add($this->form->getValuesForState());
               $this->item_i18n->add($this->form->getValuesForStateI18n());   
            } 
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        }
   }

}

