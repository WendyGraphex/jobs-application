<?php

require_once dirname(__FILE__)."/../locales/Forms/EmployeeGalleryEmployeePositionsForm.class.php";

class employees_ajaxPositionsEmployeeForGalleryI18nAction extends mfAction {
    
       
    function execute(mfWebRequest $request) {
        $messages = mfMessages::getInstance();         
        $this->user=$this->getUser();        
         $this->item_i18n=$request->getRequestParameter('gallery_i18n',new EmployeeGalleryI18n($request->getPostParameter('EmployeeGalleryI18n')));   
        if ($this->item_i18n->getGallery()->isNotLoaded())
            return ;
        $this->form=new EmployeeGalleryEmployeePositionsForm($request->getPostParameter('EmployeeGalleryEmployeePositions'));
        if (!$request->isMethod('POST') || !$request->getPostParameter('EmployeeGalleryEmployeePositions'))
            return ;       
        $this->form->bind($request->getPostParameter('EmployeeGalleryEmployeePositions'));
        if ($this->form->isValid())
        {           
            $this->item_i18n->getGallery()->updatePositions($this->form->getPositions());
            $messages->addInfo(__('Positions have been updated.'));                     
              $request->addRequestParameter('gallery_i18n', $this->item_i18n);
            $this->forward($this->getModuleName(),'ajaxListPartialEmployeeForGalleryI18n');
        }  
        else 
        {
            //  echo "<pre>"; var_dump($this->form->getErrorSchema()->getErrorsMessage()); echo "</pre>";
             $messages->addError(__('Form has some errors.'));      
        }
    }
    
}