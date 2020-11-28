<?php

class linkedin_oauth_callbackStudentAction extends mfActions {

        function execute(mfWebRequest $request) {    
        $messages = mfMessages::getInstance();                 
        try 
        {                      
            $api = new LinkedinOauth();
            $api->setCallback($api->getSettings()->getEmployeeUri());
            $api->setCode($request->getGetParameter('code'));
            if(!$api->getToken())
                throw new Exception("-- invalid token --");
            $student_user = new CustomerAcademyStudentUser(array('linkedin_user'=>$api->getMe()->getId()));          
            $student_user->add(array(
                "firstname" => $api->getMe()->getFirstName(), 
                "lastname" => $api->getMe()->getLastName(),
                "is_locked" => 'NO',
                    )); 
             $student_user->validate();
             $api->getPicture($api->getMe());
             //var_dump($api);
           //  var_dump($api->getMe());
             $student_user->uploadAvatarFromUrl(new LinkedinPicture($api->getMe()->getPicture()));             
             $this->getUser()->signin($student_user,$request->getIp());
             $this->getEventDispather()->notify(new mfEvent($student_user, 'student_user.connected'));
             $this->redirect(to_link_i18n(mfConfig::get('mf_customers_academy_student_redirect_account')));
        }      
        catch (Exception $e) {     
                 $messages->addError($e);
                 echo "<!-- ".$e->getMessage()." -->";
              //   echo $e->getMessage();
               //             die(__METHOD__);

        }
        $this->forward($this->getModuleName (), 'callbackError');
    }
}




