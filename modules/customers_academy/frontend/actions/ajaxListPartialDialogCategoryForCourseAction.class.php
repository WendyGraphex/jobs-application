<?php

require_once __DIR__."/../locales/FormFilters/CustomerCourseCategoryDialogFormFilter.class.php";
require_once __DIR__."/../locales/Pagers/CustomerCourseCategoryDialogPager.class.php";
require_once __DIR__."/../locales/Forms/CustomerCourseCategorySelectionForm.class.php";

class customers_academy_ajaxListPartialDialogCategoryForCourseAction extends mfAction {
    
      
    function execute(mfWebRequest $request) {

        $messages = mfMessages::getInstance();       
        $this->user=$this->getUser();
        if (!$request->getRequestParameter('node')) 
        {        
            $form=new CustomerCourseCategorySelectionForm($request->getPostParameter('CustomerCourseCategoryNode'));
            $form->bind($request->getPostParameter('CustomerCourseCategoryNode'));  
           // if (!$form->isValid()) var_dump($form->getErrorSchema ()->getErrorsMessage());
            $this->node =$form->getNode();  
            $this->selection=$form->getSelection();
            $request->addRequestParameter('lang', $form->getLanguage());
        }
        else
        {              
            $this->node =$request->getRequestParameter('node');   
            $this->selection=$request->getRequestParameter('selection',new mfArray());
        }
        if ($this->node->isNotLoaded())        
        {                 
             $this->node=new CustomerCourseCategory('root');             
             $messages->addError(__("Category doesn't exist."));
        }           
        $this->formFilter= new CustomerCourseCategoryDialogFormFilter($request->getRequestParameter('lang',$this->getUser()->getLanguage()));                  
        $this->pager=new CustomerCourseCategoryDialogPager();
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
                   //  var_dump($this->formFilter->getErrorSchema()->getErrorsMessage());
               }    
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        }  
       // var_dump($this->pager[0]);
     
    }
    
}
