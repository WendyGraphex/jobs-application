<?php

require_once dirname(__FILE__)."/../locales/Forms/CustomerCourseCategoryPositionsForm.class.php";


class customers_academy_ajaxPositionsCategoryAction extends mfAction {
    
       
    function execute(mfWebRequest $request) {
        $messages = mfMessages::getInstance();     
        $this->user=$this->getUser();       
     //   $this->form = new CustomerCourseCategoryViewForm();
        $this->item_i18n=new CustomerCourseCategoryI18n($request->getPostParameter('CustomerCourseCategoryI18n'));              
        $this->form=new CustomerCourseCategoryPositionsForm($request->getPostParameter('CustomerCourseCategoryPositions'));
        if (!$request->isMethod('POST') || !$request->getPostParameter('CustomerCourseCategoryPositions'))
            return ;       
        $this->form->bind($request->getPostParameter('CustomerCourseCategoryPositions'));
        if ($this->form->isValid())
        {           
           // CustomerCourseCategoryFeature::updatePositions($this->form->getPositions());
            
            var_dump($this->form->getPositions());
            
            $messages->addInfo(__('Categories have been updated.'));                     
            $this->forward($this->getModuleName(),'ajaxListPartialCategory');
        }  
        else 
        {
            //  echo "<pre>"; var_dump($this->form->getErrorSchema()->getErrorsMessage()); echo "</pre>";
             $messages->addError(__('Form has some errors.'));      
        } 
    }
    
}