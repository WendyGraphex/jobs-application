<?php

require_once __DIR__."/../locales/FormFilters/CustomerCourseCategoryFormFilter.class.php";             
require_once __DIR__."/../locales/Pagers/CustomerCourseCategoryPager.class.php";

 

class customers_academy_categoriesActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request)
    {                           
        $this->node=$this->getParameter('node',new CustomerCourseCategory('root'));
        $this->tpl=$this->getParameter('tpl','default');
        $this->formFilter= new CustomerCourseCategoryFormFilter($request->getRequestParameter('search'),$request->getPostParameter('filter'));                                     
        $this->pager=new CustomerCourseCategoryPager($this->getUser());
        try
        {       
               $this->formFilter->bind($request->getPostParameter('filter'));
               
               // echo $this->formFilter->getQuery(); 
                $this->pager->setQuery($this->formFilter->getQuery()); 
                 $this->pager->setNbItemsByPage($this->formFilter['nbitemsbypage']);      
              //  $this->pager->setParameter('lang',$this->getUser()->getLanguage());                    
                $this->pager->setParameter('lb',$this->node->get('lb'));
                $this->pager->setParameter('rb',$this->node->get('rb'));
              //  $this->pager->setParameter('level',$this->getParameter('node')->get('level'));
                $this->pager->setPage($request->getGetParameter('page'));
                $this->pager->execute();                  
                 // echo mfSiteDatabase::getInstance()->getQuery();    
                
              /*  if ($search=$request->getRequestParameter('search'))    
                {    
                    $searche= new EmployeeAdvertSearch($search->getOptions());                    
                    $searche->set('number_of_results',$this->pager->getNbItems());
                    $searche->create();
                }*/
            
                  
        }
        catch (mfException $e)
        {
             //$messages->addError($e);
          //    echo $e->getMessage();    die(__METHOD__);       
        }    
      //  var_dump($this->formFilter['range']['budget']->getArray()->getValues()->toJson());
               
    }         
}

