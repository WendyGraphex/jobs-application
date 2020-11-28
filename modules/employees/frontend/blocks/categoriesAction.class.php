<?php

require_once __DIR__."/../locales/FormFilters/EmployeePartnerWorkCategoryFormFilter.class.php";             
require_once __DIR__."/../locales/Pagers/EmployeePartnerWorkCategoryPager.class.php";

 

class employees_categoriesActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request)
    {             
        $this->tpl=$this->getParameter('tpl','default');
        $this->formFilter= new EmployeePartnerWorkCategoryFormFilter($request->getRequestParameter('search'),$request->getPostParameter('filter'));                                     
        $this->pager=new EmployeePartnerWorkCategoryPager($this->getUser());
        try
        {       
               $this->formFilter->bind($request->getPostParameter('filter'));
               if ($this->formFilter->isValid() || $request->getPostParameter('filter')==null)
               { 
               // echo $this->formFilter->getQuery(); 
                $this->pager->setQuery($this->formFilter->getQuery()); 
                 $this->pager->setNbItemsByPage($this->formFilter['nbitemsbypage']);      
              //  $this->pager->setParameter('lang',$this->getUser()->getLanguage());                    
                $this->pager->setParameter('lb',$this->getParameter('node')->get('lb'));
                $this->pager->setParameter('rb',$this->getParameter('node')->get('rb'));
              //  $this->pager->setParameter('level',$this->getParameter('node')->get('level'));
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
               else
               {
                  // var_dump($this->formFilter->getErrorSchema()->getErrorsMessage());
               }    
        }
        catch (mfException $e)
        {
             //$messages->addError($e);
          //    echo $e->getMessage();    die(__METHOD__);       
        }    
      //  var_dump($this->formFilter['range']['budget']->getArray()->getValues()->toJson());
               
    }         
}

