<?php
 
class PaypalHookResponseValidator extends mfValidatorJson {
    

     function doIsValid($value) {
         $data=parent::doIsValid($value);
         $values=array();
      //   echo "<pre>"; var_dump($data['resource']);
         $values['amount']=floatval($data['resource']['amount']['total']);
         $values['currency']=$data['resource']['amount']['currency'];
         $values['parent_payment']=$data['resource']['parent_payment'];
         $values['state']=$data['resource']['state'];
         $values['transaction_fee']['value']=$data['resource']['transaction_fee']['value'];
         $values['transaction_fee']['currency']=$data['resource']['transaction_fee']['currency'];
         return $values;
     }
    
}
