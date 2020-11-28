<?php

require_once __DIR__."/../locales/Forms/AddCompaniesForGalleryI18nForm.class.php";


class employers_ajaxAddCompaniesForGalleryI18nAction extends mfAction {
           
    function execute(mfWebRequest $request) {     
        $messages = mfMessages::getInstance();           
        $this->user=$this->getUser();               
        try
        {
           $this->item_i18n=new EmployerGalleryI18n($request->getPostParameter('EmployerGalleryI18n'));    
             if ($this->item_i18n->getGallery()->isNotLoaded())
               throw new mfException(__('Gallery is invalid.'));
           $form=new AddCompaniesForGalleryI18nForm($this->item_i18n,$request->getPostParameter('AddCompanies'));
           $form->bind($request->getPostParameter('AddCompanies')); 
           if (!$form->isValid())                
                throw new mfException(__('Form has some errors.'));          
            $this->item_i18n->getGallery()->updateEmployers($form->getSelection());           
           $messages->addInfo(__('Employers have been added.'));
           $request->addRequestParameter('gallery_i18n', $this->item_i18n);
           $this->forward($this->getModuleName(), 'ajaxListPartialCompanyForGalleryI18n');
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        } 
        $this->getController()->setRenderMode(mfView::RENDER_JSON);          
        return array("errors"=>$messages->getDecodedErrors());
    }
}

