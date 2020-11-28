<?php

require_once __DIR__ . "/../locales/FormFilters/UsersFormFilter.class.php";
require_once __DIR__ . "/../locales/Pagers/UserPager.class.php";

class users_ajaxListPartialUserAction extends mfAction
{

    function execute(mfWebRequest $request)
    {      
        $messages = mfMessages::getInstance();
        $this->user = $this->getUser();
        $this->formFilter = new UsersFormFilter($this->getUser());
        $this->pager = new UserPager();
        try {
            $this->formFilter->bind($request->getPostParameter('filter'));
            if ($this->formFilter->isValid() || $request->getPostParameter('filter') == null) {
                $this->pager->setQuery($this->formFilter->getQuery());
                $this->pager->setNbItemsByPage($this->formFilter['nbitemsbypage']);
                $this->pager->setParameter('lang', $this->getUSer()->getLanguage());
                $this->pager->setPage($this->request->getGetParameter('page'));
                $this->pager->execute();               
            }
        } catch (mfException $e) {
            $messages->addError($e);
        }
    }

}

