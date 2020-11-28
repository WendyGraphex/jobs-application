<?php

require_once __DIR__."/../locales/Forms/SitePicturesSelectionForm.class.php";

class site_gallery_ajaxSavePictureSelectionForGalleryAction extends mfAction {

    
    function execute(mfWebRequest $request)
    {               
        $messages=  mfMessages::getInstance();      
        $gallery_i18n=new SiteGalleryI18n($request->getPostParameter('SiteGalleryI18n'));           
        if ($gallery_i18n->getGallery()->isLoaded())
        {    
            
            $form=new SitePicturesSelectionForm($gallery_i18n,$request->getPostParameter('SitePictures'));
            try 
            {                    
                $form->bind($request->getPostParameter('SitePictures'));            
                if ($form->isValid())
                {                      
                    $collection=new SitePictureGalleryCollection();             
                    foreach ($form['selection']->getValue() as $picture_id)
                    {
                       $item=new SitePictureGallery(); 
                       $item->add(array('gallery_id'=>$gallery_i18n->get('gallery_id'),'picture_id'=>$picture_id));                                                
                       $collection[]=$item;
                    }                  
                    $collection->save();    
                    // In case of gallery doesn't exist
                    $gallery_i18n->save();
                    $messages->addInfo(__('Pictures have been added.'));
                    $request->addRequestParameter('gallery_I18n',$gallery_i18n);
                    $this->forward('site_gallery','ajaxViewGalleryI18nPictures'); 
                }   
                else
                {    
                    $messages->addError(__("Form has some errors."));
                  //  var_dump($form->getErrorSchema()->getErrorsMessage());
                    if ($form['selection']->hasError())
                        $messages->addError($form['selection']->getError());
                }   
            }
            catch (mfException $e)
            {
                $messages->addError($e);
            }           
        }    
        $this->forward('site_gallery','ajaxSelectListFilterMultiplePicturesForGallery'); 
    } 
    
    
}