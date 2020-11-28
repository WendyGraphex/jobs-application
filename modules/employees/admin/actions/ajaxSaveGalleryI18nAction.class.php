<?php

require_once dirname(__FILE__)."/../locales/Forms/EmployeeGalleryViewForm.class.php";
 
 
class employees_ajaxSaveGalleryI18nAction extends mfAction {
    
    
     function execute(mfWebRequest $request)
    {     
        $messages = mfMessages::getInstance();       
        $this->form = new EmployeeGalleryViewForm($request->getPostParameter('EmployeeGalleryI18n'));        
        $this->item_i18n=new EmployeeGalleryI18n($this->form->getDefault('gallery_i18n'));
        $this->form->bind($request->getPostParameter('EmployeeGalleryI18n'));
        if ($this->form->isValid()) {
            $this->item_i18n->add($this->form['gallery_i18n']->getValue());
            $this->item_i18n->getGallery()->add($this->form['gallery']->getValue());
            if ($this->item_i18n->isExist())
                throw new mfException(__('Gallery already exists.'));
            $this->item_i18n->getGallery()->save();
            $this->item_i18n->set('gallery_id',$this->item_i18n->getGallery());
            $this->item_i18n->save();               
           $messages->addInfo(__("Gallery has been updated."));           
           $request->addRequestParameter('lang', $this->item_i18n->get('lang'));
           $this->forward($this->getModuleName(),'ajaxListPartialGallery');            
        } 
        else 
        {
           // var_dump($this->form->getErrorSchema()->getErrorsMessage());
            $messages->addError(__("Form has some errors."));
            $this->item_i18n->add($this->form->getDefault('gallery_i18n'));
            $this->item_i18n->getGallery()->add($this->form->getDefault('gallery'));
        }

    }

}

