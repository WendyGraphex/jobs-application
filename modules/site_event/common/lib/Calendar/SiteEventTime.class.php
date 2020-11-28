<?php


class SiteEventTime extends Time {
    
    protected $events=null;
    
    function __construct($hour, $minute = 0, $second = null) {
        $this->events=new mfArray();
        parent::__construct($hour, $minute, $second);       
    }
    
   /* function addEvent($meeting)
    {
        $this->events[$meeting->get('id')]=$meeting;
        return $this;
    }*/
    
    function getEvents()
    {
        return $this->events;
    }
    
  /*  function count()
    {
        return count($this->events);
    }*/
    
  /*  function hasEvent($id)
    {
      return isset($this->events[$id]);     
    }
    
    function hasEvents()
    {
        return !empty($this->events);
    }
    
    function getNumberOfMeetings()
    {        
        return count($this->events);
    }*/
    
   /* function getNumberOfConfirmedMeetings()
    {        
        $confirmed_events=0;
        foreach ($this->events as $meeting)
        {
            if ($meeting->get('is_confirmed')=='YES')
              $confirmed_events++;
        }    
        return $confirmed_events;
    }
    
    function getMeetingById($id,$default=null)
    {
        return isset($this->events[$id])?$this->events[$id]:$default;
    }*/
}

