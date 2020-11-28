<?php

require_once dirname(__FILE__)."/../locales/Forms/SaleTaxViewForm.class.php";
 
 
class sales_ajaxSaveTaxAction extends mfAction {
    
    
    function execute(mfWebRequest $request) {              
        $messages = mfMessages::getInstance();
            
        try
        {        
                $this->item=new SaleTax($request->getPostParameter('SaleTax'));                
                $this->form = new SaleTaxViewForm();
                if ($this->item->isNotLoaded() || !$request->getPostParameter('SaleTax') || !$request->isMethod('POST'))
                    return ;                             
                $this->form->bind($request->getPostParameter('SaleTax'));
                if ($this->form->isValid()) 
                {
                    $this->item->add($this->form->getValues());    
                    if ($this->item->isExist())
                        throw new mfException (__("Tax already exists"));
                    $this->item->save();                        
                    $messages->addInfo(__("Tax [%s] has been saved.",$this->item->getFormattedTax()));
                    $this->forward('sales','ajaxListPartialTax');
                }
                else
                {
                    $this->item->add($request->getPostParameter('SaleTax'));    // Repopulate
                  //  $messages->addErrors($this->form->getErrorSchema()->getErrors()); // For debug only
                   $messages->addError(__("Form has some errors."));
                }                  
        }
        catch (mfException $e)
        {
          //  var_dump(mfSiteDatabase::getInstance()->getQuery());
            $messages->addError($e);
        }      
    }

}

