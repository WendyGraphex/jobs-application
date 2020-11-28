<?php


require_once __DIR__."/../locales/FormFilters/EmployeePortfolioDocumentCardFormFilter.class.php";
require_once __DIR__."/../locales/Pagers/EmployeePortfolioDocumentCardPager.class.php";

class employees_portfolio_portfolioActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request)
    {              
        $this->tpl=$this->getParameter('tpl','default');      
        $this->employee_user=$this->getParameter('employee_user');        
        $this->formFilter= new EmployeePortfolioDocumentCardFormFilter($this->getUser(),$this->getParameter('filter'));                  
        $this->pager=new EmployeePortfolioDocumentCardPager();
        try
        {
                $this->formFilter->bind($request->getPostParameter('filter'));                 
                $this->pager->setQuery($this->formFilter->getQuery()); 
                $this->pager->setNbItemsByPage($this->formFilter['nbitemsbypage']);     
                $this->pager->setParameter('lang',$this->getUser()->getLanguage());
                $this->pager->setParameter('employee_user_id',$this->employee_user->get('id'));
                $this->pager->setPage($request->getGetParameter('page'));
                $this->pager->execute();   
               //  echo mfSiteDatabase::getInstance()->getQuery();                       
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        }  
    } 
    
    
}