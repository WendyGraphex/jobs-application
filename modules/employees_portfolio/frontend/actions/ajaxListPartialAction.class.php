<?php

require_once __DIR__."/../locales/FormFilters/EmployeePortfolioDocumentFormFilter.class.php";
require_once __DIR__."/../locales/Pagers/EmployeePortfolioDocumentPager.class.php";

class employees_portfolio_ajaxListPartialAction extends mfAction {
    
     
    function execute(mfWebRequest $request) {   
      $messages = mfMessages::getInstance();   
      if (!$this->getUser()->isAuthenticated() || !$this->getUser()->isEmployee())             
            $this->forwardTo401Action ();
      //  $this->document=new EmployeeAdvertDocument($this->getUser()->getGuardUser());
        //$this->document->create($form->getFile());
       $this->formFilter= new EmployeePortfolioDocumentFormFilter($this->getUser());                  
        $this->pager=new EmployeePortfolioDocumentPager();
        try
        {
               $this->formFilter->bind($request->getPostParameter('filter'));
               if ($this->formFilter->isValid()||$request->getPostParameter('filter')==null)
               {    
                $this->pager->setQuery($this->formFilter->getQuery()); 
                $this->pager->setNbItemsByPage($this->formFilter['nbitemsbypage']);     
               // $this->pager->setParameter('lang',$this->getUser()->getLanguage());
                $this->pager->setParameter('employee_user_id',$this->getUser()->getGuardUser()->get('id'));
                $this->pager->setPage($request->getGetParameter('page'));
                $this->pager->execute();   
              //  echo mfSiteDatabase::getInstance()->getQuery();
               }                                    
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        }  
    }
    
 
   
}


