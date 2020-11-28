<?php

require_once dirname(__FILE__)."/../locales/Forms/EmployeeNotationCategoryNewForm.class.php";

class employees_notation_ajaxSaveNewCategoryI18nAction extends mfAction {
    
        
            
    function execute(mfWebRequest $request) {                       
        $messages = mfMessages::getInstance();                                  
        try
        {      
            $this->form= new EmployeeNotationCategoryNewForm($this->getUser()->getLanguage(),$request->getPostParameter('EmployeeNotationCategoryI18n'));             
            $this->item_i18n=new EmployeeNotationCategoryI18n();
            $this->form->bind($request->getPostParameter('EmployeeNotationCategoryI18n'),$request->getFiles('EmployeeNotationCategoryI18n'));
            if ($this->form->isValid())
            {
                $this->item_i18n->getCategory()->add($this->form['category']->getValues());
                $this->item_i18n->add($this->form['category_i18n']->getValues());
                 if ($this->item_i18n->getCategory()->isExist())
                    throw new mfException (__("Name already exists"));   
                if ($this->item_i18n->isExist())
                    throw new mfException (__("Title already exists"));                                       
                 $this->item_i18n->getCategory()->setIcon($this->form->getIcon());                
                $this->item_i18n->getCategory()->save();                                                                      
                $this->item_i18n->set('category_id',$this->item_i18n->getCategory());                                                                                                                                                                                  
                $this->item_i18n->save();
                $messages->addInfo(__("Employee Notation category has been saved."));
                $request->addRequestParameter('lang',$this->item_i18n->get('lang'));
                $this->forward($this->getModuleName(),'ajaxListPartialCategory');
            }   
            else
            {               
                 var_dump($this->form->getErrorSchema()->getErrorsMessage());
                // Repopulate
                $this->item_i18n->add($this->form['category_i18n']->getValues());
                $this->item_i18n->getCategory()->add($this->form['category']->getValues());
                $messages->addError(__("Form has some errors.")); 
            }    
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        }    
    }

}
