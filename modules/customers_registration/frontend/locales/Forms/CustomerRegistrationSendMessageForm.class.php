<?php

class CustomerRegistrationSendMessageForm extends mfForm {
    
    
    function configure() {
        $this->setValidators(array(
            'firstname'=>new mfValidatorString(),
            'lastname'=>new mfValidatorString(),
           // 'subject'=>new mfValidatorString(),
            'email'=>new mfValidatorEmail(),         
          //  'message'=>new mfValidatorString(array('min_length'=>20,'max_length'=>500)),
            'phone'=>new mfValidatorString(array()),
            'city'=>new mfValidatorString(array()),
            'state'=>new mfValidatorString(array('required'=>false)),
            'country' => new mfValidatorI18nChoiceCountry(),
            'profession'=>new mfValidatorString(array()),
          //  'gender'=>new mfValidatorChoice(array("choices"=>array(''=>__("Choose type"),"Mrs"=>"Mrs","Mr"=>"Mr","Ms"=>"Ms"),"key"=>true)),
            'race'=>new mfValidatorString(array()),
           // 'has_experience'=>new mfValidatorBoolean(array('true'=>'YES','false'=>'NO','empty_value'=>'NO')),
            'has_experience'=>new mfValidatorChoice(array('key'=>true,'choices'=>array(
                'YES'=>__('Yes'),
                'NO'=>__('No'),
            ))),
            'attending'=>new mfValidatorChoice(array('key'=>true,'choices'=>array(
                'student'=>__('Student'),
                'school'=>__('School Faculty'),
                'employee'=>__('Employee'),
                'employer'=>__('Employer'),
                'entrepreneur'=>__('Entrepreneur'),
                'business'=>__('Business owner'),
                'other'=>__('Other'),
            ))),
            'other_attending'=>new mfValidatorString(array('required'=>false)),
            'level'=>new mfValidatorChoice(array('key'=>true,'choices'=>array(
                'highschool'=>__('High School'),
                'college'=>__('College.'),
                'associate'=>__('Associate’s Degree'),
                'bachelor'=>__('Bachelor’s Degree'),
                'master'=>__('Master’s Degree'),
                'doctorate'=>__('Doctorate Program'),
                'postdocs'=>__('PostDocs'),
                'other'=>__('Other'),
            ))),
            'other_level'=>new mfValidatorString(array('required'=>false)),
            'profession'=>new mfValidatorString(array('required'=>false)),
        ));  
        if ($this->getDefault('attending')=='other')
            $this->other_attending->setOption('required',true);
        if ($this->getDefault('level')=='other')
            $this->other_level->setOption('required',true);
    }
    
}
