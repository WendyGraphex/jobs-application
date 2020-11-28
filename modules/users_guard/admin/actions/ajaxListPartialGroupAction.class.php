<?php

require_once __DIR__ . "/../locales/FormFilters/GroupsFormFilter.class.php";
require_once __DIR__ . "/../locales/Pagers/GroupsPager.class.php";

class users_guard_ajaxListPartialGroupAction extends mfAction
{

    function execute(mfWebRequest $request)
    {
        $messages = mfMessages::getInstance();
        $this->user = $this->getUser();
        $this->formFilter = new GroupsFormFilter($request->getRequestParameter('lang', $request->getPostParameter('lang', $this->getUser()->getCountry())), $this->user);
       // $this->formFilter = new GroupsFormFilter($request->getRequestParameter('lang',$this->getUser()->getLanguage()));  
        $this->pager = new GroupsPager();
       // $request->addRequestParameter('lang', $form->getLanguage());
        try {
            $this->formFilter->bind($request->getPostParameter('filter'));
            if ($this->formFilter->isValid() || $request->getPostParameter('filter') == null) {
                $this->pager->setQuery($this->formFilter->getQuery());
                $this->pager->setNbItemsByPage($this->formFilter['nbitemsbypage']);
                $this->pager->setParameter('lang', (string)$this->formFilter['lang']);
                $this->pager->setPage($this->request->getGetParameter('page'));
                $this->pager->execute();
            } else {
//                echo "<pre>";
//                var_dump($this->formFilter->getErrorSchema()->getErrorsMessage());
//                echo "</pre>";
                $messages->addError(__('Filter has some errors.'));
                    var_dump($this->formFilter->getErrorSchema()->getErrorsMessage());
            }
        } catch (mfException $e) {
            $messages->addError($e);
        }
    }

}
