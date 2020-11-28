<?php


class SaleEmployeeQuotationFormatter extends mfFormatter {
   
  
     function getCreatedAt()
    {
        return new DateTimeFormatter($this->getValue()->get('created_at'));
    }
    
    function getUpdatedAt()
    {
        return new DateTimeFormatter($this->getValue()->get('updated_at'));
    }
    
     function getPrice()
    {
        return new FloatFormatter($this->getValue()->get('price'));
    }
    
    function getInAt()
    {
        return new DateFormatter($this->getValue()->get('in_at'));
    }
    
     function getOutAt()
    {
        return new DateFormatter($this->getValue()->get('out_at'));
    }
    
    function getNumberOfDays()
    {        
        return new DurationFormatter(intval($this->getValue()->get('number_of_hours')) * 3600);
    }
    
     function getDescription()
    {
        return new mfString($this->getValue()->get('description'));
    }
    
    function getAdvertTitle()
    {
          if ($this->getValue()->hasEmployerAdvert())           
             return __('Ref.')." ".$this->getValue()->getEmployerAdvert()->getI18n()->get('reference')." ".
                    (string)$this->getValue()->getEmployerAdvert()->getI18n()->getFormatter()->getTitle()->ucfirst();
          if ($this->getValue()->hasEmployeeAdvert())     
             return __('Ref.')." ".$this->getValue()->getEmployeeAdvert()->getI18n()->get('reference')." ".
                     (string)$this->getValue()->getEmployeeAdvert()->getI18n()->getFormatter()->getTitle()->ucfirst()." ".                                             
                     (string)$this->getValue()->getProject()->getFormatter()->getName()->ucfirst();      
          return "";
    }
    
    function getAdvertTitleForPdf()
    {
          if ($this->getValue()->hasEmployerAdvert())           
             return (string)$this->getValue()->getEmployerAdvert()->getI18n()->get('reference')." ".
                    (string)$this->getValue()->getEmployerAdvert()->getI18n()->getFormatter()->getTitle()->ucfirst();
          if ($this->getValue()->hasEmployeeAdvert())     
             return (string)$this->getValue()->getEmployeeAdvert()->getI18n()->get('reference')." ".
                     (string)$this->getValue()->getEmployeeAdvert()->getI18n()->getFormatter()->getTitle()->ucfirst()." ".                                             
                     (string)$this->getValue()->getProject()->getFormatter()->getName()->ucfirst();      
          return "";
    }
    
    
     function toArrayForEmail()
    {       
        $values=$this->getValue()->toArray();         
        $values['employer']= $this->getValue()->getEmployerUser()->getFormatter()->toArrayForEmail();
        $values['employee']= $this->getValue()->getEmployeeUser()->getFormatter()->toArrayForEmail();
        $values['dashboard']=array('list'=>array('url'=>url_to("sales_quotation_employee",array('action'=>'ListQuotation'),'frontend',"")));
        return $values;  
    }
    
    
    function toArrayForPdf()
     {
         $values=array();
         foreach (array(
             'advert_title'=>array('AdvertTitleForPdf'=>array()),             
         ) as $field => $options)
         {
            $method="get".ucfirst(key($options)); 
            $parameters=current($options);
            $formatter=$parameters[0];
            if (isset($parameters[1]))
                $values[$field]=$this->$method()->$formatter($parameters[1]);
            elseif (isset($parameters[0]))
               $values[$field]=$this->$method()->$formatter(); 
            else
               $values[$field]=$this->$method();
         }                 
         return $values;
     }
}

