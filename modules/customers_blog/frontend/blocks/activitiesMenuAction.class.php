<?php

require_once __DIR__."/../locales/FormFilters/CustomerBlogActivityMenuFormFilter.class.php";             
require_once __DIR__."/../locales/Pagers/CustomerBlogActivityMenuPager.class.php";

 

class customers_blog_activitiesMenuActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request)
    {                                    
       $this->tpl=$this->getParameter('tpl','default');
        $this->formFilter= new CustomerBlogActivityMenuFormFilter($request->getRequestParameter('search'),$request->getPostParameter('filter'));                                     
        $this->pager=new CustomerBlogActivityMenuPager($this->getUser());
        try
        {       
               $this->formFilter->bind($request->getPostParameter('filter'));
               if ($this->formFilter->isValid() || $request->getPostParameter('filter')==null)
               { 
               // echo $this->formFilter->getQuery(); 
                $this->pager->setQuery($this->formFilter->getQuery()); 
                 $this->pager->setNbItemsByPage($this->formFilter['nbitemsbypage']);      
                $this->pager->setParameter('lang',$this->getUser()->getLanguage());                    
                $this->pager->setParameter('lb',$this->getParameter('node')->get('lb'));
                $this->pager->setParameter('rb',$this->getParameter('node')->get('rb'));
                $this->pager->setParameter('level_plus_one',$this->getParameter('node')->get('level') + 1);
                $this->pager->setPage($request->getGetParameter('page'));
                $this->pager->execute();                  
              //     echo mfSiteDatabase::getInstance()->getQuery();    
              //  die(__METHOD__); 
              /* if ($search=$request->getRequestParameter('search'))    
                {    
                    $searche= new CustomerBlogActivitySearch($search->getOptions());                    
                    $searche->set('number_of_results',$this->pager->getNbItems());
                    $searche->create();
                }*/
            
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
        //echo "<pre>"; var_dump($this->pager->getItems());
          
    }         
}

