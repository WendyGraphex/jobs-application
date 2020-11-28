<?php

require_once __DIR__."/../locales/FormFilters/CustomerAcademyCourseFormFilter.class.php";
require_once __DIR__."/../locales/Pagers/CustomerAcademyCoursePager.class.php";

class customers_academy_teacher_ajaxListPartialCourseAction extends mfAction {
    
     
    
    
    function execute(mfWebRequest $request) {            
        if (!$this->getUser()->isTeacherUser())             
           $this->forwardTo401Action ();
        $messages = mfMessages::getInstance(); 
        $this->user=$this->getUser();
        $this->formFilter= new CustomerAcademyCourseFormFilter($this->getUser());                  
        $this->pager=new CustomerAcademyCoursePager();
        try
        {
               $this->formFilter->bind($request->getPostParameter('filter'));
               if ($this->formFilter->isValid()||$request->getPostParameter('filter')==null)
               {    
                $this->pager->setQuery($this->formFilter->getQuery()); 
                $this->pager->setNbItemsByPage($this->formFilter['nbitemsbypage']);     
               // $this->pager->setParameter('lang',$this->getUser()->getLanguage());
                $this->pager->setParameter('teacher_user_id',$this->getUser()->getGuardUser()->get('id'));
                $this->pager->setPage($request->getGetParameter('page'));
                $this->pager->execute();   
             //   echo mfSiteDatabase::getInstance()->getQuery();
               }                                    
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        }    
    }
    
   
}


