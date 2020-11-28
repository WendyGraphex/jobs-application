<?php

//require_once __DIR__."/../locales/FormFilters/EmployeeAdvertCommentFormFilter.class.php";             
//require_once __DIR__."/../locales/Pagers/EmployeeAdvertCommentPager.class.php";

class employees_comment_commentsActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request) {    
        $messages = mfMessages::getInstance(); 
     /*   $this->formFilter= new EmployeeAdvertCommentFormFilter($request->getRequestParameter('search'),$request->getPostParameter('filter'));                                     
        $this->pager=new EmployeeAdvertCommentPager();
        try
        {                                 
                   //  echo $this->formFilter->getQuery();                                    
                 //  echo $this->formFilter['nbitemsbypage'];
                    $this->pager->setQuery($this->formFilter->getQuery()); 
                    $this->pager->setNbItemsByPage($this->formFilter['nbitemsbypage']);   
                    $this->pager->setParameter('advert_lang',$this->getParameter('advert_i18n')->get('lang'));                                     
                    $this->pager->setParameter('advert_id',$this->getParameter('advert_i18n')->get('advert_id'));                                     
                    $this->pager->setPage($request->getGetParameter('page'));
                    $this->pager->execute();                      
                  // echo mfSiteDatabase::getInstance()->getQuery();               
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        }                           */
      $this->tpl=$this->getParameter('tpl','default');          
    } 
    
    
}
