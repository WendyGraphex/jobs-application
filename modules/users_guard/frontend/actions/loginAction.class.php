<?php


class users_guard_loginAction extends mfAction
{

    function execute(mfWebRequest $request)
    {
        $messages = mfMessages::getInstance();
        $this->user = $this->getUser();
    }

}


