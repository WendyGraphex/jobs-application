<?php

class ImportFilesFormFilter extends mfFilesFormFilter {
 
    function configure()
    {
        $this->setDefaults(array(
            'order'=>array(
                            "time"=>"desc",
                            
            ),
            'search'=>array(
                          
            ),
            'range'=>array(
                //  "time"=>array("from"=>null,"to"=>date("Y-m-d",time()+3600*24))
            ),
            'nbitemsbypage'=>"20",
       ));
    //   $this->setDirectory(mfConfig::get('mf_log_dir'));
       // Base Query       
       $this->setQuery("*.zip"); 
       // Validators 
       $this->setValidators(array(
            'selected'=> new  mfValidatorFileForImport(array('path'=>$this->getDirectory(),'mime_types'=>array('application/zip'))),
            'order' => new mfValidatorSchema(array(
                            "name"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                            "time"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                            "size"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                         //   "extension"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                           ),array("required"=>false)),
            'search' => new mfValidatorSchema(array(
                            "name"=>new mfValidatorString(array("required"=>false)),
                           ),array("required"=>false)),
            'range'=>new mfValidatorSchema(array(
                               "time"  =>new mfValidatorI18nDateRangeCompare(array('required'=>false))
                           ),array("required"=>false)),
            'nbitemsbypage'=>new mfValidatorChoice(array("choices"=>array("5"=>5,"10"=>10,"20"=>20,"50"=>50,"100"=>100,"500"=>500,"*"=>"*"))),         
        ));
    }
    
 
}

