<?php

require_once __DIR__."/../locales/FormFilters/EmployerCityGalleryFormFilter.class.php";
require_once __DIR__."/../locales/Pagers/EmployerCityGalleryPager.class.php";

class employers_ajaxListPartialCityAction extends mfAction {
    
      
    function execute(mfWebRequest $request) {

        $messages = mfMessages::getInstance();       
        $this->user=$this->getUser();     
        $this->formFilter = new EmployerCityGalleryFormFilter($request->getRequestParameter('lang',$request->getPostParameter('lang',$this->getUser()->getLanguage())));               
        $this->pager=new EmployerCityGalleryPager();
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
                //   var_dump($this->formFilter->getErrorSchema()->getErrorsMessage());
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
