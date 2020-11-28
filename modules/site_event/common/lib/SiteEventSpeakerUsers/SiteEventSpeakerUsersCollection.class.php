<?php

class SiteEventSpeakerUsersCollection extends mfObjectCollection3 {
    
     
   function getSpeakerUsers()
    {
        if ($this->speakers===null)
        {
            $this->speakers=new SiteEventSpeakerUserCollection();
            foreach ($this as $item)
                 $this->speakers[$item->getSpeakerUser()->get('id')] = $item->getSpeakerUser();
        }
        return $this->speakers;
        
    }
}

