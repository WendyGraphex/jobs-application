<?php

require_once __DIR__."/../locales/FormFilters/SelectListFilterMultiplePicturesForGalleryFormFilter.class.php";

class site_gallery_ajaxSelectListFilterMultiplePicturesForGalleryAction extends mfAction {
    
  
            
    function execute(mfWebRequest $request) {              
        $messages = mfMessages::getInstance();         
        $this->gallery_i18n=new SiteGalleryI18n($request->getPostParameter('SiteGalleryI18n'));  
        if ($this->gallery_i18n->getGallery()->isNotLoaded())
        {
            $messages->addError(__("Gallery doesn't exist."));
            $this->forward ('site_gallery', 'ajaxListPartialGallery');
        }   
        $this->formFilter= new SelectListFilterMultiplePicturesForGalleryFormFilter($request->getPostParameter('filter'));                        
        $this->pager=new Pager(array('SitePicture','SitePictureI18n'));
        try
        {
               $this->formFilter->bind($request->getPostParameter('filter'));
               if ($this->formFilter->isValid()||$request->getPostParameter('filter')==null)
               {    
                //   echo $this->formFilter->getQuery();
                $this->pager->setQuery($this->formFilter->getQuery()); 
                $this->pager->setNbItemsByPage($this->formFilter['nbitemsbypage']); 
                $this->pager->setParameter('gallery_id',$this->gallery_i18n->getGallery()->get('id'));
                $this->pager->setParameter('lang',$this->gallery_i18n->get('lang'));
                $this->pager->setPage($request->getGetParameter('page'));
                $this->pager->execute();              
              //  echo mfSiteDatabase::getInstance()->getQuery();
               }
               else
               {
                    $messages->addError(__("Filter has some errors."));
               }    
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        } 
    }

}
