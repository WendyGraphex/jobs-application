<?php

 
require_once __DIR__."/../locales/FormFilters/EmployeeAdvertControllerFormFilter.class.php";             
require_once __DIR__."/../locales/Pagers/EmployeeAdvertControllerPager.class.php";

class employees_advertsActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request)
    {                            
        $messages = mfMessages::getInstance(); 
        $this->formFilter= new EmployeeAdvertControllerFormFilter($request->getRequestParameter('search'),$request->getPostParameter('filter'));                                     
        $this->pager=new EmployeeAdvertControllerPager($this->getUser());
        try
        {                                 
                    //   echo $this->formFilter->getQuery();                                    
                 //  echo $this->formFilter['nbitemsbypage'];
                    $this->pager->setQuery($this->formFilter->getQuery()); 
                    $this->pager->setNbItemsByPage($this->formFilter['nbitemsbypage']);   
                   // $this->pager->setParameter('lang',$this->getUser()->getLanguage());                                     
                    $this->pager->setPage($request->getGetParameter('page'));
                    $this->pager->execute();                      
                // echo mfSiteDatabase::getInstance()->getQuery();     
                    
            if ($search=$request->getRequestParameter('search'))    
            {    
                $searche= new EmployeeAdvertSearch($search->getOptions());                   
                $searche->set('number_of_results',$this->pager->getNbItems());
                $searche->create();
            }
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        }     
        $this->tpl=$this->getParameter('tpl','default');      
    } 
    
    
}