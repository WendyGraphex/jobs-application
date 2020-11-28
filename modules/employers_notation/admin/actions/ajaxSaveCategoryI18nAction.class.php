<?php


 require_once dirname(__FILE__)."/../locales/Forms/EmployerNotationCategoryViewForm.class.php";
 
class  employers_notation_ajaxSaveCategoryI18nAction extends mfAction {
    
          
    function execute(mfWebRequest $request) {                    
        $messages = mfMessages::getInstance();     
        $this->form = new EmployerNotationCategoryViewForm($request->getPostParameter('EmployerNotationCategoryI18n'));                 
        try
        {   
                     
            $this->item_i18n=new EmployerNotationCategoryI18n($this->form->getDefault('category_i18n'));               
            $this->form->bind($request->getPostParameter('EmployerNotationCategoryI18n'),$request->getFiles('EmployerNotationCategoryI18n'));                            
            if ($this->form->isValid())
            {              
                $this->item_i18n->add($this->form->getValuesForCategoryI18n());
                $this->item_i18n->getCategory()->add($this->form->getValuesForCategory());  
                if ($this->item_i18n->getCategory()->isExist() || $this->item_i18n->isExist())
                    throw new mfException (__(" CEmployer Notation Category already exists"));                 
                $this->item_i18n->getCategory()->setIcon($this->form->getIcon());             
                $this->item_i18n->getCategory()->save();
                $this->item_i18n->save();
                $messages->addInfo(__('Employer Notation Category has been saved.'));
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

