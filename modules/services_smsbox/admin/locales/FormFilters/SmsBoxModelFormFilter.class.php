<?php

class SmsBoxModelFormFilter extends mfFormFilterBase
{

    protected $user = null;

    function __construct($user)
    {
        $this->user = $user;      
        parent::__construct();
    }

    function getUser()
    {
        return $this->user;
    }
   

    function configure()
    {
      
        $this->setDefaults(array(
            'order' => array(
                "id" => "asc",
            ),
            'search' => array(
               // "is_active" => "*",
            ),
            'nbitemsbypage' => 100,
        ));
        $this->setFields(array(
            
        ));
        $this->setQuery("SELECT *  FROM " .SmsBoxModel::getTable() .
                        ";");

        // Validators
        $this->setValidators(array(
            'order' => new mfValidatorSchema(array(
                "id" => new mfValidatorChoice(array("choices" => array("asc", "desc"), "required" => false)),
               
            ), array("required" => false)),
            'search' => new mfValidatorSchema(array(
                "id" => new mfValidatorInteger(array("required" => false)),
              
            ), array("required" => false)),
            'nbitemsbypage' => new mfValidatorChoice(array("choices" => array("5" => 5, "10" => 10, "20" => 20, "50" => 50, "100" => 100, "500" => 500, "*" => "*"))),
        ));
    }

}

