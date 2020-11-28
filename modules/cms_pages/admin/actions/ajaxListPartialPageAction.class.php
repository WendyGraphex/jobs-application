<?php

require dirname(__FILE__)."/../locales/FormFilters/CmsPageI18nFormFilter.class.php";
require dirname(__FILE__)."/../locales/Pagers/CmsPagePager.class.php";


class cms_pages_ajaxListPartialPageAction extends mfAction {
    
    
    // array('CmsPage','CmsPageI18n')
     function execute(mfWebRequest $request) {
        $messages = mfMessages::getInstance();          
        $this->pager=new CmsPagePager();     
        $this->formFilter= new CmsPageI18nFormFilter($request->getRequestParameter('lang',$request->getPostParameter('lang',$this->getUser()->getLanguage())));     
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
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        }        
    }
    
      
}

