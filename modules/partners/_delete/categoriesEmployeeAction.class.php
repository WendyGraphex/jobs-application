<?php

require_once __DIR__."/../locales/FormFilters/PartnerEmployeeAdvertControllerFormFilter.class.php";             
require_once __DIR__."/../locales/Pagers/PartnerEmployeeAdvertControllerPager.class.php";

class partners_categoriesEmployeeActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request)
    {              
        $this->user=$this->getUser();
        $messages = mfMessages::getInstance();             
        $this->formFilter= new PartnerEmployeeAdvertControllerFormFilter($this->getUser(),$request->getPostParameter('filter'));                                     
        $this->pager=new PartnerEmployeeAdvertControllerPager();
        try
        {
               $this->formFilter->bind($request->getPostParameter('filter'));
               if ($this->formFilter->isValid()||$request->getPostParameter('filter')==null)
               {    
                  // echo $this->formFilter->getQuery();                
                    $this->pager->setQuery($this->formFilter->getQuery()); 
                    $this->pager->setNbItemsByPage($this->formFilter['nbitemsbypage']);   
                   // $this->pager->setParameter('lang',$this->getUser()->getLanguage());                                     
                    $this->pager->setPage($request->getGetParameter('page'));
                    $this->pager->execute();                      
                // echo mfSiteDatabase::getInstance()->getQuery();
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
        // var_dump($this->pager->getItems());
      //  var_dump($messages->getDecodedMessages());
        
      //  die(__METHOD__);
    }         
}

