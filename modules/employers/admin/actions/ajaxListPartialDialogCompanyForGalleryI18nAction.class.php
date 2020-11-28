<?php

require_once __DIR__."/../locales/FormFilters/EmployerCompanyDialogFormFilter.class.php";
require_once __DIR__."/../locales/Pagers/EmployerCompanyDialogPager.class.php";


class employers_ajaxListPartialDialogCompanyForGalleryI18nAction extends mfAction {
    
      
    function execute(mfWebRequest $request) {

        $messages = mfMessages::getInstance();       
        $this->user=$this->getUser();  
        $this->item_i18n=new EmployerGalleryI18n($request->getPostParameter('EmployerGalleryI18n'));   
        if ($this->item_i18n->getGallery()->isNotLoaded())
            return ;        
        $this->formFilter= new EmployerCompanyDialogFormFilter($this->item_i18n,$request->getPostParameter('filter'));                  
        $this->pager=new EmployerCompanyDialogPager();
        try
        {
               $this->formFilter->bind($request->getPostParameter('filter'));
               if ($this->formFilter->isValid()||$request->getPostParameter('filter')==null)
               {    
                 //  echo $this->formFilter->getQuery();
                    $this->pager->setQuery($this->formFilter->getQuery()); 
                    $this->pager->setNbItemsByPage($this->formFilter['nbitemsbypage']);                                        
                    $this->pager->setPage($request->getGetParameter('page'));
                    $this->pager->execute();    
                  // echo mfSiteDatabase::getInstance()->getQuery();
               }      
               else
               {
                   $messages->addError(__('Filter has some errors.'));
                     var_dump($this->formFilter->getErrorSchema()->getErrorsMessage());
               }    
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        }    
       // var_dump($this->pager[0]);
     
    }
    
}

