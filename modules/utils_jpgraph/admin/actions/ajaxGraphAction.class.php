<?php


class utils_jpgraph_ajaxGraphAction extends mfAction {
    //put your code here
    public function execute(mfWebRequest $request) {
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
