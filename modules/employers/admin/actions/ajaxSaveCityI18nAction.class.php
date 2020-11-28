<?php

require_once __DIR__ . "/../locales/Forms/EmployerCityGalleryViewForm.class.php";


class employers_ajaxSaveCityI18nAction extends mfAction
{

    function execute(mfWebRequest $request)
    {     
        //echo"eeeee";
        $messages = mfMessages::getInstance();       
        $this->form = new EmployerCityGalleryViewForm($request->getPostParameter('EmployerCityGalleryI18n'));        
        $this->item_i18n=new EmployerCityGalleryI18n($this->form->getDefault('gallery_i18n'));
        $this->form->bind($request->getPostParameter('EmployerCityGalleryI18n'));
        echo"eeeee";
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
           $this->forward('employers','ajaxListPartialCity');            
        } 
        else 
        {
           var_dump($this->form->getErrorSchema()->getErrorsMessage());
            $messages->addError(__("Form has some errors."));
            $this->item_i18n->add($this->form->getDefault('gallery_i18n'));
            $this->item_i18n->getGallery()->add($this->form->getDefault('gallery'));
        }

    }

}


