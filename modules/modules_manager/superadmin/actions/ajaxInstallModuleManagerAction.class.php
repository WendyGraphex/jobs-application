<?php

class modules_manager_ajaxInstallModuleManagerAction extends mfAction
{
    const SITE_NAMESPACE = 'system/site';

    function execute(mfWebRequest $request)
    {

        $messages = mfMessages::getInstance();
        try {
            $module = new mfModule('modules_manager');
            if (!$module->isUptoDate())
                throw new mfException(__("module manager is not installed."));
            $moduleManager = new ModuleManager($request->getPostParameter('id'));
            if ($moduleManager->isNotLoaded())
                throw new mfException(__("module is not defined."));
            if ($moduleManager->get('is_available') != 'YES')
                throw new mfException(__("installation is not authorized."));            
            if ($moduleManager->getModule()->isUpToDate())
                throw new mfException(__("the module [{module}] is up to date.", array("module" => $moduleManager->get('name'))));
            $response = array(
                "action" => "InstallModuleManager",
                "id" => $moduleManager->get('id')
            );
            try {
                $moduleManager->getModule()->getInstaller()->upgrade();
                $moduleManager->set('status', 'installed');
                $moduleManager->save();
                $this->getContext()->getInstance()->getEventManager()->notify(new mfEvent($moduleManager->getModule(), 'module.manager.upgraded'));
                $response['info'] = __('module [{module}] is installed.', array("module" => $moduleManager->get('name')));
            } catch (mfException $e) {
                $moduleManager->getModule()->getInstaller()->uninstall();
                $response['error'] = __('module [{module}] is not installed due to error [{error}].', array("module" => $moduleManager->get('name'), "error" => $e->getMessage()));
            }
            //  var_dump($moduleManager->getModule()->getInstaller()->getDependencies());
        } catch (mfException $e) {
            $messages->addError($e);
        }
        return $messages->hasMessages('error') ? array("error" => $messages->getDecodedErrors()) : $response;
    }

}

