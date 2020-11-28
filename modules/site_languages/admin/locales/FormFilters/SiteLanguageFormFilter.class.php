<?php


class SiteLanguageFormFilter extends mfFormFilterBase
{

 

    function configure()
    {
        //   var_dump($this->conditions);
        $this->setDefaults(array(
            'order'=>array(
                "id"=>"asc",                
            ),
            'equal'=>array(
                //'is_active'=>'YES',
            ),
            'nbitemsbypage'=>20,
        ));
        $this->setClass('Language');
        $this->setFields(array(
          
        ));
        $this->setQuery("SELECT {fields} FROM " . Language::getTable() . 
                        " WHERE application='frontend'".
                        ";");

        // Validators
        $this->setValidators(array(
            'order' => new mfValidatorSchema(array(
                "id"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                "code"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),             
                "is_active"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),                                         
                "created_at"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
            ),array("required"=>false)),
            'search' => new mfValidatorSchema(array(
                
            ),array("required"=>false)),
            'equal' => new mfValidatorSchema(array(
                "is_active"=>new mfValidatorChoice(array("choices"=>array(""=>"","YES"=>__("YES"),"NO"=>__("NO")),"key"=>true,"required"=>false)),                         
            ),array("required"=>false)),
            'nbitemsbypage'=>new mfValidatorChoice(array("choices"=>array("5"=>5,"10"=>10,"20"=>20,"50"=>50,"100"=>100,"500"=>500,"*"=>"*"))),
        ));
    }

}

