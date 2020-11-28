<?php

require_once __DIR__."/../locales/FormFilters/SiteCookieFormFilter.class.php";
require_once __DIR__."/../locales/Pagers/SiteCookiePager.class.php";

class site_cookie_ajaxListPartialAction extends mfAction {

    function execute(mfWebRequest $request) {
        $messages = mfMessages::getInstance();       
        $this->user=$this->getUser();       
        try
        {                 
               $this->pager=new SiteCookiePager();    
               $this->formFilter= new SiteCookieFormFilter($this->user);                                 
               $this->formFilter->bind($request->getPostParameter('filter'));
               if ($this->formFilter->isValid()||$request->getPostParameter('filter')==null)
               { 
              //  echo $this->formFilter->getQuery()."<br/>";
                $this->pager->setQuery($this->formFilter->getQuery()); 
                $this->pager->setNbItemsByPage($this->formFilter['nbitemsbypage']);                             
                $this->pager->setPage($request->getGetParameter('page'));
                $this->pager->execute();              
               }                                            
        }
        catch (mfException $e)
        {
            $messages->addError($e);           
        }                
        //var_dump($this->pager);
    }
    
}    
