<?php

require_once __DIR__."/../locales/Forms/SiteGalleryNewForm.class.php";

class site_gallery_ajaxSaveNewGalleryI18nAction extends mfAction {
    
           
    function execute(mfWebRequest $request) {             
        $messages = mfMessages::getInstance(); 
        $this->user=$this->getUser();
        $this->form= new SiteGalleryNewForm($this->user,$this->getUser()->getLanguage(),$request->getPostParameter('SiteGalleryI18n'));             
        try
        {           
            $this->form->bind($request->getPostParameter('SiteGalleryI18n'));
            $this->gallery_i18n=new SiteGalleryI18n(array('lang'=>(string)$this->form['gallery_i18n']['lang']));   
            if ($this->form->isValid())
            {                                 
                $this->gallery_i18n->add($this->form['gallery_i18n']->getValue());                                
                $this->gallery_i18n->getGallery()->add($this->form['gallery']->getValue());
                $this->gallery_i18n->getGallery()->save();                
                $this->gallery_i18n->set('gallery_id',$this->gallery_i18n->getGallery());                   
                $this->gallery_i18n->save();                 
                $messages->addInfo(__("Gallery [%s] has been saved.",$this->gallery_i18n->getGallery()->get('name')));
                $request->addRequestParameter('lang',(string)$this->form['gallery_i18n']['lang']);
                $this->forward($this->getModuleName(),'ajaxListPartialGallery');
            }    
            else
            {                          
               $messages->addError(__('this form has some errors.'));
               $this->gallery_i18n->add($this->form['gallery_i18n']->getValue());
               $this->gallery_i18n->getGallery()->add($this->form['gallery']->getValue());
            }              
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        }      
       
    }

}
