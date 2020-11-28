<?php

require_once __DIR__."/../locales/FormFilters/CustomerBlogArticleActivityFormFilter.class.php";             
require_once __DIR__."/../locales/Pagers/CustomerBlogArticleActivityPager.class.php";

 

class customers_blog_activityActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request)
    {                            
        $this->tpl=$this->getParameter('tpl','default');
        $this->node=$this->getParameter('node',new CustomerBlogActivity(array('name'=>$this->getParameter('activity'))));    
        if ($this->node->isNotLoaded())
            return mfView::NONE;
        $this->formFilter= new CustomerBlogArticleActivityFormFilter($request->getRequestParameter('search'),$request->getPostParameter('filter',$this->getParameter('filter')));                                     
        $this->pager=new CustomerBlogArticleActivityPager($this->getUser());
        try
        {       
               $this->formFilter->bind($request->getPostParameter('filter'));
               if ($this->formFilter->isValid() || $request->getPostParameter('filter')==null)
               { 
                //  echo $this->formFilter->getQuery(); 
                $this->pager->setQuery($this->formFilter->getQuery()); 
                 $this->pager->setNbItemsByPage($this->formFilter['nbitemsbypage']);      
              //  $this->pager->setParameter('lang',$this->getUser()->getLanguage());                    
                $this->pager->setParameter('lb',$this->node->get('lb'));
                $this->pager->setParameter('rb',$this->node->get('rb'));
                $this->pager->setParameter('level',$this->node->get('level'));
                $this->pager->setPage($request->getGetParameter('page'));
                $this->pager->execute();                  
               //     echo mfSiteDatabase::getInstance()->getQuery();    
                
             /*  if ($search=$request->getRequestParameter('search'))    
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
        if ($this->tpl=='success')
        {
         //  echo "<pre>"; var_dump($this->node);
        }   
    }         
}

