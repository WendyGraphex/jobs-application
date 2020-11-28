<?php

require_once __DIR__."/../locales/Forms/SitePictureI18nForGalleryI18nViewForm.class.php";

class site_gallery_ajaxSavePictureI18nForGalleryI18nAction extends mfAction {
    
       
    function execute(mfWebRequest $request) {      
        
        $messages = mfMessages::getInstance();                    
        $this->picture_gallery=new SitePictureGallery($request->getPostParameter('SitePictureGalleryI18n')); 
        if ($this->picture_gallery->isNotLoaded())
        {
            $messages->addError(__('Picture is invalid.'));
            $this->forward($this->getModuleName(),'ajaxListPartialGallery');
        }   
        $this->form=new SitePictureI18nForGalleryI18nViewForm($request->getPostParameter('SitePictureI18nForGalleryI18n'));
        $this->form->bind($request->getPostParameter('SitePictureI18nForGalleryI18n'),$request->getFiles('SitePictureI18nForGalleryI18n'));  
        if ($this->form->isValid())
        {                                      
            $this->picture_gallery->getPicture()->getI18n()->add($this->form['picture_i18n']->getValue());  
            if ($this->picture_gallery->getPicture()->getI18n()->hasPropertyChanged('title'))
            {    // rename if title changed                    
                $picture_name=$this->picture_gallery->getPicture()->getI18n()->getTitleForPicture().".".$this->picture_gallery->getPicture()->getI18n()->picture()->getExtension();
                $this->picture_gallery->getPicture()->getI18n()->picture()->rename($picture_name); 
                $this->picture_gallery->getPicture()->getI18n()->set('picture',$picture_name);
            }   
            $this->picture_gallery->getPicture()->getI18n()->save();
            $this->picture_gallery->getPicture()->add($this->form['picture']->getValue());
            $this->picture_gallery->getPicture()->save();   
            $this->picture_gallery->getPicture()->getI18n()->save();                                                   
            $messages->addInfo(__("Picture has been saved"));
            $request->addRequestParameter('gallery_i18n',$this->picture_gallery->getGallery()->getI18n());
            $this->forward($this->getModuleName(),'ajaxViewGalleryI18nPictures');            
        }    
        else
        {                   
             $messages->addError(__('Form has some errors.'));
          //   var_dump($this->form->getErrorSchema()->getErrorsMessage());
           $this->picture_gallery->getPicture()->getI18n()->add($this->form['picture_i18n']->getValue());              
           $this->picture_gallery->getPicture()->add($this->form['picture']->getValue());
        }             
    }

}
