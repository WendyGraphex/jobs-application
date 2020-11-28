<?php


class site_gallery_ajaxSaveViewPictureI18nAction extends mfAction {
    
       
    function execute(mfWebRequest $request) {      
        if (!$request->isXmlHttpRequest() )  
        {
                if ($request->getPostParameter('iFrame')=='true') // Comes from Iframe
                       $request->forceXMLRequest();                  
        }   
        $messages = mfMessages::getInstance();          
        $this->form = new SitePictureI18nViewForm($request->getPostParameter('SitePictureI18n'));                                       
        try
        {          
            $this->item=new SitePictureI18n($this->form->getDefaultsForPictureI18n());
            
          //  var_dump($this->item->picture()->getExtension());
          //  if ($this->item->isLoaded())           
         //       unset($this->form->picture_i18n['picture']);            
            $this->form->bind($request->getPostParameter('SitePictureI18n'),$request->getFiles('SitePictureI18n'));           
            if ($this->form->isValid())
            {       
                if ($this->item->isLoaded())
                {                   
                    $this->item->add($this->form->getValuesForPictureI18n());                         
                    $this->item->save();
                    $this->item->getPicture()->add($this->form->getValuesForPicture());
                    $this->item->getPicture()->save();   
                    $this->item->save();   
                }    
                else 
                {
                    $picture=$this->form['picture_i18n']['picture']->getValue();     
                    $this->item->add($this->form->getValuesForPictureI18n());    
                    if ($picture)
                    {    
                        $picture->setFilename($this->item->getTitleForPicture());                     
                        $this->item->set('picture',$picture->getFilename().".".$picture->getExtension());  
                    }
                    $this->item->set('picture_id',(string)$this->form['picture']['id']);
                    $this->item->getPicture()->add($this->form->getValuesForPicture());
                    $this->item->getPicture()->save();                
                    $this->item->set('picture_id',$this->item->getPicture());                         
                    $this->item->save();   
                    if ($picture)
                    {
                       $picture->save($this->item->picture()->getPath()); 
                    }
                }                          
                $messages->addInfo(__("Picture has been saved"));
                $request->addRequestParameter('lang',(string)$this->form['picture_i18n']['lang']);
                $this->forward('site_gallery','ajaxListPartialPicture');              
            }    
            else
            {               
                $messages->addError(__("Form has some errors."));
               // var_dump($this->form->getErrorSchema()->getErrorsMessage());
               $this->item->add($this->form->getValuesForPictureI18n());             
               $this->item->getPicture()->add($this->form->getValuesForPicture());
            }              
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        }         
    }

}
