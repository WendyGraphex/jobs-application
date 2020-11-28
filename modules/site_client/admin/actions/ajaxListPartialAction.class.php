<?php

require_once __DIR__ . "/../locales/FormFilters/SiteClientFormFilter.class.php";
require_once __DIR__ . "/../locales/Pagers/SiteClientPager.class.php";

class site_client_ajaxListPartialAction extends mfAction {
    

    function execute(mfWebRequest $request) {   
        $messages = mfMessages::getInstance();
        $this->user=$this->getUser();
        $this->formFilter = new SiteClientFormFilter();
        $this->pager = new SiteClientPager();
        try
        {
            $this->formFilter->bind($request->getPostParameter('filter'));
            if ($this->formFilter->isValid()||$request->getPostParameter('filter')==null)
            {
              // echo $this->formFilter->getQuery()."<br/>";
                $this->pager->setQuery($this->formFilter->getQuery());
                $this->pager->setNbItemsByPage($this->formFilter['nbitemsbypage']);
              //  $this->pager->setParameter('lang',$this->getUSer()->getCountry());
                $this->pager->setPage($this->request->getGetParameter('page'));
                $this->pager->execute();
            }
            else
            {
              //  var_dump($this->formFilter->getErrorSchema()->getErrorsMessage());
            }    
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        }           
          
    }

}

