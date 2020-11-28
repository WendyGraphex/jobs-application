<?php

require_once __DIR__."/../locales/FormFilters/EmployerPartnerWorkCategoryDialogFormFilter.class.php";
require_once __DIR__."/../locales/Pagers/EmployerPartnerWorkCategoryDialogPager.class.php";
require_once __DIR__."/../locales/Forms/EmployerPartnerWorkCategorySelectionForm.class.php";

class employers_ajaxListPartialDialogCategoryForAdvertAction extends mfAction {
    
      
    function execute(mfWebRequest $request) {       
        if (!$this->getUser()->isEmployerUser() && !$this->getUser()->getStorage()->read('post_a_job_employer_user'))
                $this->forwardTo401Action();        
        $messages = mfMessages::getInstance();       
        $this->user=$this->getUser();
        if (!$request->getRequestParameter('EmployerAdvertCategory')) 
        {        
            $form=new EmployerPartnerWorkCategorySelectionForm($request->getPostParameter('EmployerAdvertCategory'));
            $form->bind($request->getPostParameter('EmployerAdvertCategory'));     
            $this->node =$form->getNode();  
            $this->selection=$form->getSelection();
            $request->addRequestParameter('lang', $form->getLanguage());
        }
        else
        {              
            $this->node =$request->getRequestParameter('EmployerAdvertCategory');   
            $this->selection=$request->getRequestParameter('selection',new mfArray());
        }
        if ($this->node->isNotLoaded())        
        {                 
             $this->node=new PartnerWorkCategory('root');             
             $messages->addError(__("Category doesn't exist."));
        }           
        $this->formFilter= new EmployerPartnerWorkCategoryDialogFormFilter($request->getRequestParameter('lang',$this->getUser()->getLanguage()));                  
        $this->pager=new EmployerPartnerWorkCategoryDialogPager();
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
                     var_dump($this->formFilter->getErrorSchema()->getErrorsMessage());
               }    
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        }  
       // var_dump($this->pager[0]);
     
    }
    
}
