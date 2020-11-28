<?php

require_once __DIR__ . "/../locales/FormFilters/CustomerAcademyTopicForCategoryI18nFormFilter.class.php";
require_once __DIR__ . "/../locales/Pagers/CustomerAcademyTopicForCategoryI18nPager.class.php";
require_once __DIR__."/../locales/Forms/CustomerCourseCategoryNodeForm.class.php";

class customers_academy_ajaxListPartialTopicForCategoryI18nAction extends mfAction {
    

    function execute(mfWebRequest $request) {   
        $messages = mfMessages::getInstance();
        $this->user=$this->getUser();
        if (!$request->getRequestParameter('node'))
        {    
            $form=new CustomerCourseCategoryNodeForm(); //$this->getUser()->getLanguage());
            $form->bind($request->getPostParameter('CustomerCourseCategoryNode'));
            if (!$form->isValid())
            {
               //  var_dump($form->getErrorSchema()->getErrorsMessage());
                $messages->addError(__("Language is not valid."));
             //   $request->addRequestParameter('lang',$this->getUser()->getLanguage());
                $this->forward($this->getModuleName(),'ajaxListPartialCategory');  
            }             
            $this->node=$form->getNode();
        }
        else
        {
           $this->node=$request->getRequestParameter('node'); 
        }    
        
        $this->formFilter = new CustomerAcademyTopicForCategoryI18nFormFilter($request->getRequestParameter('lang',$request->getPostParameter('lang',$this->getUser()->getLanguage())));
        $this->pager = new CustomerAcademyTopicForCategoryI18nPager();
        try
        {
            $this->formFilter->bind($request->getPostParameter('filter'));
            if ($this->formFilter->isValid()||$request->getPostParameter('filter')==null)
            {
              // echo $this->formFilter->getQuery()."<br/>";
                $this->pager->setQuery($this->formFilter->getQuery());
                $this->pager->setNbItemsByPage($this->formFilter['nbitemsbypage']);
                $this->pager->setParameter('lang',(string)$this->formFilter['lang']); 
                $this->pager->setParameter('category_id',$this->node->get('id'));
                $this->pager->setPage($this->request->getGetParameter('page'));
                $this->pager->execute();
              //  echo mfSiteDatabase::getInstance()->getQuery();
            }
            else
            {
              //  var_dump($this->formFilter->getErrorSchema()->getErrorsMessage());
            }    
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        }         
          
    }

}

