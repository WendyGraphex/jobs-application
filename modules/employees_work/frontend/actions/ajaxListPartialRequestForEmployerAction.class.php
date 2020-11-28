<?php

require_once __DIR__."/../locales/FormFilters/EmployeeWorkPaymentRequestForEmployerFormFilter.class.php";
require_once __DIR__."/../locales/Pagers/EmployeeWorkPaymentRequestForEmployerPager.class.php";

class employees_work_ajaxListPartialRequestForEmployerAction extends mfAction {
    
             
    function execute(mfWebRequest $request) {            
        if (!$this->getUser()->isAuthenticated() || !$this->getUser()->isEmployerUser())             
            $this->forwardTo401Action();
        $messages = mfMessages::getInstance();   
        
        $this->project = $request->getRequestParameter('project',new Project($request->getPostParameter('Project'),$this->getUser()->getGuardUser()));
        if ($this->project->isNotLoaded())
            return ;
        $this->formFilter= new EmployeeWorkPaymentRequestForEmployerFormFilter();                  
        $this->pager=new EmployeeWorkPaymentRequestForEmployerPager();
        try
        {
               $this->formFilter->bind($request->getPostParameter('filter'));
               if ($this->formFilter->isValid()||$request->getPostParameter('filter')==null)
               {             
                //   echo $this->formFilter->getQuery();
                $this->pager->setQuery($this->formFilter->getQuery()); 
                $this->pager->setNbItemsByPage($this->formFilter['nbitemsbypage']);     
              //  $this->pager->setParameter('lang',$this->getUser()->getLanguage());
                $this->pager->setParameter('employer_user_id',$this->getUser()->getGuardUser()->get('id'));
                $this->pager->setParameter('quotation_id',$this->project->getQuotation()->get('id'));
                $this->pager->setPage($request->getGetParameter('page'));
                $this->pager->execute();              
                 //echo mfSiteDatabase::getInstance()->getQuery();
               }                                    
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        }   
    }
    
   
}

