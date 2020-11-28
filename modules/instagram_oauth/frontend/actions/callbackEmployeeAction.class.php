<?php

/*
 * http://www.project55.net/instagram/oauth/callback/employee?code=AQAb2v1W5BJMdiqq2ABmpWrR9ApOUAjvuHuc-BvElw8T9EEIhs9U0DVMMZvHStOSLbD1foU2W_1VuhHEzt701C_3YYZZxE2Ua05_man7cHkKkdYPUn6OjW_VehxeXCjW7An-_KpeqYT3a1aG4l8EhVxUxE6j3K2aBlm1duvMUI2so2dM5nHcJYFFqx7hR82g5UErHKXON0DB2wVlhSWTB6Qk69C-iYqOvjLUPfVSctGHCA#_
 *  $url="https://instagram.frak1-2.fna.fbcdn.net/v/t51.2885-19/s320x320/89641610_674909329922277_2445331194661830656_n.jpg?_nc_ht=instagram.frak1-2.fna.fbcdn.net&_nc_ohc=rokogABDUxgAX9hljtv&oh=2c8fac9c6ca8027451ad05fd7a74a71e&oe=5F54B175";
 */
class instagram_oauth_callbackEmployeeAction extends mfActions {

    function execute(mfWebRequest $request) {    
        $messages = mfMessages::getInstance();                 
        try 
        {                
            $oauth= new InstagramClient();
            $oauth->setApiCallback($oauth->getSettings()->getEmployeeUri());                                         
            $oauth->setAccessToken($oauth->getOAuthToken($request->getGetParameter('code'),false));         
            $user=$oauth->getUser();
            if ($user->error)
                throw new mfException(__("Instagram Oauth failed."));            
            $employee = new Employee(array('instagram_user'=>$user->id)); 
            $employee->add(array(  
                'username'=>$user->username,
                'is_locked'=>'NO'
            ))->validate();
                         
          //  $employee->uploadAvatarFromUrl(new InstagramPicture($oauth->getUserPicture())); 
            
            $this->getUser()->signin($employee,$request->getIp());
            $this->getEventDispather()->notify(new mfEvent($employee, 'employee.connected'));               
            $this->redirect(to_link_i18n(mfConfig::get('mf_employee_redirect_account')));                         
        }
        catch (Exception $e) {     
                 $messages->addError($e);
                 echo "<!-- ".$e->getMessage()." -->";
        }
        $this->forward($this->getModuleName (), 'callbackError');
}
}




