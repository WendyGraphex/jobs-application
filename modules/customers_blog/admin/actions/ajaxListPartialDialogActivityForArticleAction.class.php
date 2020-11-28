<?php

require_once __DIR__."/../locales/FormFilters/CustomerBlogActivityDialogFormFilter.class.php";
require_once __DIR__."/../locales/Pagers/CustomerBlogActivityDialogPager.class.php";
require_once __DIR__."/../locales/Forms/CustomerBlogActivitySelectionForm.class.php";

class customers_blog_ajaxListPartialDialogActivityForArticleAction extends mfAction {
    
      
    function execute(mfWebRequest $request) {       
           
        $messages = mfMessages::getInstance();       
        $this->user=$this->getUser();
        if (!$request->getRequestParameter('CustomerBlogActivityNode')) 
        {        
            $form=new CustomerBlogActivitySelectionForm($request->getPostParameter('CustomerBlogActivityNode'));
            $form->bind($request->getPostParameter('CustomerBlogActivityNode'));     
            $this->node =$form->getNode();  
            $this->selection=$form->getSelection();
            $request->addRequestParameter('lang', $form->getLanguage());            
        }
        else
        {              
            $this->node =$request->getRequestParameter('CustomerBlogActivityNode');   
            $this->selection=$request->getRequestParameter('selection',new mfArray());
        }
        if ($this->node->isNotLoaded())        
        {                 
             $this->node=new CustomerBlogActivity('root');             
             $messages->addError(__("Category doesn't exist."));
        }           
        $this->formFilter= new CustomerBlogActivityDialogFormFilter($this->node,$request->getRequestParameter('lang',$this->getUser()->getLanguage()));                  
        $this->pager=new CustomerBlogActivityDialogPager();
        try
        {
               $this->formFilter->bind($request->getPostParameter('filter'));
               if ($this->formFilter->isValid()||$request->getPostParameter('filter')==null)
               {    
                  // echo $this->formFilter->getQuery();
                    $this->pager->setQuery($this->formFilter->getQuery()); 
                    $this->pager->setNbItemsByPage($this->formFilter['nbitemsbypage']);   
                    $this->pager->setParameter('lang',$this->getUser()->getLanguage()); 
                    $this->pager->setParameter('lb',$this->node->get('lb'));
                    $this->pager->setParameter('rb',$this->node->get('rb'));
                    $this->pager->setParameter('levelplusone',$this->node->get('level')+1);
                    $this->pager->setPage($request->getGetParameter('page'));
                    $this->pager->execute();    
                 //  echo mfSiteDatabase::getInstance()->getQuery();
               }      
               else
               {
                   $messages->addError(__('Filter has some errors.'));
                  //   var_dump($this->formFilter->getErrorSchema()->getErrorsMessage());
               }    
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        }  
       //  var_dump((string)$this->formFilter->getLanguage());
       
    }
    
}
