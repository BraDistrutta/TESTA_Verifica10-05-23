<?php
$jObj = null;

$indirizzoServerDBMS = "localhost";
$nomeDb = "museo";
$conn = mysqli_connect($indirizzoServerDBMS, "root", "", $nomeDb);
if($conn->connect_errno>0){
    $jObj = preparaRisp(-1, "Connessione rifiutata");
}else{
    $jObj = preparaRisp(0, "Connessione ok");
}

$query = "SELECT idPercorso, descr, nSale
        FROM percorsi";

$ris = $conn->query($query);
if($ris){
    $percorsi = array();
    $cont =0;
    if($ris->num_rows > 0){
        while($vet = $ris->fetch_assoc()){
            $percorsi[$cont] = new stdClass();
            $percorsi[$cont]->idPercorso =  $vet["idPercorso"];
            $percorsi[$cont]->descr =  $vet["descr"];
            $percorsi[$cont]->nSale =  $vet["nSale"];
            $cont++;
        }
        $jObj->percorsi = $percorsi;
    }else{
        $jObj = preparaRisp(-1, "Non ho trovato percorsi");
    }
}else{
    $jObj = preparaRisp(-1, "Errore nella query: ".$conn->error);
}

echo json_encode($jObj);


function preparaRisp($cod, $desc, $jObj = null){
    if(is_null($jObj)){
        $jObj = new stdClass();
    }
    $jObj->cod = $cod;
    $jObj->desc = $desc;
    return $jObj;
}