<?php

class site_elfinder_connectorAction extends mfAction {
    
    /**
 * Simple function to demonstrate how to control file access using "accessControl" callback.
 * This method will disable accessing files/folders starting from  '.' (dot)
 *
 * @param  string  $attr  attribute name (read|write|locked|hidden)
 * @param  string  $path  file path relative to volume root directory started with directory separator
 * @return bool|null
 **/
    function access($attr, $path, $data, $volume) {          
	return strpos(basename($path), '.') === 0       // if file/folder begins with '.' (dot)
		? !($attr == 'read' || $attr == 'write')    // set read+write to false, other (locked+hidden) set to true
		:  null;   
    }
    
    function execute(mfWebRequest $request) {     
        mfFileSystem::mkdirs(mfConfig::get('mf_site_frontend_dir').'/view/files');
        $connector = new elFinderConnector(new elFinder(array(
                            // 'debug' => true,
                            'roots' => array(
                                array(
                                    'driver' => 'LocalFileSystem', // driver for accessing file system (REQUIRED)
                                    'path' => mfConfig::get('mf_site_frontend_dir').'/view/files', // path to files (REQUIRED)
                                    'URL' => url('/web/files','','frontend'), // URL to files (REQUIRED)
                                    'accessControl' => array($this,'access')             // disable and hide dot starting files (OPTIONAL)
                                )
                            )
                        )));
        $connector->run();
        die();
        return mfView::NONE;
    }
}

