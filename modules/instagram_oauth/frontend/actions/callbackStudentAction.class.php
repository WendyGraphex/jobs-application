<?php

class instagram_oauth_callbackStudentAction extends mfActions {

    function execute(mfWebRequest $request) {    
        $messages = mfMessages::getInstance();                 
        try 
        {                      
        
            $oauth= new InstagramClient();
            $oauth->setApiCallback($oauth->getSettings()->getStudentUri());                                         
            $oauth->setAccessToken($oauth->getOAuthToken($request->getGetParameter('code'),false));    
            $user=$oauth->getUser();
            if ($user->error)
                throw new mfException(__("Instagram Oauth failed."));            
            $student = new CustomerAcademyTeacherUser(array('instagram_user'=>$user->id)); 
            $student->add(array(  
                'username'=>$user->username,
                'is_locked'=>'NO'
            ))->validate();
                         
          //  $student->uploadAvatarFromUrl(new InstagramPicture($oauth->getUserPicture())); 
                                
            $this->getUser()->signin($student,$request->getIp());
            $this->getEventDispather()->notify(new mfEvent($student, 'customers_academy_student.user.connected')); 
            $this->redirect(to_link_i18n(mfConfig::get('mf_customers_academy_student_redirect_account')));      
        }
        catch (Exception $e) {     
                 $messages->addError($e);
                echo "<!-- ".$e->getMessage()." -->";
        }
        $this->forward($this->getModuleName (), 'callbackError');
}
}




