<?php

require_once __DIR__."/../locales/Forms/SitePictureNewForm.class.php";

class site_gallery_ajaxSaveNewPictureI18nAction extends mfAction {
    
       
    function execute(mfWebRequest $request) {      
        if (!$request->isXmlHttpRequest() )  
        {
                if ($request->getPostParameter('iFrame')=='true') // Comes from Iframe
                       $request->forceXMLRequest();                  
        }   
        $messages = mfMessages::getInstance();                    
        $this->form= new SitePictureNewForm($this->getUser()->getLanguage(),$request->getPostParameter('PictureI18n'));             
        try
        {           
            $this->form->bind($request->getPostParameter('PictureI18n'),$request->getFiles('PictureI18n'));
            $this->picture_i18n=new SitePictureI18n(array('lang'=>(string)$this->form['picture_i18n']['lang']));   
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
                $messages->addInfo(__("Picture has been saved"));
                $request->addRequestParameter('lang',(string)$this->form['picture_i18n']['lang']);
                $this->forward('site_gallery','ajaxListPartialPicture');
            }    
            else
            {          
                //var_dump($this->form->getErrorSchema()->getErrorsMessage());
               $messages->addError(__('Form has some errors.'));
               $this->picture_i18n->add($this->form['picture_i18n']->getValue());
               $this->picture_i18n->getPicture()->add($this->form['picture']->getValue());
            }              
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        }      
       
    }

}
