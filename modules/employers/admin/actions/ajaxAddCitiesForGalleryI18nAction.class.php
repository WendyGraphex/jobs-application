<?php

require_once __DIR__."/../locales/Forms/AddCitiesForGalleryI18nForm.class.php";

class employers_ajaxAddCitiesForGalleryI18nAction extends mfAction {
           
    function execute(mfWebRequest $request) {     
        $messages = mfMessages::getInstance();           
        $this->user=$this->getUser();               
        try
        {
           $this->item_i18n=new EmployerCityGalleryI18n($request->getPostParameter('EmployerCityGalleryI18n'));    
             if ($this->item_i18n->getGallery()->isNotLoaded())
               throw new mfException(__('Gallery is invalid.'));
           $form=new AddCitiesForGalleryI18nForm($this->item_i18n,$request->getPostParameter('AddCities'));
           $form->bind($request->getPostParameter('AddCities')); 
           if (!$form->isValid())                
                throw new mfException(__('Form has some errors.'));
           $this->item_i18n->getGallery()->updateCities($form->getSelection());           
           $messages->addInfo(__('Cities have been added.'));
           $request->addRequestParameter('gallery_i18n', $this->item_i18n);
           $this->forward($this->getModuleName(), 'ajaxListPartialCityForGalleryI18n');
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        } 
        $this->getController()->setRenderMode(mfView::RENDER_JSON);          
        return array("errors"=>$messages->getDecodedErrors());
    }
}

