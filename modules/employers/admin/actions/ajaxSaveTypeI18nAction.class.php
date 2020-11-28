<?php


 require_once dirname(__FILE__)."/../locales/Forms/EmployerContractTypeViewForm.class.php";
 
class  employers_ajaxSaveTypeI18nAction extends mfAction {
    
          
    function execute(mfWebRequest $request) {                    
        $messages = mfMessages::getInstance();     
        $this->form = new EmployerContractTypeViewForm($request->getPostParameter('EmployerContractTypeI18n'));                 
        try
        {   
                     
            $this->item_i18n=new EmployerContractTypeI18n($this->form->getDefault('type_i18n'));               
            $this->form->bind($request->getPostParameter('EmployerContractTypeI18n'),$request->getFiles('EmployerContractTypeI18n'));                            
            if ($this->form->isValid())
            {              
                $this->item_i18n->add($this->form->getValuesForContractTypeI18n());
                $this->item_i18n->getType()->add($this->form->getValuesForContractType());  
                if ($this->item_i18n->getType()->isExist() || $this->item_i18n->isExist())
                    throw new mfException (__(" ContractType already exists"));                 
                $this->item_i18n->getType()->setIcon($this->form->getIcon());             
                $this->item_i18n->getType()->save();
                $this->item_i18n->save();
                $messages->addInfo(__('ContractType has been saved.'));
                $request->addRequestParameter('lang',$this->item_i18n->get('lang'));
                $this->forward($this->getModuleName(),'ajaxListPartialType');
            }   
            else
            {                    
                var_dump($this->form->getErrorSchema()->getErrorsMessage());
               $messages->addError(__('Form has some errors.'));              
               $this->item_i18n->getType()->add($this->form->getValuesForContractType());
               $this->item_i18n->add($this->form->getValuesForContractTypeI18n());   
            } 
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        }
   }

}

