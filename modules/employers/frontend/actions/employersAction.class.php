<?php

// www.project55.net/employers

require_once __DIR__."/../locales/FormFilters/EmployerControllerFormFilter.class.php";             
require_once __DIR__."/../locales/Pagers/EmployerControllerPager.class.php";


class employers_employersAction extends mfAction {
    
    function execute(mfWebRequest $request) {   
        $messages = mfMessages::getInstance();          
       $this->formFilter= new EmployerControllerFormFilter($request->getRequestParameter('search'),$request->getPostParameter('filter'));                                     
        $this->pager=new EmployerControllerPager();
        try
        {
               $this->formFilter->bind($request->getPostParameter('filter'));
               if ($this->formFilter->isValid()||$request->getPostParameter('filter')==null)
               {    
                 //    echo $this->formFilter->getQuery();
                    $this->pager->setQuery($this->formFilter->getQuery()); 
                    $this->pager->setNbItemsByPage(9);   
                    $this->pager->setParameter('lang',$this->getUser()->getLanguage());                    
                    $this->pager->setParameter('level',1);
                    $this->pager->setPage($request->getGetParameter('page'));
                    $this->pager->execute();    
             //   echo mfSiteDatabase::getInstance()->getQuery();
               }               
               else
               {
                  // var_dump($this->formFilter->getErrorSchema()->getErrorsMessage());
                   $messages->addError(__("Filter has errors."));
               }    
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        }     
    }
}
