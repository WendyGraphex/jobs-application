<?php

require_once dirname(__FILE__)."/../locales/Forms/EmployerGalleryCompanyPositionsForm.class.php";

class employers_ajaxPositionsCompanyForGalleryI18nAction extends mfAction {
    
       
    function execute(mfWebRequest $request) {
        $messages = mfMessages::getInstance();         
        $this->user=$this->getUser();        
         $this->item_i18n=$request->getRequestParameter('gallery_i18n',new EmployerGalleryI18n($request->getPostParameter('EmployerGalleryI18n')));   
        if ($this->item_i18n->getGallery()->isNotLoaded())
            return ;
        $this->form=new EmployerGalleryCompanyPositionsForm($request->getPostParameter('PositionsCompanyForGalleryI18n'));
        if (!$request->isMethod('POST') || !$request->getPostParameter('PositionsCompanyForGalleryI18n'))
            return ;       
        $this->form->bind($request->getPostParameter('PositionsCompanyForGalleryI18n'));
        if ($this->form->isValid())
        {           
            $this->item_i18n->getGallery()->updatePositions($this->form->getPositions());
            $messages->addInfo(__('Positions have been updated.'));                     
              $request->addRequestParameter('gallery_i18n', $this->item_i18n);
            $this->forward($this->getModuleName(),'ajaxListPartialEmployerForGalleryI18n');
        }  
        else 
        {
            //  echo "<pre>"; var_dump($this->form->getErrorSchema()->getErrorsMessage()); echo "</pre>";
             $messages->addError(__('Form has some errors.'));      
        }
    }
    
}