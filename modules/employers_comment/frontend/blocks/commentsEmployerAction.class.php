<?php

require_once __DIR__."/../locales/FormFilters/EmployerCommentFormFilter.class.php";             
require_once __DIR__."/../locales/Pagers/EmployerCommentPager.class.php";

class employers_comment_commentsEmployerActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request) {    
        $messages = mfMessages::getInstance(); 
        $this->formFilter= new EmployerCommentFormFilter($request->getRequestParameter('search'),$request->getPostParameter('filter'));                                     
        $this->pager=new EmployerCommentPager();
        try
        {                                 
                    //  echo $this->formFilter->getQuery();                                    
                 //  echo $this->formFilter['nbitemsbypage'];
                    $this->pager->setQuery($this->formFilter->getQuery()); 
                    $this->pager->setNbItemsByPage($this->formFilter['nbitemsbypage']);   
                     $this->pager->setParameter('employer_user_id',$this->getParameter('employer_user')->get('id'));                                                                                       
                    $this->pager->setPage($request->getGetParameter('page'));
                    $this->pager->execute();                      
                 // echo mfSiteDatabase::getInstance()->getQuery();               
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        }                        
      $this->tpl=$this->getParameter('tpl','default');          
    } 
    
    
}
