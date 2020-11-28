<?php

class CartEventCreateForm extends mfForm {
    
    function configure()
    {
        if (!$this->hasDefaults())
        {
            $day = new Day();
            $this->setDefault('in_at',$day->getNextMonthDay()->getDate());
            $this->setDefault('out_at',$day->getNextMonthDay()->getDate());
        }    
        $this->setValidators(array(
            'title'=>new mfValidatorString(),
            'in_at'=>new mfValidatorI18nDate(array('date_format'=>'a')),
            'out_at'=>new mfValidatorI18nDate(array('date_format'=>'a')),
            'city_id'=>new mfValidatorChoice(array('key'=>true,'choices'=>ProductCity::getAllI18nForSelect())),            
            'surface_min'=>new mfValidatorInteger(array('required'=>false,'min'=>100)),
            'surface_max'=>new mfValidatorInteger(array('required'=>false,'max'=>1000)),
            'budget_min'=>new mfValidatorInteger(array('required'=>false,'min'=>10000)),
            'budget_max'=>new mfValidatorInteger(array('required'=>false,'max'=>1000000)),
            'number_of_people'=>new mfValidatorInteger(array('required'=>true)),
            'number_of_children'=>new mfValidatorInteger(array('required'=>true)),
            'capacity_seat_min'=>new mfValidatorInteger(array('required'=>false,'min'=>10)),
            'capacity_seat_max'=>new mfValidatorInteger(array('required'=>false,'max'=>500)),
            'capacity_standing_min'=>new mfValidatorInteger(array('required'=>false,'min'=>10)),
            'capacity_standing_max'=>new mfValidatorInteger(array('required'=>false,'min'=>500)),
            'is_flexible'=>new mfValidatorBoolean(array('true'=>'YES','false'=>'NO')),
            'type_id'=>new mfValidatorChoice(array('key'=>true,'choices'=>QuotationEventType::getAllI18nForSelect())),
            'location_id'=>new mfValidatorChoice(array('key'=>true,'required'=>false,'choices'=>ProductLocationType::getAllI18nForSelect()->unshift(array(''=>__("Not defined"))))),
        ));
    }
}

