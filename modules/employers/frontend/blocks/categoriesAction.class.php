<?php

require_once __DIR__."/../locales/FormFilters/EmployerPartnerWorkCategoryFormFilter.class.php";             
require_once __DIR__."/../locales/Pagers/EmployerPartnerWorkCategoryPager.class.php";

 

class employers_categoriesActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request)
    {              
        $this->tpl=$this->getParameter('tpl','default');    
        $this->node=$this->getParameter('node');
     //  var_dump($this->getParameter('node')->get('lb'),$this->getParameter('node')->get('rb'));
        $this->formFilter= new EmployerPartnerWorkCategoryFormFilter($request->getRequestParameter('search'),$request->getPostParameter('filter'));                    
        $this->pager=new EmployerPartnerWorkCategoryPager($this->getUser());       
        try
        {         
               $this->formFilter->bind($request->getPostParameter('filter'));
               if ($this->formFilter->isValid()||$request->getPostParameter('filter')==null)
               {    
               //  echo $this->formFilter->getQuery();
                $this->pager->setQuery($this->formFilter->getQuery()); 
                 $this->pager->setNbItemsByPage($this->formFilter['nbitemsbypage']);      
             //   $this->pager->setParameter('lang',$this->getUser()->getLanguage());                    
                $this->pager->setParameter('lb',$this->node->get('lb'));
                $this->pager->setParameter('rb',$this->node->get('rb'));
              //  $this->pager->setParameter('level',$this->getParameter('node')->get('level'));
                $this->pager->setPage($request->getGetParameter('page'));
                $this->pager->execute();    
                  if ($search=$request->getRequestParameter('search'))    
                    {    
                        $searche= new EmployerAdvertSearch($search->getOptions());                   
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
           // $messages->addError($e);
          //  echo $e->getMessage();
             
        }        
    }         
}

