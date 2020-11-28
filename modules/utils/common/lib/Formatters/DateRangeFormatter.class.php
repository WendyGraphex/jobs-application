<?php

class DateRangeFormatter extends mfFormatter {
    
    function __construct(Day $in,Day $out,$options=array()) {        
        $this->out=$out;           
        $this->in=$in;        
        $this->options=$options;
        $this->process();
    }
    
    function getOption($name,$default=null)
    {
        return isset($this->options[$name])?$this->options[$name]:$default;
    }
    
    function getOptions()
    {
        return $this->options;
    }
    
    function process()
    {      
        $this->month=$this->in->getMonthNameI18n()->ucfirst();
        $this->year=$this->in->getYear();   
        $number_of_days=$this->in->diffInDay($this->out);      
        if ($number_of_days  <= $this->getOption('number_of_days',4))
        {           
            $days=new mfArray();
            for($i=0;$i< $number_of_days;$i++)
                $days[]=$this->in->getDayAdd($i)->getRank();             
            
            $this->output=__($this->getOption('format',"{month} {days}, {year}"),array('month'=>$this->month,'days'=>$days->implode($this->getOption('day_separator','-')),"year"=>$this->year),'dates','utils');
        }       
        else
        {
           $this->output=__($this->getOption('format',"{month} {days}, {year}"),array('month'=>$this->month,'days'=>$this->in->getRank().$this->getOption('day_separator','-').$this->out->getRank(),"year"=>$this->year),'dates','utils'); 
        }    
        return $this;
    }
    
    function toString()
    {
        return  $this->output;
    }
    
     
    function __toString() {
       return $this->toString(); 
    }
    
   
}
