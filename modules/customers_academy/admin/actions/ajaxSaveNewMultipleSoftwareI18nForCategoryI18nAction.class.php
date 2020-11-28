<?php

require_once dirname(__FILE__)."/../locales/Forms/CustomerAcademySoftwareI18nForCategoryI18nMultipleNewForm.class.php";

class customers_academy_ajaxSaveNewMultipleSoftwareI18nForCategoryI18nAction extends mfAction {
           
    function execute(mfWebRequest $request) {              
        $messages = mfMessages::getInstance();                                             
        try
        {  
            $this->category_i18n=new CustomerCourseCategoryI18n($request->getPostParameter('CustomerCourseCategoryI18n')); 
            if ($this->category_i18n->getCategory()->isNotLoaded())
                return ;
            $this->form= new CustomerAcademySoftwareI18nForCategoryI18nMultipleNewForm($this->category_i18n,$request->getPostParameter('CustomerAcademySoftwareI18nMultiple'));   
            $this->form->bind($request->getPostParameter('CustomerAcademySoftwareI18nMultiple'));
            if ($this->form->isValid())
            {    
                CustomerAcademySoftwareI18n::create($this->category_i18n->getCategory(),$this->form->getValues(),$this->form->getLanguage());
                $messages->addInfo(__("Softwares have been saved."));
                $request->addRequestParameter('lang',$this->form->getLanguage());
                $request->addRequestParameter('node',$this->category_i18n->getCategory()); 
                $this->forward($this->getModuleName(),'ajaxListPartialSoftwareForCategoryI18n');
            }   
            else
            {               
                 // var_dump($this->form->getErrorSchema()->getErrorsMessage());               
                $messages->addError(__("Form has some errors.")); 
            }    
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        }
    }

}

