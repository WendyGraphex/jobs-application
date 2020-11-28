<?php

class CurrencySettingsForm extends mfForm {

     function configure() {
         $this->setValidators(array(
             "currency"=>new mfValidatorChoice(array("choices"=>array()))
         ));
     }
     
     function setCurrencies($currencies)
     {
         $choices=array();
         foreach ($currencies as $currency)
         {
             $choices[$currency]=$currency;
         }    
         $this->currency->setOption('choices',$choices);
     }
}
