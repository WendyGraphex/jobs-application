<?php

/*
 * login , password , dest, msg, udh , mode , origin , type, strategy, date, 
 * heure,id,callback,cvar, allow_vocal,personnalise
 */
class SmsBoxApi extends SmsBoxApiBase {
    
    
    function __construct($options=array()) {                       
        parent::__construct(array_merge(SmsBoxSettings::load()->getData(),$options));
    }
    
    
   
}