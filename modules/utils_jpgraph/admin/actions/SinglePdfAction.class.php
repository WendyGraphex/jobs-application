<?php


 
class utils_jpgraph_SinglePdfAction extends mfAction {
    
    
    function execute(mfWebRequest $request) {
        $this->time= microtime();
        $this->value="fatima";
           $donnees= array(25,55,12,10,12,44,58,14,9);
        $hauteur=300;
        $largeur=350;
        $this->graph1=new jpgraphs($largeur,$hauteur);
        $histo= new LinePlot($donnees);
        $this->graph1->SetScale("textlin");
        $this->graph1->Add($histo);
        $this->graph1->title->set("Graph du test ...");
      
    }
}

