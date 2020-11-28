<?php

require_once __DIR__."/../locales/Forms/EmployerCityGalleryNewForm.class.php";

class employers_ajaxSaveNewCityI18nAction extends mfAction {
    
 
    function execute(mfWebRequest $request) {      
        $messages = mfMessages::getInstance();         
        try 
        {
            $this->form= new EmployerCityGalleryNewForm($this->getUser()->getLanguage(),$request->getPostParameter('EmployerCityGalleryI18n'));
            $this->item_i18n=new EmployerCityGalleryI18n(); 
            $this->form->bind($request->getPostParameter('EmployerCityGalleryI18n'));
            if ($this->form->isValid())
            {
                 $this->item_i18n->add($this->form['gallery_i18n']->getValue());
                 $this->item_i18n->getGallery()->add($this->form['gallery']->getValue());
                 if ($this->item_i18n->isExist())
                     throw new mfException(__('Gallery already exists.'));
                 $this->item_i18n->getGallery()->save();
                 $this->item_i18n->set('gallery_id',$this->item_i18n->getGallery());
                 $this->item_i18n->save();              
                 $messages->addInfo(__('Gallery has been created.'));
                 $this->forward($this->getModuleName(), 'ajaxListPartialCity');
            }   
            else
            {
                $this->item_i18n->add($this->form['gallery_i18n']->getValue());
                $this->item_i18n->getGallery()->add($this->form['gallery']->getValue());
                $messages->addError(__('Form has some errors'));
             //  var_dump($this->form->getErrorSchema()->getErrorsMessage());
            }   
        } 
        catch (mfException $e) {
            $messages->addError($e->getMessage());
        }           
    }
}
