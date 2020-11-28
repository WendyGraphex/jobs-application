<?php


class SiteEventSpeakerUserDialogFormFilter extends mfFormFilterBase {

   
    function configure()
    {                         
       $this->addDefaults(array(          
            'order'=>array(
                
              /*  "id"=>"asc",
                "name"=>"asc",
                "title"=>"asc",
                "created_at"=>"asc",
                "updated_at"=>"asc",*/
            ), 
            'equal'=>array(
                // "is_active"=>'YES',
            )   ,     
          //  'lang'=>$this->getLanguage(),     
            'nbitemsbypage'=>"10",
       ));          
       $this->setClass('SiteEventSpeakerUser');
       
       $this->setFields(array(                      
           'name'=>array(
              'class'=>'SiteEventSpeakerUser',
              'search'=>array('conditions'=>
                                                 "(".                
                  SiteEventSpeakerUser::getTableField('firstname')." COLLATE UTF8_GENERAL_CI LIKE '%%{name}%%' OR ".
                  SiteEventSpeakerUser::getTableField('lastname')." COLLATE UTF8_GENERAL_CI LIKE '%%{name}%%' ".
                                                 ")")
                                ),  
           ));
       $this->setQuery("SELECT {fields} FROM ".SiteEventSpeakerUser::getTable().                     
                       ";"); 

       // Validators 
       $this->setValidators(array( 
            'selection'=>new mfValidatorSchemaForEach(new mfValidatorInteger(),count($this->getDefault('selection')),array('required'=>false)),      
            'order' => new mfValidatorSchema(array(                                                                  
                   //  "rb"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),   
                     "firstname"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),                  
                     ),array("required"=>false)),
            'search' => new mfValidatorSchema(array(  
                    
                "name"=>new mfValidatorString(array("required"=>false)),                            
                            ),array("required"=>false)),                             
                'range' => new mfValidatorSchema(array(   
                                         
                                ),array("required"=>false)),                                                         
                'equal' => new mfValidatorSchema(array(
                  
                    ),array("required"=>false)),                                                    
            'nbitemsbypage'=>new mfValidatorChoice(array("required"=>false,"choices"=>array("5"=>"5","10"=>"10","20"=>"20","50"=>"50","100"=>"100","*"=>"*"),"key"=>true)),                    
        ));              
    }
        
    function getSelection()
    {
        if ($this->isReady())
            return $this['selection']->getArray();
        return new mfArray($this->getDefault('selection'));
    }
    
}

