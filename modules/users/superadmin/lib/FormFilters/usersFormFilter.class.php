<?php

class UsersFormFilter extends mfFormFilterBase {
  
  
    
    function configure()
    {
      $this->setDefaults(array(
            'order'=>array(
                            "id"=>"asc",
            ),
            'search'=>array(
                            "is_active"=>"*",
            ),
            'nbitemsbypage'=>100,
       ));
      $this->setClass('User');
        $this->setFields(array( 
                        'username'=>array(
                                            'class'=>'User',
                                            'search'=>array('conditions'=>                                                
                                                 User::getTableField('username')." COLLATE UTF8_GENERAL_CI LIKE '%%{username}%%'"
                                                 )
                        ), 
                        'firstname'=>array(
                                       'class'=>'User',
                                       'search'=>array('conditions'=>                                                
                                            User::getTableField('firstname')." COLLATE UTF8_GENERAL_CI LIKE '%%{firstname}%%'"
                                            )
                         ), 
                         'lastname'=>array(
                                       'class'=>'User',
                                       'search'=>array('conditions'=>                                                
                                            User::getTableField('lastname')." COLLATE UTF8_GENERAL_CI LIKE '%%{lastname}%%'"
                                            )
                         ), 
      ));
       $this->setQuery("SELECT {fields},".                           
                            "(SELECT GROUP_CONCAT(".Group::getTableField('name')." ORDER BY ".Group::getTableField('name')." ASC)".
                                " FROM ".UserGroup::getTable().
                            " LEFT JOIN ".UserGroup::getOuterForJoin('group_id').                           
                            " WHERE ".UserGroup::getTableField('user_id')."=".User::getTableField('id').                                             
                            ") as groups ".                                
                       " FROM ".User::getTable().
                       " WHERE application='admin';");
       // Validators
       $this->setValidators(array(
            'order' => new mfValidatorSchema(array(
                            "id"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                            "username"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                            "firstname"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                            "lastname"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                            "email"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                            "created_at"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                            "lastlogin"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                            "last_password_gen"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                           ),array("required"=>false)),
            'search' => new mfValidatorSchema(array(
                            "id"=>new mfValidatorInteger(array("required"=>false)),
                            "username"=>new mfValidatorString(array("required"=>false)),
                            "firstname"=>new mfValidatorString(array("required"=>false)),
                            "lastname"=>new mfValidatorString(array("required"=>false)),
                            "email"=>new mfValidatorString(array("required"=>false)),
                        //    "application"=>new mfValidatorChoice(array("choices"=>array(""=>"","admin"=>"admin","frontend"=>"frontend"),"required"=>false)),
                            "is_active"=>new mfValidatorChoice(array("choices"=>array(""=>"","YES"=>"YES","NO"=>"NO"),"required"=>false)),
                           ),array("required"=>false)),
           'nbitemsbypage'=>new mfValidatorChoice(array("choices"=>array("5"=>5,"10"=>10,"20"=>20,"50"=>50,"100"=>100,"500"=>500,"*"=>"*"))),         
        ));
    }
   
}

