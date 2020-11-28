<?php



 class UtilsNodeJsForm extends mfForm {
 
   
    function configure()
    {        
        $this->setValidators(array(            
           // 'nodejs'=>new mfValidatorString(),                     
            'port'=>new mfValidatorInteger(array('min'=>0)),
            'protocol'=>new mfValidatorChoice(array('key'=>true,'choices'=>array('http'=>'http','https'=>'https'))),
            "debug"=>new mfValidatorChoice(array('key'=>true,'choices'=>array(true=>__("YES"),false=>__("NO")))), 
        ));                      
    }
   
}


