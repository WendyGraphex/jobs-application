<?php

require_once __DIR__."/../locales/FormFilters/SitePictureFormFilter.class.php";
require_once __DIR__."/../locales/Pagers/SitePicturePager.class.php";

class site_gallery_ajaxListPartialPictureAction extends mfAction {


   
        
    function execute(mfWebRequest $request) {
        //var_dump("hjvhfhyygfg");
        $messages = mfMessages::getInstance();
        $this->formFilter= new SitePictureFormFilter($request->getRequestParameter('lang',$request->getPostParameter('lang',$this->getUser()->getLanguage())));                  
        $this->pager=new SitePicturePager();
        try
        {
               $this->formFilter->bind($request->getPostParameter('filter'));
               if ($this->formFilter->isValid()||$request->getPostParameter('filter')==null)
               {    
                    $this->pager->setQuery($this->formFilter->getQuery()); 
                    $this->pager->setNbItemsByPage($this->formFilter['nbitemsbypage']);
                    $this->pager->setParameter('lang',(string)$this->formFilter['lang']);                      
                    $this->pager->setPage($request->getGetParameter('page'));
                    $this->pager->execute();              
               }
               else
               {
                  // var_dump($this->formFilter->getErrorSchema()->getErrorsMessage());
                    $messages->addError(__('Formfilter has some errors.'));
               }    
        }
        catch (Exception $e)
        {
            $messages->addError($e);
        }    
     //   echo "<pre>"; var_dump($this->pager[8]->getI18n()); //->getPictureManager()->getUrl());        
    }
    
}    