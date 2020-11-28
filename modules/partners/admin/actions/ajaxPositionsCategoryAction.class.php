<?php

require_once dirname(__FILE__)."/../locales/Forms/PartnerWorkCategoryPositionsForm.class.php";


class partners_ajaxPositionsCategoryAction extends mfAction {
    
       
    function execute(mfWebRequest $request) {
        $messages = mfMessages::getInstance();     
        $this->user=$this->getUser();       
     //   $this->form = new PartnerWorkCategoryViewForm();
        $this->item_i18n=new PartnerWorkCategoryI18n($request->getPostParameter('PartnerWorkCategoryI18n'));              
        $this->form=new PartnerWorkCategoryPositionsForm($request->getPostParameter('PartnerWorkCategoryPositions'));
        if (!$request->isMethod('POST') || !$request->getPostParameter('PartnerWorkCategoryPositions'))
            return ;       
        $this->form->bind($request->getPostParameter('PartnerWorkCategoryPositions'));
        if ($this->form->isValid())
        {           
           // PartnerWorkFeature::updatePositions($this->form->getPositions());
            
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