<?php


class SiteClientFormFilter extends mfFormFilterBase
{

 

    function configure()
    {
        //   var_dump($this->conditions);
        $this->setDefaults(array(
            'order'=>array(
                "id"=>"asc",      
                "created_at"=>"asc",
                "updated_at"=>"asc",
            ),
            'equal'=>array(
                //'is_active'=>'YES',
            ),
            'nbitemsbypage'=>20,
        ));
        $this->setClass('SiteClient');
        $this->setFields(array(
            'lang'=>array(                     
                'search'=>array('conditions'=>SiteClient::getTableField('lang')." COLLATE UTF8_GENERAL_CI LIKE '%%{lang}%%' ")
            ),
            'name'=>array(                     
                'search'=>array('conditions'=>SiteClient::getTableField('name')." COLLATE UTF8_GENERAL_CI LIKE '%%{name}%%' ")
            ),
          
        ));
        $this->setQuery("SELECT {fields} FROM " . SiteClient::getTable() . 
                        " WHERE application='frontend'".
                        ";");

        // Validators
        $this->setValidators(array(
            'order' => new mfValidatorSchema(array(
                "id"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                "code"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),             
                "is_active"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),                                         
                "created_at"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                "updated_at"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
            ),array("required"=>false)),
            'search' => new mfValidatorSchema(array(
                "lang" => new mfValidatorString(array("required" => false)),
                "name" => new mfValidatorString(array("required" => false)),   
            ),array("required"=>false)),
            'equal' => new mfValidatorSchema(array(
                "is_active"=>new mfValidatorChoice(array("choices"=>array(""=>"","YES"=>__("YES"),"NO"=>__("NO")),"key"=>true,"required"=>false)),                         
            ),array("required"=>false)),
            'range' => new mfValidatorSchema(array(
                "created_at"=>new mfValidatorI18nDateRangeCompare(array("required"=>false)),
                "updated_at"=>new mfValidatorI18nDateRangeCompare(array("required"=>false)),
             ),array("required"=>false)),
            'nbitemsbypage'=>new mfValidatorChoice(array("choices"=>array("5"=>5,"10"=>10,"20"=>20,"50"=>50,"100"=>100,"500"=>500,"*"=>"*"))),
        ));
    }

}

