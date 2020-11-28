<?php

require_once __DIR__."/../locales/FormFilters/EmployeeCommentFormFilter.class.php";             
require_once __DIR__."/../locales/Pagers/EmployeeCommentPager.class.php";

class employees_comment_commentsEmployeeActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request) {    
        $messages = mfMessages::getInstance(); 
        $this->formFilter= new EmployeeCommentFormFilter($request->getRequestParameter('search'),$request->getPostParameter('filter'));                                     
        $this->pager=new EmployeeCommentPager();
        try
        {                                 
                   //  echo $this->formFilter->getQuery();                                    
                 //  echo $this->formFilter['nbitemsbypage'];
                    $this->pager->setQuery($this->formFilter->getQuery()); 
                    $this->pager->setNbItemsByPage($this->formFilter['nbitemsbypage']);                                       
                    $this->pager->setParameter('employee_user_id',$this->getParameter('employee_user')->get('id'));                                     
                    $this->pager->setPage($request->getGetParameter('page'));
                    $this->pager->execute();                      
                 //   echo mfSiteDatabase::getInstance()->getQuery();               
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        }                           
      $this->tpl=$this->getParameter('tpl','default');          
    } 
    
    
}
