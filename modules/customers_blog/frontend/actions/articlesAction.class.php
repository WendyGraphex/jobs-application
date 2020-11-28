<?php

// www.project55.net/blog/articles
require_once __DIR__."/../locales/FormFilters/CustomerBlogArticleControllerFormFilter.class.php";             
require_once __DIR__."/../locales/Pagers/CustomerBlogArticleControllerPager.class.php";


class customers_blog_articlesAction extends mfAction {
    
       
    function execute(mfWebRequest $request) {                    
        $this->user=$this->getUser();
        $messages = mfMessages::getInstance();              
        $this->formFilter= new CustomerBlogArticleControllerFormFilter($request->getRequestParameter('search'),$request->getPostParameter('filter'));                                     
        $this->pager=new CustomerBlogArticleControllerPager($this->getUser());
        try
        {
               $this->formFilter->bind($request->getPostParameter('filter'));
               if ($this->formFilter->isValid()||$request->getPostParameter('filter')==null)
               {    
                 // echo $this->formFilter->getQuery();                                                                      
                    $this->pager->setQuery($this->formFilter->getQuery()); 
                    $this->pager->setNbItemsByPage($this->formFilter['nbitemsbypage']);   
                    $this->pager->setParameter('lang',$this->getUser()->getLanguage());                                     
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
     // var_dump($this->pager->getItems(),$messages->getMessages()); die(__METHOD__);
       
    }

}
