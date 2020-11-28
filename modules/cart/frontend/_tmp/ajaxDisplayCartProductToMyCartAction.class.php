<?php
//require_once __DIR__ . "/../locales/Forms/CustomerUserViewForm.class.php";


class cart_ajaxDisplayCartProductToMyCartAction extends mfAction
{

    function execute(mfWebRequest $request)
    {
       var_dump($request->getPostParameter());
        //$messages = mfMessages::getInstance();
        $this->item=new CartProduct($request->getPostParameter());                          
       
                  

    }

}

