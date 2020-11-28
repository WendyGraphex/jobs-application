<?php


class SendQuoteScheduleEmployeeForm extends mfForm {
    
    function configure() {
        $this->setValidators(array(
             'in_at'=>new mfValidatorI18nDate(array('date_format'=>'a')),
              'out_at'=>new mfValidatorI18nDate(array('date_format'=>'a'))
        ));
         $this->validatorSchema->setPostValidator(new mfValidatorSchemaCompare('in_at', mfValidatorSchemaCompare::LESS_THAN_EQUAL, 'out_at', array('throw_global_error' => true)));
    }
      
    function getInAt()
    {
        return $this['in_at']->getValue();
    }

    function getOutAt()
    {
        return $this['out_at']->getValue();
    }    

   /* function getValues()
    {
        $values=parent::getValues();
        
      //  $values[]=
        return $values;
    }*/
}
   

