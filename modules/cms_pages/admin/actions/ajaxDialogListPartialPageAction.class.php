<?php

require_once __DIR__."/../locales/FormFilters/CmsPageI18nDialogFormFilter.class.php";
require_once __DIR__."/../locales/Pagers/CmsPagePager.class.php";
//require_once __DIR__."/../locales/Forms/CmsPageNodeDialogForm.class.php";


class cms_pages_ajaxDialogListPartialPageAction extends mfAction {
    
       
     function execute(mfWebRequest $request) {
        $messages = mfMessages::getInstance();          
        $this->pager=new CmsPagePager();     
        $this->formFilter= new CmsPageI18nDialogFormFilter($request->getRequestParameter('lang',$this->getUser()->getLanguage()));         
        try
        {
               $this->formFilter->bind($request->getPostParameter('filter'));
               if ($this->formFilter->isValid()||$request->getPostParameter('filter')==null)
               {    
                    $this->pager->setQuery($this->formFilter->getQuery());     
                    $this->pager->setNbItemsByPage((string)$this->formFilter['nbitemsbypage']);
                    $this->pager->setParameter('lang',(string)$this->formFilter['lang']);    
                    $this->pager->setPage($this->request->getGetParameter('page'));
                    $this->pager->executeSite();              
               }      
               else
               {
                   
               }    
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        }        
    }
    
      
}

