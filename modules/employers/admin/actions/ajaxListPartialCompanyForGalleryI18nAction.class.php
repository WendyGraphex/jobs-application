<?php

require_once __DIR__."/../locales/FormFilters/EmployerGalleryCompanyForGalleryI18nFormFilter.class.php";
require_once __DIR__."/../locales/Pagers/EmployerGalleryCompanyForGalleryI18nPager.class.php";

class employers_ajaxListPartialCompanyForGalleryI18nAction extends mfAction {
    
      
    function execute(mfWebRequest $request) {

        $messages = mfMessages::getInstance();       
        $this->user=$this->getUser();
        $this->item_i18n=$request->getRequestParameter('gallery_i18n',new EmployerGalleryI18n($request->getPostParameter('EmployerGalleryI18n')));   
        if ($this->item_i18n->getGallery()->isNotLoaded())
            return ;
        $this->formFilter = new EmployerGalleryCompanyForGalleryI18nFormFilter();                         
        $this->pager=new EmployerGalleryCompanyForGalleryI18nPager();
        try
        {
               $this->formFilter->bind($request->getPostParameter('filter'));
               if ($this->formFilter->isValid()||$request->getPostParameter('filter')==null)
               {    
                 
                $this->pager->setQuery($this->formFilter->getQuery()); 
                $this->pager->setNbItemsByPage($this->formFilter['nbitemsbypage']);                                                
                $this->pager->setParameter('gallery_id',$this->item_i18n->getGallery()->get('id'));
                $this->pager->setPage($request->getGetParameter('page'));
                $this->pager->execute();    
                
               }  
               else
               {
                 //  var_dump($this->formFilter->getErrorSchema()->getErrorsMessage());
                   $messages->addError(_('Filter has some errors.'));
               }    
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        }    
       // var_dump($this->pager[0]);*/
     
    }
    
}

