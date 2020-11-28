<?php


 require_once __DIR__."/../locales/Forms/SiteGalleryI18nViewForm.class.php";
 
class site_gallery_ajaxSaveGalleryI18nAction extends mfAction {
    
     
    function execute(mfWebRequest $request) {                   
        $messages = mfMessages::getInstance(); 
        $this->user=$this->getUser();
        $this->form = new SiteGalleryI18nViewForm($this->user,$request->getPostParameter('SiteGalleryI18n'));
        $this->form->bind($request->getPostParameter('SiteGalleryI18n'));   
        $this->item=new SiteGalleryI18n($this->form['gallery_i18n']->getValue());   
        if ($this->form->isValid())
        {           
            $this->item->getGallery()->add($this->form['gallery']->getValue());
            $this->item->getGallery()->save();
            $this->item->add($this->form['gallery_i18n']->getValue());   
            $this->item->save();
            $messages->addInfo(__('Gallery has been saved.'));
            $request->addRequestParameter('lang',(string)$this->form['gallery_i18n']['lang']);
            $this->forward($this->getModuleName(),'ajaxListPartialGallery');
        }   
        else
        {          
           $this->item->getGallery()->add($this->form['gallery']->getValue());
           var_dump($this->form->getErrorSchema()->getErrorsMessage());
        }                   
   }

}

