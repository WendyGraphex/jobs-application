<?php

class mfEnumerationChoice  {
    
    protected $name="",$value=null;
    
    function __construct($name,$value) {
        $this->name=$name;
        $this->value=$value;
    }    
    
    function getName()
    {
        return $this->name;
    }
    
    function getValue()
    {
        return $this->value;
    }
}

class mfEnumerationCollection extends mfArray {
    
    protected $values=null,$names=null,$by_keys=null,$by_values=null;
    
    function getValues()
    {
        if ($this->values===null)
        {    
            $this->values=new mfArray();
            foreach ($this as $item)
                $this->values[]=strtolower($item->getValue());
        }
        return $this->values;
    }
    
    function getNames()
    {
        if ($this->names===null)
        {    
            $this->names=new mfArray();
            foreach ($this as $item)
                $this->names[]=strtolower($item->getName());
        }
        return $this->names;
    }
    
    function byKeys()
    {
         if ($this->by_keys===null)
        {    
            $this->by_keys=new mfArray();
            foreach ($this as $item)
                $this->by_keys[strtolower($item->getName())]=$item->getValue();
        }
        return $this->by_keys;
    }
    
    function byValues()
    {
        if ($this->by_values===null)
        {    
            $this->by_values=new mfArray();
            foreach ($this as $item)
                $this->by_values[$item->getValue()]=$item->getValue();
        }
        return $this->by_values;
    }
}

class mfEnumeration extends mfFormatter {
    
     protected static  $choices =null;         
     
    function getI18n($default="")
    {     
        if ($this->getConstants()->byKeys()->in($this->getValue()))
            return __($this->getValue());
        return $default;
    }
    
    function __toString() {
        return (string)$this->getI18n();        
    }
    
    static function getChoices()
    {              
        if (self::$choices===null)
        {    
            self::$choices=new mfEnumerationCollection();            
            $class = new ReflectionClass(get_called_class());                        
            foreach ($class->getConstants() as $name=>$value)
                self::$choices[]=new mfEnumerationChoice($name,$value);
        }
        return self::$choices->byValues();
    }
    
    function getConstants()
    {
        if ($this->constants===null)
        {    
            $this->constants=new mfEnumerationCollection();
            $class = new ReflectionClass($this);
            foreach ($class->getConstants() as $name=>$value)
                $this->constants[]=new mfEnumerationChoice($name,$value);
        }
        return $this->constants;
    }
       
    public  function __call($method,$args) 
    {                       
       if ($method=='in')                        
            return in_array($this->getValue(),(array)$args[0]);        
        if (preg_match('~^(set|get|has|isNot|is)([A-Z])(.*)$~', $method, $matches)) 
        {        
            {                        
                $_method=$matches[2]=='isNot'?str_replace("Not","",$matches[2]):$matches[2];
                $property = strtolower($_method . $matches[3]);                         
                 if (!$this->getConstants()->getNames()->in($property))          
                   throw new mfException('class '.get_class($this).' => Method ' . $method . ' not exists.');                            
            }                
            switch($matches[1]) {                        
                case 'is':                         
                    return $this->getConstants()->byKeys()->getItemByKey($property) == $this->getValue();
                 case 'isNot':                                 
                    return $this->getConstants()->byKeys()->getItemByKey($property) != $this->getValue();
                default:
                    throw new mfException('class '.get_class($this).' => Method ' . $method . ' not exists.');
            }
        }             
        throw new mfException('class '.get_class($this).' => Method ' . $method . ' not exists.'); 
    }   
}

class mfEnumerationObject extends mfEnumeration 
{
    
    function __construct($item,$name) {
        $this->item=$item;
        $this->name=$name;
        parent::__construct($item->get($name));
    }
    
    function getName()
    {
        return $this->name;
    }
    
    function getItem()
    {
        return $this->item;
    }
    
    function set($value)
    {
        parent::set($value);
        $this->getItem()->set($this->getName(),$this->getValue());
        return $this;
    }
    
    function save()
    {
        $this->getItem()->save();
        return $this;
    }
    
    public  function __call($method,$args) 
    {                       
       if ($this->getConstants()->getNames()->in($method)) 
        {                  
           return $this->set($this->getConstants()->byKeys()->getItemByKey(strtolower($method)))->save();                    
        }        
       return parent::__call($method, $args);
    }  
}