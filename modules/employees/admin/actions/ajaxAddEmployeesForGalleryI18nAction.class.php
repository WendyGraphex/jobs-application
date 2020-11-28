<?php

require_once __DIR__."/../locales/Forms/AddEmployeesForGalleryI18nForm.class.php";


class employees_ajaxAddEmployeesForGalleryI18nAction extends mfAction {
           
    function execute(mfWebRequest $request) {     
        $messages = mfMessages::getInstance();           
        $this->user=$this->getUser();               
        try
        {
           $this->item_i18n=new EmployeeGalleryI18n($request->getPostParameter('EmployeeGalleryI18n'));    
             if ($this->item_i18n->getGallery()->isNotLoaded())
               throw new mfException(__('Gallery is invalid.'));
           $form=new AddEmployeesForGalleryI18nForm($this->item_i18n,$request->getPostParameter('AddEmployees'));
           $form->bind($request->getPostParameter('AddEmployees')); 
           if (!$form->isValid())                
                throw new mfException(__('Form has some errors.'));          
           $this->item_i18n->getGallery()->updateEmployees($form->getSelection());           
           $messages->addInfo(__('Employees have been added.'));
           $request->addRequestParameter('gallery_i18n', $this->item_i18n);
           $this->forward($this->getModuleName(), 'ajaxListPartialEmployeeForGalleryI18n');
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        } 
        $this->getController()->setRenderMode(mfView::RENDER_JSON);          
        return array("errors"=>$messages->getDecodedErrors());
    }
}

