<?php

class instagram_oauth_callbackTeacherAction extends mfActions {

    function execute(mfWebRequest $request) {    
        $messages = mfMessages::getInstance();                 
        try 
        {                      
            
            $oauth= new InstagramClient();
            $oauth->setApiCallback($oauth->getSettings()->getTeacherUri());                                         
            $oauth->setAccessToken($oauth->getOAuthToken($request->getGetParameter('code'),false));           
            $user=$oauth->getUser();
            if ($user->error)
                throw new mfException(__("Instagram Oauth failed."));           
            $teacher = new CustomerAcademyTeacherUser(array('instagram_user'=>$user->id)); 
            $teacher->add(array(  
                'username'=>$user->username,
                'is_locked'=>'NO'
            ))->validate();
                         
        //    $teacher->uploadAvatarFromUrl(new InstagramPicture($oauth->getUserPicture())); 
                                
            $this->getUser()->signin($teacher,$request->getIp());
            $this->getEventDispather()->notify(new mfEvent($teacher, 'customers_academy_teacher.user.connected')); 
            $this->redirect(to_link_i18n(mfConfig::get('mf_customers_academy_teacher_redirect_account')));      
        }
        catch (Exception $e) {     
                 $messages->addError($e);
                echo "<!-- ".$e->getMessage()." -->";
        }
        $this->forward($this->getModuleName (), 'callbackError');
}
}




