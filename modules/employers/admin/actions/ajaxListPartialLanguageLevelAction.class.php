<?php

require_once __DIR__ . "/../locales/FormFilters/EmployerLanguageLevelFormFilter.class.php";
require_once __DIR__ . "/../locales/Pagers/EmployerLanguageLevelPager.class.php";

class employers_ajaxListPartialLanguageLevelAction extends mfAction {
    

    function execute(mfWebRequest $request) {   
        $messages = mfMessages::getInstance();
        $this->user=$this->getUser();
        $this->formFilter = new EmployerLanguageLevelFormFilter($request->getRequestParameter('lang',$request->getPostParameter('lang',$this->getUser()->getLanguage())));
        $this->pager = new EmployerLanguageLevelPager();
        try
        {
            $this->formFilter->bind($request->getPostParameter('filter'));
            if ($this->formFilter->isValid()||$request->getPostParameter('filter')==null)
            {
              // echo $this->formFilter->getQuery()."<br/>";
                $this->pager->setQuery($this->formFilter->getQuery());
                $this->pager->setNbItemsByPage($this->formFilter['nbitemsbypage']);
                $this->pager->setParameter('lang',(string)$this->formFilter['lang']);     
                $this->pager->setPage($this->request->getGetParameter('page'));
                $this->pager->execute();
              //  echo mfSiteDatabase::getInstance()->getQuery();
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

