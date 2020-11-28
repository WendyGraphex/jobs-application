<?php
 

class SmsBoxSettings extends SiteSettings {      
       
    
     function getDefaults()
     {   
         parent::getDefaults();
         $this->add(array(
                'login'=>"" ,
                'pass'=>"" ,                
                'udh'=>1,
                'mode'=>"Standard",
                'origine'=>"",
                'type'=>0,
                'strategy'=>2,
                'debug'=>1,
              //  'date',
              //  'heure',
                 'id'=>1,
                 'callback'=>0,
               // 'cvar',
              //  'allow_vocal',
              //  'personnalise'   
                'ips'=>'127.0.0.1,37.59.198.135,178.33.185.51,37.59.198.133,37.59.198.144,37.59.198.145,178.33.185.48',
                'debug_phone'=>"+9990611111",
                'version'=>"1.0"
              ));        
     }
         
     function getIps()
     {
         if ($this->get('ips'))
            return new mfArray(explode(",",$this->get('ips')));
         return new mfArray();
     }
         
     function isDebugMode()
     {
         return (boolean)($this->get('debug')==1);
     }

     
     function getData()
     {
         $values=array();
         foreach (array('login','pass','udh','mode','origine','type','strategy','debug','id','callback','version') as $field)
            $values[$field]=$this->get($field);
         return $values;
     }



}
