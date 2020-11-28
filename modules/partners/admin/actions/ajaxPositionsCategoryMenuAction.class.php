<?php

require_once dirname(__FILE__)."/../locales/Forms/PartnerWorkCategoryMenuPositionsForm.class.php";


class partners_ajaxPositionsCategoryMenuAction extends mfAction {
    
       
    function execute(mfWebRequest $request) {
        $messages = mfMessages::getInstance();     
        $this->user=$this->getUser();       
     //   $this->form = new PartnerWorkCategoryViewForm();
        $this->item_i18n=new PartnerWorkCategoryMenuI18n($request->getPostParameter('PartnerWorkCategoryMenuI18n'));              
        $this->form=new PartnerWorkCategoryMenuPositionsForm($request->getPostParameter('PartnerWorkCategoryMenuPositions'));
        if (!$request->isMethod('POST') || !$request->getPostParameter('PartnerWorkCategoryMenuPositions'))
            return ;       
        $this->form->bind($request->getPostParameter('PartnerWorkCategoryMenuPositions'));
        if ($this->form->isValid())
        {           
           // PartnerWorkFeature::updatePositions($this->form->getPositions());
            
          //  var_dump($this->form->getPositions());
            
            $messages->addInfo(__('Menu  have been updated.'));                     
            $this->forward($this->getModuleName(),'ajaxListPartialCategoryMenu');
        }  
        else 
        {
            //  echo "<pre>"; var_dump($this->form->getErrorSchema()->getErrorsMessage()); echo "</pre>";
             $messages->addError(__('Form has some errors.'));      
        } 
    }
    
}