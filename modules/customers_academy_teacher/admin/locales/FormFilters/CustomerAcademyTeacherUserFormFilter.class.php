<?php


class CustomerAcademyTeacherUserFormFilter extends mfFormFilterBase {

    protected $user=null;
    
    function __construct($user)
    {          
       $this->user=$user;
       parent::__construct();      
    }       
    
    function getUser()
    {
        return $this->user;
    }
           
    
    function configure()
    {                         
       $this->addDefaults(array(          
            'order'=>array(
                            "id"=>"asc", 
                         /*   "username"=>"asc",
                            "firstname"=>"asc",
                            "lastname"=>"asc",
                            "email"=>"asc",
                            "phone"=>"asc",
                            "mobile"=>"asc",
                            "email"=>"asc",
                            "address1"=>"asc",
                            "country"=>"asc",
                            "email"=>"asc",
                            "created_at"=>"asc",
                            "updated_at"=>"asc",*/
            ), 
            'equal'=>array(
                "is_active"=>'',
            )   , 
            'nbitemsbypage'=>"20",
       ));          
       $this->setClass('CustomerAcademyTeacherUser');
       
       $this->setFields(array(
          
              'lastName'=>array(
              'class'=>'CustomerAcademyTeacherUser',
              'search'=>array('conditions'=>
                                                 "(".
             CustomerAcademyTeacherUser::getTableField('username')." COLLATE UTF8_GENERAL_CI LIKE '%%{lastname}%%' OR ".
             CustomerAcademyTeacherUser::getTableField('lastname')." COLLATE UTF8_GENERAL_CI LIKE '%%{lastname}%%' OR ".
             CustomerAcademyTeacherUser::getTableField('email')." COLLATE UTF8_GENERAL_CI LIKE '%%{lastname}%%' OR ".
             CustomerAcademyTeacherUser::getTableField('firstname')." COLLATE UTF8_GENERAL_CI LIKE '%%{firstname}%%'".
                                                 ")")
                                ),               
           ));
       $this->setQuery("SELECT {fields} FROM ".CustomerAcademyTeacherUser::getTable().                            
                       ";"); 
       // Validators
       $this->setValidators(array(
        'order' => new mfValidatorSchema(array(
            "id" => new mfValidatorChoice(array("choices" => array("asc", "desc"), "required" => false)),
            "gender" => new mfValidatorChoice(array("choices" => array("asc", "desc"), "required" => false)),
            "firstname" => new mfValidatorChoice(array("choices" => array("asc", "desc"), "required" => false)),
            "username" => new mfValidatorChoice(array("choices" => array("asc", "desc"), "required" => false)),
            "lastname" => new mfValidatorChoice(array("choices" => array("asc", "desc"), "required" => false)),
           // "birthday" => new mfValidatorChoice(array("choices" => array("asc", "desc"), "required" => false)),
            "email" => new mfValidatorChoice(array("choices" => array("asc", "desc"), "required" => false)),
            "phone" => new mfValidatorChoice(array("choices" => array("asc", "desc"), "required" => false)),
            "mobile" => new mfValidatorChoice(array("choices" => array("asc", "desc"), "required" => false)),
            "fax" => new mfValidatorChoice(array("choices" => array("asc", "desc"), "required" => false)),
            "city" => new mfValidatorChoice(array("choices" => array("asc", "desc"), "required" => false)),
           // "adresse1" => new mfValidatorChoice(array("choices" => array("asc", "desc"), "required" => false)),
           // "adresse2" => new mfValidatorChoice(array("choices" => array("asc", "desc"), "required" => false)),
            //"postCode" => new mfValidatorChoice(array("choices" => array("asc", "desc"), "required" => false)),
         //   "password" => new mfValidatorChoice(array("choices" => array("asc", "desc"), "required" => false)),
          //  "statuts" => new mfValidatorChoice(array("choices" => array("asc", "desc"), "required" => false)),
            "country" => new mfValidatorChoice(array("choices" => array("asc", "desc"), "required" => false)),
            "status" => new mfValidatorChoice(array("choices" => array("asc", "desc"), "required" => false)),
            "lastPassword" => new mfValidatorChoice(array("choices" => array("asc", "desc"), "required" => false)),
           // "state" => new mfValidatorChoice(array("choices" => array("asc", "desc"), "required" => false)),
          //  "address1" => new mfValidatorChoice(array("choices" => array("asc", "desc"), "required" => false)),
         //   "country" => new mfValidatorChoice(array("choices" => array("asc", "desc"), "required" => false)),
            "lastlogin" => new mfValidatorChoice(array("choices" => array("asc", "desc"), "required" => false)),
            "created_at" => new mfValidatorChoice(array("choices" => array("asc", "desc"), "required" => false)),
            "updated_at" => new mfValidatorChoice(array("choices" => array("asc", "desc"), "required" => false)),
        ), array("required" => false)),
        'search' => new mfValidatorSchema(array(
            "id" => new mfValidatorInteger(array("required" => false)),
            "firstname" => new mfValidatorString(array("required" => false)),
            "lastname" => new mfValidatorString(array("required" => false)),
            "phone" => new mfValidatorString(array("required" => false)),
            "fax" => new mfValidatorString(array("required" => false)),
            "email" => new mfValidatorString(array("required" => false)),
            "is_active" => new mfValidatorChoice(array("required" => false, 'key' => true, "choices" => array("" => "", "YES" => __("YES"), "NO" => __("NO")))),
        ), array("required" => false)),
        'equal'=>new mfValidatorSchema(array(                        
                "is_active"=> new mfValidatorChoice(array("choices"=>array(""=>"","YES"=>__("YES"),"NO"=>__("NO")),"key"=>true,"required"=>false)),
                "is_validated"=> new mfValidatorChoice(array("choices"=>array(""=>"","YES"=>__("YES"),"NO"=>__("NO")),"key"=>true,"required"=>false)),
                "is_completed"=> new mfValidatorChoice(array("choices"=>array(""=>"","YES"=>__("YES"),"NO"=>__("NO")),"key"=>true,"required"=>false)),
                "status"=> new mfValidatorChoice(array("choices"=>array(""=>"","ACTIVE"=>__("ACTIVE"),"DELETE"=>__("DELETE")),"key"=>true,"required"=>false)),
            ), array("required" => false)),
        'range' => new mfValidatorSchema(array(              
                "created_at"=>new mfValidatorI18nDateRangeCompare(array("required"=>false)),
                "updated_at"=>new mfValidatorI18nDateRangeCompare(array("required"=>false)),
             ),array("required"=>false)),
        'nbitemsbypage' => new mfValidatorChoice(array("choices" => array("5" => 5, "10" => 10, "20" => 20, "50" => 50, "100" => 100, "250" => 250))),
    ));         
    }
    
   
}


