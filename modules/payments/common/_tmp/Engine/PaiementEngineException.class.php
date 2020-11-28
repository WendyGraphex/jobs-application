<?php


class paymentEngineException extends mfException
{
    const ERROR_payment_CLASS_NOT_EXISTS=1,
          ERROR_payment_CART_NOT_EXISTS=2,
          ERROR_payment_CART_NOT_PROCESSED=3,
          ERROR_payment_CART_OPTIONS_NOT_VALID=4;
    
     function __construct($code) {
        parent::__construct("payment Engine [".$code."]", $code);
    }
}
