<?php

require_once __DIR__ . "/../locales/FormFilters/SmsBoxSentFormFilter.class.php";


class services_smsbox_ajaxListPartialSmsBoxAction extends mfAction
{

    function execute(mfWebRequest $request)
    {
        $messages = mfMessages::getInstance();
        $this->user = $this->getUser();       
        $this->formFilter = new SmsBoxSentFormFilter($this->user);
        $this->pager = new Pager('SmsBoxSent');
        try 
        {
            $this->formFilter->bind($request->getPostParameter('filter'));
            if ($this->formFilter->isValid() || $request->getPostParameter('filter') == null) {
                $this->pager->setQuery($this->formFilter->getQuery());
                $this->pager->setNbItemsByPage($this->formFilter['nbitemsbypage']);               
                $this->pager->setPage($this->request->getGetParameter('page'));
                $this->pager->execute();

            //    echo mfSiteDatabase::getInstance()->getQuery();

            }
        } catch (mfException $e) {
            $messages->addError($e);
        }

    }

}

