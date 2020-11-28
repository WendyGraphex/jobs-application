<?php


class ProjectTaskFormatter extends mfFormatter {
   
            
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
    
     function getBeforeAt()
    {
        return new DateFormatter($this->getValue()->get('before_at'));
    }
    
     function getRequestedAt()
    {
        return new DateFormatter($this->getValue()->get('requested_at'));
    }
    
     function getDuration()
    {       
          return new DurationFormatter($this->getValue()->get('total_duration'));
    }
    
       function getPriority()
    {       
          return new IntegerFormatter($this->getValue()->get('priority'));
    }
}

