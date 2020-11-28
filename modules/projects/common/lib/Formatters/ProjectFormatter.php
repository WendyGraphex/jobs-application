<?php


class ProjectFormatter extends mfFormatter {
   
            
     function getCreatedAt()
    {
        return new DateTimeFormatter($this->getValue()->get('created_at'));
    }
    
    function getUpdatedAt()
    {
        return new DateTimeFormatter($this->getValue()->get('updated_at'));
    }
    
    function getEndAt()
    {
        return new DateFormatter($this->getValue()->get('end_at'));
    }
    
    function getStartAt()
    {
        return new DateFormatter($this->getValue()->get('start_at'));
    }
    
   function getNumberOfTasks()
    {
        return new IntegerFormatter($this->getValue()->get('number_of_tasks'));
    }
    
    function toArrayForEmail()
    {
        $values=array(
            'name'=>$this->getValue()->get('name'),
            'start_at'=>$this->getStartAt()->getFormats(),
            'end_at'=>$this->getEndAt()->getFormats(),
        );
        return $values;
    }
}

