<?php

class mfIntegerFormatter extends mfInteger {
   
     protected $options=array();
    
    function __construct($value=null,$options=array()) {
       $this->options=$options;     
       parent::__construct($value);
    }
    
    function getOption($name,$defaults=null)
    {
        return isset($this->options[$name])?$this->options[$name]:$defaults;
    }
    
    function getOptions()
    {
        return $this->options;
    }
    
    function getText($format="#")
    {
        return format_number($this->getValue(),$this->getOption('format',$format));
    }       
    
    function getFilesize()
    {
        return  format_size($this->getValue());
    }       
    
     function getChoices($format='[0]no result|[1]one result|(1,Inf]%s results')
    {
        return format_number_choice($this->getOption('choices',$format),$this->getValue(),$this->getValue());
    }
    
    
    function getAround($options=array("format"=>"#.0","min"=>100,'max'=>11,"suffix"=>" KMBT","sign"=>"+"))
    {       
        if ($this->around===null)
        {    
         $range = range(0,$this->getOption('around_max',$options['max']));
         $suffix= $options['suffix'];
         $min = $this->getOption('around_max',$options['min']);
         if ($this->getValue() < $min)
             return "< ".$min;
         foreach ($range as $idx=>$power)
         {          
             $value=pow(10,$power);
             if (!isset($range[$idx+1]))
             {    
                 $this->around=format_number($this->getValue() / $value,$this->getOption('around_format',$options['format'])) ." ". $suffix[$idx / 2] . $this->getOption('around_sign',$options['sign']);          
                 break;
            }
            $value_plus_one=pow(10,$range[$idx+1]);
            if ($this->getValue() >= $value && $this->getValue() < $value_plus_one)   
            {    
                $this->around=format_number($this->getValue() / $value,$this->getOption('around_format',$options['format']))." ". $suffix[$idx / 2] . $this->getOption('around_sign',$options['sign']);                                   
                break;
            }
         }   
        }
        return $this->around;
    }
    
    function getRanking()
    {
        static $range=array('st','nd','rd');
        if ($this->ranking===null)
        {            
           $this->ranking=$this->getValue().(isset($range[$this->value % 10 -1])?$range[$this->value % 10 -1]:__("th"));        
        }
        return $this->ranking;
    }
}
