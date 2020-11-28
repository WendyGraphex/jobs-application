<?php


 require_once dirname(__FILE__)."/../locales/Forms/EmployeeFunctionViewForm.class.php";
 
class  employees_ajaxSaveFunctionI18nAction extends mfAction {
    
          
    function execute(mfWebRequest $request) {                    
        $messages = mfMessages::getInstance();     
        $this->form = new EmployeeFunctionViewForm($request->getPostParameter('EmployeeFunctionI18n'));                 
        try
        {   
                     
            $this->item_i18n=new EmployeeFunctionI18n($this->form->getDefault('function_i18n'));               
            $this->form->bind($request->getPostParameter('EmployeeFunctionI18n'),$request->getFiles('EmployeeFunctionI18n'));                            
            if ($this->form->isValid())
            {              
                $this->item_i18n->add($this->form->getValuesForFunctionI18n());
                $this->item_i18n->getFunction()->add($this->form->getValuesForFunction());  
                if ($this->item_i18n->getFunction()->isExist() || $this->item_i18n->isExist())
                    throw new mfException (__("Function already exists"));                 
                $this->item_i18n->getFunction()->setIcon($this->form->getIcon());             
                $this->item_i18n->getFunction()->save();
                $this->item_i18n->save();
                $messages->addInfo(__('Function has been saved.'));
                $request->addRequestParameter('lang',$this->item_i18n->get('lang'));
                $this->forward($this->getModuleName(),'ajaxListPartialFunction');
            }   
            else
            {                    
             //   var_dump($this->form->getErrorSchema()->getErrorsMessage());
               $messages->addError(__('Form has some errors.'));              
               $this->item_i18n->getFunction()->add($this->form->getValuesForFunction());
               $this->item_i18n->add($this->form->getValuesForFunctionI18n());   
            } 
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        }
   }

}

