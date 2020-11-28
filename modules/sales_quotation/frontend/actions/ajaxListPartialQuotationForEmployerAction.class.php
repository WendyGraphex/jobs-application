<?php

require_once __DIR__."/../locales/FormFilters/SaleEmployeeQuotationForEmployerFormFilter.class.php";             
require_once __DIR__."/../locales/Pagers/SaleEmployeeQuotationForEmployerPager.class.php";


class sales_quotation_ajaxListPartialQuotationForEmployerAction extends mfAction {
    
     
    function execute(mfWebRequest $request) {   
        
        $this->max_characters=500;
        
         if (!$this->getUser()->isAuthenticated() || !$this->getUser()->isEmployerUser()) 
            $this->forwardTo401Action();
         $this->user=$this->getUser();
        $messages = mfMessages::getInstance();              
       $this->formFilter= new SaleEmployeeQuotationForEmployerFormFilter($request->getPostParameter('filter'));                                     
        $this->pager=new SaleEmployeeQuotationForEmployerPager();
        try
        {
               $this->formFilter->bind($request->getPostParameter('filter'));
               if ($this->formFilter->isValid()||$request->getPostParameter('filter')==null)
               {    
                 // echo $this->formFilter->getQuery();
                 //  echo $this->formFilter['nbitemsbypage'];
                    $this->pager->setQuery($this->formFilter->getQuery()); 
                    $this->pager->setNbItemsByPage($this->formFilter['nbitemsbypage']);   
                    $this->pager->setParameter('lang',$this->getUser()->getLanguage());     
                    $this->pager->setParameter('employer_user_id',$this->getUser()->getGuardUser()->get('id'));
                    $this->pager->setPage($request->getGetParameter('page'));
                    $this->pager->execute();    
                    
                  //  echo $this->formFilter['nbitemsbypage'];
                    
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
      //  echo "<pre>"; var_dump($this->pager->getItems());
    }
}
