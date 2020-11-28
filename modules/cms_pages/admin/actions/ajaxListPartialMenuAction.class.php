<?php

require_once __DIR__."/../locales/FormFilters/CmsMenuFormFilter.class.php";
require_once __DIR__."/../locales/Pagers/CmsMenuPager.class.php";
require_once __DIR__."/../locales/Forms/Menu/CmsMenuNodeForm.class.php";

class cms_pages_ajaxListPartialMenuAction extends mfAction {
    
      
    function execute(mfWebRequest $request) {

        $messages = mfMessages::getInstance();       
        $this->user=$this->getUser();
        if (!$request->getRequestParameter('node')) 
        {        
            $form=new CmsMenuNodeForm($request->getPostParameter('CmsMenuNode'));
            $form->bind($request->getPostParameter('CmsMenuNode'));   
           // if (!$form->isValid())
           //     var_dump ($form->getErrorSchema ()->getErrorsMessage());
            $this->node =$form->getNode();       
            $request->addRequestParameter('lang', $form->getLanguage());
        }
        else
        {                        
            $this->node =$request->getRequestParameter('node');                
        }
        if ($this->node->isNotLoaded())        
        {                 
             $this->node=new CmsMenu('root');
             $messages->addError(__("Menu doesn't exist."));
        }   
        $this->formFilter= new CmsMenuFormFilter($request->getRequestParameter('lang',$this->getUser()->getLanguage()));                  
        $this->pager=new CmsMenuPager();
      //  echo mfSiteDatabase::getInstance()->getQuery();    
        try
        {
               $this->formFilter->bind($request->getPostParameter('filter'));
               if ($this->formFilter->isValid()||$request->getPostParameter('filter')==null)
               {    
                   // echo $this->formFilter->getQuery();
                    $this->pager->setQuery($this->formFilter->getQuery()); 
                    $this->pager->setNbItemsByPage($this->formFilter['nbitemsbypage']);   
                    $this->pager->setParameter('lang',$this->formFilter->getLanguage()); 
                    $this->pager->setParameter('lb',$this->node->get('lb'));
                    $this->pager->setParameter('rb',$this->node->get('rb'));
                    $this->pager->setParameter('levelplusone',$this->node->get('level')+1);
                    $this->pager->setPage($request->getGetParameter('page'));
                    $this->pager->execute();    
                     // echo mfSiteDatabase::getInstance()->getQuery();
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
    //   var_dump($this->node->getFathers()->getMenus());
    }
    
}
