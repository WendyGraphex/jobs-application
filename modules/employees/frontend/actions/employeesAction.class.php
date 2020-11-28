<?php

// www.project55.net/employees

require_once __DIR__."/../locales/FormFilters/EmployeeControllerFormFilter.class.php";             
require_once __DIR__."/../locales/Pagers/EmployeeControllerPager.class.php";


class employees_employeesAction extends mfAction {
    
    function execute(mfWebRequest $request) {   
        $messages = mfMessages::getInstance();          
        $this->formFilter= new EmployeeControllerFormFilter($request->getRequestParameter('search'),$request->getPostParameter('filter'));                                     
        $this->pager=new EmployeeControllerPager();
        try
        {
               $this->formFilter->bind($request->getPostParameter('filter'));
               if ($this->formFilter->isValid() || $request->getPostParameter('filter')==null)
               {    
                 //    echo $this->formFilter->getQuery();
                    $this->pager->setQuery($this->formFilter->getQuery()); 
                    $this->pager->setNbItemsByPage($$this->formFilter['nbitemsbypage']);   
                    $this->pager->setParameter('lang',$this->getUser()->getLanguage());                    
                    $this->pager->setParameter('level',1);
                    $this->pager->setPage($request->getGetParameter('page'));
                    $this->pager->execute();    
                // echo mfSiteDatabase::getInstance()->getQuery();
               }               
               else
               {
                //  var_dump($this->formFilter->getErrorSchema()->getErrorsMessage());
                   $messages->addError(__("Filter has errors."));
               }    
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        }     
    }
}
