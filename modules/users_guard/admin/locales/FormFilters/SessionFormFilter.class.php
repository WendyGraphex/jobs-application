<?php


class SessionFormFilter extends mfFormFilterBase{
    
    function configure()
    {
      $this->setDefaults(array(
            'order'=>array(
                            "id"=>"asc",
                "username"=>"asc",
                "ip"=>"asc",
                "start_time"=>"asc",
                "last_time"=>"asc",
            ),
            'search'=>array(
                         
            ),
            'nbitemsbypage'=>100,
       ));
      $this->setClass('Session');
      $this->setFields(array("username"=>"User"));
       // Base Query
       $this->setQuery("SELECT {fields} FROM ".Session::getTable().
                       " INNER JOIN ".Session::getOuterForJoin('user_id').
                      // " INNER JOIN ". UserGroup::getInnerForJoin('user_id').
                      // " INNER JOIN ". UserGroup::getOuterForJoin('group_id').
                        " WHERE ".User::getTableField('application')."='admin'".
                            " AND ".Session::getTableField('session')."!=''".
                       ";");
       // Validators
       $this->setValidators(array(
            'order' => new mfValidatorSchema(array(
                            "id"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                            "username"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                            "ip"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                            "start_time"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                            "last_time"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                           ),array("required"=>false)),
            'search' => new mfValidatorSchema(array(
                        //    "id"=>new mfValidatorInteger(array("required"=>false)),
                              "username"=>new mfValidatorString(array("required"=>false)),  
                              "ip"=>new mfValidatorString(array("required"=>false)),
                              "start_time"=>new mfValidatorI18nDate(array('date_format'=>"a","required"=>false)),
                              "last_time"=>new mfValidatorI18nDate(array('date_format'=>"a","required"=>false)),
                           ),array("required"=>false)),
                           'range' => new mfValidatorSchema(array(              
            "start_time"=>new mfValidatorI18nDateRangeCompare(array("required"=>false)),
            "last_time"=>new mfValidatorI18nDateRangeCompare(array("required"=>false)),
         ),array("required"=>false)),
           'nbitemsbypage'=>new mfValidatorChoice(array("required"=>false,"choices"=>array("5"=>5,"10"=>10,"20"=>20,"50"=>50,"100"=>100,"250"=>250,"500"=>500,"*"=>"*"))),         
        ));
    }
    
}
