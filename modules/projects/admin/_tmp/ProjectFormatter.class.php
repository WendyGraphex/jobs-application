<?php


class ProjectFormatter extends mfFormatter {
     

   
    
     function getStartAt()
    {       
            return new DateFormatter($this->getValue()->get('start_at'));       
    }
    
     function getEndAt()
    {       
            return new DateFormatter($this->getValue()->get('end_at'));     
    }
    
      function getDuration()
    {       
          return new DurationFormatter($this->getValue()->get('duration'));
    }
    
       function getNumberOfTasks()
    {       
          return new IntegerFormatter($this->getValue()->get('number_of_tasks'));
    }
    
        function getEstimatedDuration()
    {       
          return new DurationFormatter($this->getValue()->get('estimated_duration'));
    }
}
