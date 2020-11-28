<?php

require_once __DIR__ . "/../locales/FormFilters/SmsBoxModelFormFilter.class.php";


class services_smsbox_ajaxListPartialModelAction extends mfAction
{

    function execute(mfWebRequest $request)
    {
        $messages = mfMessages::getInstance();
        $this->user = $this->getUser();
        $this->formFilter = new SmsBoxModelFormFilter($this->getUser());
        $this->pager = new Pager('SmsBoxModel');
        try 
        {
            $this->formFilter->bind($request->getPostParameter('filter'));
            if ($this->formFilter->isValid() || $request->getPostParameter('filter') == null) {
                $this->pager->setQuery($this->formFilter->getQuery());
                $this->pager->setNbItemsByPage($this->formFilter['nbitemsbypage']);               
                $this->pager->setPage($this->request->getGetParameter('page'));
                $this->pager->execute();
            }
        } catch (mfException $e) {
            $messages->addError($e);
        }
    }

}

