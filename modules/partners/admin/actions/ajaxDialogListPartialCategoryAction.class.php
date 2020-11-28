<?php

require_once __DIR__."/../locales/FormFilters/PartnerWorkCategoryDialogFormFilter.class.php";
require_once __DIR__."/../locales/Pagers/PartnerWorkCategoryPager.class.php";
require_once __DIR__."/../locales/Forms/PartnerWorkCategoryNodeDialogForm.class.php";

class partners_ajaxDialogListPartialCategoryAction extends mfAction {
    
     
    function execute(mfWebRequest $request) {

        $messages = mfMessages::getInstance();       
        $this->user=$this->getUser();
        if (!$request->getRequestParameter('node')) 
        {        
            $this->form=new PartnerWorkCategoryNodeDialogForm($request->getPostParameter('PartnerWorkCategoryNode'));
            $this->form->bind($request->getPostParameter('PartnerWorkCategoryNode'));     
            $this->node =$this->form->getNode();       
            $request->addRequestParameter('lang', $this->form->getLanguage());
        }
        else
        {                        
            $this->node =$request->getRequestParameter('node');                
        }
        if ($this->node->isNotLoaded())        
        {                 
             $this->node=new PartnerWorkCategory('root');
             $messages->addError(__("Category doesn't exist."));
        }   
        $this->formFilter= new PartnerWorkCategoryDialogFormFilter($this->node,$request->getRequestParameter('lang',$this->getUser()->getLanguage()));                  
        $this->pager=new PartnerWorkCategoryPager();
      //  echo mfSiteDatabase::getInstance()->getQuery();
        try
        {
               $this->formFilter->bind($request->getPostParameter('filter'));
               if ($this->formFilter->isValid()||$request->getPostParameter('filter')==null)
               {    
                    //echo $this->formFilter->getQuery();
                    $this->pager->setQuery($this->formFilter->getQuery()); 
                    $this->pager->setNbItemsByPage($this->formFilter['nbitemsbypage']);   
                    $this->pager->setParameter('lang',$this->formFilter->getLanguage()); 
                    $this->pager->setParameter('lb',$this->node->get('lb'));
                    $this->pager->setParameter('rb',$this->node->get('rb'));
                    $this->pager->setParameter('levelplusone',$this->node->get('level')+1);
                    $this->pager->setPage($request->getGetParameter('page'));
                    $this->pager->execute();    
                 //   echo mfSiteDatabase::getInstance()->getQuery();
               }      
               else
               {
                   $messages->addError(__('Filter has some errors.'));
                   // var_dump($this->formFilter->getErrorSchema()->getErrorsMessage());
               }    
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        }    
       // var_dump($this->pager[0]);
     
    }
    
}
