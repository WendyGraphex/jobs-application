<?php

require_once __DIR__."/../locales/Forms/SitePictureNewForGalleryForm.class.php";

class site_gallery_ajaxNewPictureForGalleryI18nAction extends mfAction {
    
       
    function execute(mfWebRequest $request) {      
        
        $messages = mfMessages::getInstance();                    
        $this->gallery_i18n=new SiteGalleryI18n($request->getPostParameter('SiteGalleryI18n'));
        if ($this->gallery_i18n->isNotLoaded())
            return ;
        $this->form= new SitePictureNewForGallery($request->getPostParameter('SitePictureI18n'));
        $this->picture_i18n=new SitePictureI18n();  
        $this->picture_i18n->set('lang',$this->gallery_i18n->get('lang'));
        if (!$request->isMethod('POST') || !$request->getPostParameter('SitePictureI18n'))
            return ;
        $this->form->bind($request->getPostParameter('SitePictureI18n'),$request->getFiles('SitePictureI18n'));
        if ($this->form->isValid())
        {
                $picture=$this->form['picture_i18n']['picture']->getValue();     
                $this->picture_i18n->add($this->form['picture_i18n']->getValue());     
                $picture->setFilename($this->picture_i18n->getTitleForPicture());                     
                $this->picture_i18n->set('picture',$picture->getFilename().".".$picture->getExtension());                   
                $this->picture_i18n->getPicture()->add($this->form['picture']->getValue());
                $this->picture_i18n->getPicture()->save();                
                $this->picture_i18n->set('picture_id',$this->picture_i18n->getPicture());                         
                $this->picture_i18n->save(); 
                if ($picture)
                {
                   $picture->save($this->picture_i18n->picture()->getPath()); 
                }    
                $picture_gallery=new SitePictureGallery();
                $picture_gallery->add(array('picture_id'=>$this->picture_i18n->get('picture_id'),
                                            'gallery_id'=>$this->gallery_i18n->get('gallery_id')));
                $picture_gallery->save();
                $messages->addInfo(__("Picture has been created."));
                $request->addRequestParameter('gallery_i18n',$this->gallery_i18n);
                $this->forward($this->getModuleName(),'ajaxViewGalleryI18nPictures');
        }   
        else
        {
            // var_dump($this->form->getErrorSchema()->getErrorsMessage());
            $messages->addError(__('Form has some errors.'));
            $this->picture_i18n->add($this->form->getDefault('picture_i18n'));
            $this->picture_i18n->getPicture()->add($this->form->getDefault('picture'));
        }    
    }

}
