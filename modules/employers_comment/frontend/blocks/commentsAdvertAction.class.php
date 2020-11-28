<?php

require_once __DIR__."/../locales/FormFilters/EmployerAdvertCommentFormFilter.class.php";             
require_once __DIR__."/../locales/Pagers/EmployerAdvertCommentPager.class.php";

class employers_comment_commentsAdvertActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request) {    
        $messages = mfMessages::getInstance(); 
        $this->formFilter= new EmployerAdvertCommentFormFilter($request->getRequestParameter('search'),$request->getPostParameter('filter'));                                     
        $this->pager=new EmployerAdvertCommentPager();
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
                /// echo mfSiteDatabase::getInstance()->getQuery();               
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        }                           
      $this->tpl=$this->getParameter('tpl','default');          
    } 
    
    
}
