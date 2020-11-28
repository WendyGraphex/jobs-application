<?php

class SitePictureMultipleForGalleryI18nForm extends mfForm {
    
    protected $gallery_i18n=null;
    
    function __construct(SiteGalleryI18n $gallery_i18n,$defaults = array()) {
        $this->gallery_i18n=$gallery_i18n;
        parent::__construct($defaults, array());
    }
    
    function getGalleryI18n()
    {
        return $this->site_gallery_i18n;
    }
    
    function configure() {
        $this->setValidators(array(
            'selection'=>new mfValidatorSchemaForEach(new mfValidatorInteger(),count($this->getDefault('selection')),array("required"=>false)),
        ));
    }
        
    function getSelection()
    {
        return $this->_selection=$this->_selection===null?SitePicture::getPicturesFromSelection($this['selection']->getArray()):$this->_selection;
    }
}
 
class site_gallery_ajaxSaveMultiplePictureForGalleryI18nAction extends mfAction {

           
    function execute(mfWebRequest $request) {
       
        $messages = mfMessages::getInstance();
        $this->gallery_i18n=$request->getRequestParameter('gallery_i18n',new SiteGalleryI18n($request->getPostParameter('SiteGalleryI18n')));          
        if ($this->gallery_i18n->isNotLoaded())
            return ;
        $this->form= new SitePictureMultipleForGalleryI18nForm($this->gallery_i18n,$request->getPostParameter('SitePictureMultiple'));
        $this->form->bind($request->getPostParameter('SitePictureMultiple'));
        if ($this->form->isValid())
        {           
            $this->gallery_i18n->getGallery()->updatePictures($this->form->getSelection());
        }
        else
        {
           // var_dump($this->form->getErrorSchema()->getErrorsMessage());
        }    
        $messages->addInfo(__('Pictures has been added.'));
        $request->addRequestParameter('gallery_i18n', $this->gallery_i18n);
        $this->forward($this->getModuleName(), 'ajaxListPartialPictureForGalleryI18n');
    }
    
}  
