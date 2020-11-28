<?php


 require_once dirname(__FILE__)."/../locales/Forms/EmployeeNotationCategoryViewForm.class.php";
 
class  employees_notation_ajaxSaveCategoryI18nAction extends mfAction {
    
          
    function execute(mfWebRequest $request) {                    
        $messages = mfMessages::getInstance();     
        $this->form = new EmployeeNotationCategoryViewForm($request->getPostParameter('EmployeeNotationCategoryI18n'));                 
        try
        {   
                     
            $this->item_i18n=new EmployeeNotationCategoryI18n($this->form->getDefault('category_i18n'));               
            $this->form->bind($request->getPostParameter('EmployeeNotationCategoryI18n'),$request->getFiles('EmployeeNotationCategoryI18n'));                            
            if ($this->form->isValid())
            {              
                $this->item_i18n->add($this->form->getValuesForCategoryI18n());
                $this->item_i18n->getCategory()->add($this->form->getValuesForCategory());  
                if ($this->item_i18n->getCategory()->isExist() || $this->item_i18n->isExist())
                    throw new mfException (__("Employee Notation Category already exists"));                 
                $this->item_i18n->getCategory()->setIcon($this->form->getIcon());             
                $this->item_i18n->getCategory()->save();
                $this->item_i18n->save();
                $messages->addInfo(__('Employee Notation Category has been saved.'));
                $request->addRequestParameter('lang',$this->item_i18n->get('lang'));
                $this->forward($this->getModuleName(),'ajaxListPartialCategory');
            }   
            else
            {                    
              //   var_dump($this->form->getErrorSchema()->getErrorsMessage());
               $messages->addError(__('Form has some errors.'));              
               $this->item_i18n->getCategory()->add($this->form->getValuesForCategory());
               $this->item_i18n->add($this->form->getValuesForCategoryI18n());   
            } 
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        }
   }

}

