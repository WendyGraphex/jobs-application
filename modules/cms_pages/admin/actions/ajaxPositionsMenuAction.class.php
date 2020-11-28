<?php

require_once dirname(__FILE__)."/../locales/Forms/Menu/CmsMenuPositionsForm.class.php";


class cms_pages_ajaxPositionsMenuAction extends mfAction {
    
       
    function execute(mfWebRequest $request) {
        $messages = mfMessages::getInstance();     
        $this->user=$this->getUser();       
     //   $this->form = new PartnerWorkCategoryViewForm();
        $this->item_i18n=new CmsMenuI18n($request->getPostParameter('CmsMenuI18n'));              
        $this->form=new CmsMenuPositionsForm($request->getPostParameter('CmsMenuPositions'));
        if (!$request->isMethod('POST') || !$request->getPostParameter('CmsMenuPositions'))
            return ;       
        $this->form->bind($request->getPostParameter('CmsMenuPositions'));
        if ($this->form->isValid())
        {           
           // PartnerWorkFeature::updatePositions($this->form->getPositions());
            
          //  var_dump($this->form->getPositions());
            
            $messages->addInfo(__('Menu positions have been updated.'));                     
            $this->forward($this->getModuleName(),'ajaxListPartialMenu');
        }  
        else 
        {
            //  echo "<pre>"; var_dump($this->form->getErrorSchema()->getErrorsMessage()); echo "</pre>";
             $messages->addError(__('Form has some errors.'));      
        } 
    }
    
}