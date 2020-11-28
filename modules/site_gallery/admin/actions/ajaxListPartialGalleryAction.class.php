<?php


require_once __DIR__."/../locales/FormFilters/SiteGalleryFormFilter.class.php";
require_once __DIR__."/../locales/Pagers/SiteGalleryPager.class.php";

class site_gallery_ajaxListPartialGalleryAction extends mfAction {


 
        
    function execute(mfWebRequest $request) {       
        $messages = mfMessages::getInstance();  
        $this->user=$this->getUser();
        $this->formFilter= new SiteGalleryFormFilter($this->user,$request->getRequestParameter('lang',$request->getPostParameter('lang',$this->getUser()->getLanguage())));                  
        $this->pager=new SiteGalleryPager(array('SiteGallery','SiteGalleryI18n'));
        try
        {
               $this->formFilter->bind($request->getPostParameter('filter'));
               if ($this->formFilter->isValid()||$request->getPostParameter('filter')==null)
               {    
                   //echo $this->formFilter->getQuery();
                    $this->pager->setQuery($this->formFilter->getQuery()); 
                    $this->pager->setNbItemsByPage($this->formFilter['nbitemsbypage']);
                    $this->pager->setParameter('lang',(string)$this->formFilter['lang']);                      
                    $this->pager->setPage($request->getGetParameter('page'));
                    $this->pager->execute();              
               }
               else
               {
                   var_dump($this->formFilter->getErrorSchema()->getErrorsMessage());
                    $messages->addError(__('Filter has some errors.'));
               }    
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        }    

    }
    
}    