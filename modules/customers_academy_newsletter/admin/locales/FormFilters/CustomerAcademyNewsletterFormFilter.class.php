<?php

class CustomerAcademyNewsletterFormFilter extends mfFormFilterBase {
 
    function configure()
    {
      $this->setDefaults(array(
            'order'=>array(
                            "id"=>"asc",
                            "updated_at"=>"asc",
                            "created_at"=>"asc",
            ),
           /* 'search'=>array(
                            "is_active"=>"*",
            ), */
            'nbitemsbypage'=>10,
       ));
      
       $this->setQuery("SELECT * FROM ".CustomerAcademyNewsletter::getTable().";");
       // Validators
       $this->setValidators(array(
            'order' => new mfValidatorSchema(array(
                            "id"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                            "email"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                            "username"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                            "firstname"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                            "lastname"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                            "created_at"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                            "updated_at"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                           ),array("required"=>false)),
           'range'=>new mfValidatorSchema(array(
                            "updated_at"  =>new mfValidatorI18nDateRangeCompare(array('required'=>false)),
                            "created_at"  =>new mfValidatorI18nDateRangeCompare(array('required'=>false))
                           ),array("required"=>false)),
           'search' => new mfValidatorSchema(array(
                            "id"=>new mfValidatorInteger(array("required"=>false)),
                            "username"=>new mfValidatorString(array("required"=>false)),
                            "firstname"=>new mfValidatorString(array("required"=>false)),
                            "lastname"=>new mfValidatorString(array("required"=>false)),
                            "email"=>new mfValidatorString(array("required"=>false)),
                            "phone"=>new mfValidatorString(array("required"=>false)),
                            "adress1"=>new mfValidatorString(array("required"=>false)),
                            "adress2"=>new mfValidatorString(array("required"=>false)),
                            "city"=>new mfValidatorString(array("required"=>false)),
                          //  "application"=>new mfValidatorChoice(array("choices"=>array(""=>"","admin"=>"admin","frontend"=>"frontend"),"required"=>false)),
                          //  "is_active"=>new mfValidatorChoice(array("choices"=>array(""=>"","YES"=>"YES","NO"=>"NO"),"required"=>false)),
                           ),array("required"=>false)), 
           'nbitemsbypage'=>new mfValidatorChoice(array("choices"=>array("5"=>5,"10"=>10,"20"=>20,"50"=>50,"100"=>100,"500"=>500,"*"=>"*"))),         
        ));
    }
   
}

