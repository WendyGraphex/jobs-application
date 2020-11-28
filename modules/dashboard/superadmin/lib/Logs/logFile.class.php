<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of logFile
 *
 * @author fred
 */
class logFile extends File {
    
    function __construct($file)
    {
        if ($file)
            parent::__construct(mfConfig::get('mf_log_dir')."/".$file);
    }
}

