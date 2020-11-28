<?php

require_once __DIR__."/../locales/FormFilters/EmployeeAdvertNotationFormFilter.class.php";
require_once __DIR__."/../locales/Pagers/EmployeeAdvertNotationPager.class.php";

class employees_notation_ajaxListPartialNotationAction extends mfAction {
    
      
    function execute(mfWebRequest $request) {

        $messages = mfMessages::getInstance();       
        $this->user=$this->getUser();
        $this->formFilter= new EmployeeAdvertNotationFormFilter();                  
        $this->pager=new EmployeeAdvertNotationPager();
        try
        {
               $this->formFilter->bind($request->getPostParameter('filter'));
               if ($this->formFilter->isValid()||$request->getPostParameter('filter')==null)
               {                       
                $this->pager->setQuery($this->formFilter->getQuery()); 
                $this->pager->setNbItemsByPage($this->formFilter['nbitemsbypage']);        
                $this->pager->setParameter('lang',$this->getUser()->getLanguage());
                $this->pager->setPage($request->getGetParameter('page'));
                $this->pager->execute();              
                
               //  echo mfSiteDatabase::getInstance()->getQuery();
               }
               else
               {
                  // var_dump($this->formFilter->getErrorSchema()->getErrorsMessage());
                   $messages->addError(__('Filter has an errors.'));
               }    
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        }    
     //   echo "<pre>"; var_dump($this->pager[189]);
     
    }
    
}
