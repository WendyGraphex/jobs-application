<?php


class EmployerUserFormFilter extends mfFormFilterBase {

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
                            "id"=>"desc",  
                        /*    "name"=>"asc",
                            "firstname"=>"asc",
                            "lastname"=>"asc",
                            "email"=>"asc",
                            "phone"=>"asc",
                            "created_at"=>"asc",
                            "updated_at"=>"asc",*/
            ), 
            'equal'=>array(
                "is_active"=>'YES',
            )   , 
            'nbitemsbypage'=>"20",
       ));          
       $this->setClass('EmployerUser');
       
       $this->setFields(array(
          
              'firstname'=>array(
              'class'=>'EmployerUser',
              'search'=>array('conditions'=>
                                                 "(".
             EmployerUser::getTableField('username')." COLLATE UTF8_GENERAL_CI LIKE '%%{lastname}%%' OR ".
             EmployerUser::getTableField('lastname')." COLLATE UTF8_GENERAL_CI LIKE '%%{lastname}%%' OR ".
             EmployerUser::getTableField('firstname')." COLLATE UTF8_GENERAL_CI LIKE '%%{firstname}%%' OR ".
             EmployerUser::getTableField('email')." COLLATE UTF8_GENERAL_CI LIKE '%%{firstname}%%'".
                                                 ")")
                                ), 
           
            'name'=>array(
              'class'=>'EmployerCompany',
              'search'=>array('conditions'=>
                                                 "(".
             EmployerCompany::getTableField('name')." COLLATE UTF8_GENERAL_CI LIKE '%%{name}%%' OR ".
             EmployerCompany::getTableField('commercial')." COLLATE UTF8_GENERAL_CI LIKE '%%{name}%%'".
                                                 ")")
                                ), 
           ));
       $this->setQuery("SELECT {fields} FROM ".EmployerUser::getTable().     
                        " LEFT JOIN ".EmployerUser::getOuterForJoin('company_id').
                     //  " WHERE is_admin='NO' ".
                       ";"); 
          // Validators
          $this->setValidators(array(
            'order' => new mfValidatorSchema(array(
                "id" => new mfValidatorChoice(array("choices" => array("asc", "desc"), "required" => false)),
                "name" => new mfValidatorChoice(array("choices" => array("asc", "desc"), "required" => false)),
                "gender" => new mfValidatorChoice(array("choices" => array("asc", "desc"), "required" => false)),
                "firstname" => new mfValidatorChoice(array("choices" => array("asc", "desc"), "required" => false)),
                   "username" => new mfValidatorChoice(array("choices" => array("asc", "desc"), "required" => false)),
                "lastname" => new mfValidatorChoice(array("choices" => array("asc", "desc"), "required" => false)),
                "birthday" => new mfValidatorChoice(array("choices" => array("asc", "desc"), "required" => false)),
                "email" => new mfValidatorChoice(array("choices" => array("asc", "desc"), "required" => false)),
                "phone" => new mfValidatorChoice(array("choices" => array("asc", "desc"), "required" => false)),
                "mobile" => new mfValidatorChoice(array("choices" => array("asc", "desc"), "required" => false)),
                "fax" => new mfValidatorChoice(array("choices" => array("asc", "desc"), "required" => false)),
                "web" => new mfValidatorChoice(array("choices" => array("asc", "desc"), "required" => false)),
                "address1" => new mfValidatorChoice(array("choices" => array("asc", "desc"), "required" => false)),
                "address2" => new mfValidatorChoice(array("choices" => array("asc", "desc"), "required" => false)),
                "postCode" => new mfValidatorChoice(array("choices" => array("asc", "desc"), "required" => false)),
                "city" => new mfValidatorChoice(array("choices" => array("asc", "desc"), "required" => false)),
                "country" => new mfValidatorChoice(array("choices" => array("asc", "desc"), "required" => false)),
                "statuts" => new mfValidatorChoice(array("choices" => array("asc", "desc"), "required" => false)),
                "password" => new mfValidatorChoice(array("choices" => array("asc", "desc"), "required" => false)),
                "created_at" => new mfValidatorChoice(array("choices" => array("asc", "desc"), "required" => false)),
                "updated_at" => new mfValidatorChoice(array("choices" => array("asc", "desc"), "required" => false)),
               // "state" => new mfValidatorChoice(array("choices" => array("asc", "desc"), "required" => false)),
                //"lastlogin" => new mfValidatorChoice(array("choices" => array("asc", "desc"), "required" => false)),
            ), array("required" => false)),
            'search' => new mfValidatorSchema(array(
                "name" => new mfValidatorInteger(array("required" => false)),
                "firstname" => new mfValidatorString(array("required" => false)),
               // "lastname" => new mfValidatorString(array("required" => false)),
               // "lastname" => new mfValidatorString(array("required" => false)),
                "email" => new mfValidatorString(array("required" => false)),
                "phone" => new mfValidatorString(array("required" => false)),
                "fax" => new mfValidatorString(array("required" => false)),
                "is_active" => new mfValidatorChoice(array("required" => false, 'key' => true, "choices" => array("" => "", "YES" => __("YES"), "NO" => __("NO")))),
            ), array("required" => false)),
              'range' => new mfValidatorSchema(array(
                "created_at"=>new mfValidatorI18nDateRangeCompare(array("required"=>false)),
                "updated_at"=>new mfValidatorI18nDateRangeCompare(array("required"=>false)),
             ),array("required"=>false)),
            'equal'=>new mfValidatorSchema(array(                        
                "is_online"=> new mfValidatorChoice(array("choices"=>array(""=>"","YES"=>__("YES"),"NO"=>__("NO")),"key"=>true,"required"=>false)),
                "is_active"=> new mfValidatorChoice(array("choices"=>array(""=>"","YES"=>"YES","NO"=>"NO"),"key"=>true,"required"=>false)),
                "is_validated"=> new mfValidatorChoice(array("choices"=>array(""=>"","YES"=>"YES","NO"=>"NO"),"key"=>true,"required"=>false)),
                "is_completed"=> new mfValidatorChoice(array("choices"=>array(""=>"","YES"=>"YES","NO"=>"NO"),"key"=>true,"required"=>false)),
            ), array("required" => false)),
            'nbitemsbypage' => new mfValidatorChoice(array("choices" => array("5" => 5, "10" => 10, "20" => 20, "50" => 50, "100" => 100, "250" => 250))),
        ));               
    }
    
   
}


