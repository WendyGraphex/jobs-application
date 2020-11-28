<?php

require_once __DIR__."/../locales/FormFilters/EmployerUserForCompanyFormFilter.class.php";
require_once __DIR__."/../locales/Pagers/EmployerUserForCompanyPager.class.php";

class employers_ajaxListPartialUserForCompanyAction extends mfAction {
    
      
    function execute(mfWebRequest $request) {

        $messages = mfMessages::getInstance();       
        $this->user=$this->getUser();
        $this->company= $request->getRequestParameter('company',new EmployerCompany($request->getParameter('EmployerCompany')));
        if ($this->company->isNotLoaded())
            return ;
        $this->formFilter= new EmployerUserForCompanyFormFilter();                  
        $this->pager=new EmployerUserForCompanyPager();
        try
        {
               $this->formFilter->bind($request->getPostParameter('filter'));
               if ($this->formFilter->isValid()||$request->getPostParameter('filter')==null)
               {    
                $this->pager->setQuery($this->formFilter->getQuery()); 
                $this->pager->setNbItemsByPage($this->formFilter['nbitemsbypage']);     
                $this->pager->setParameter('lang',$this->getUser()->getLanguage());
                $this->pager->setParameter('company_id',$this->company->get('id'));
                $this->pager->setPage($request->getGetParameter('page'));
                $this->pager->execute();              
               }                                    
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        }    
       // var_dump($this->pager[0]);
     
    }
    
}

