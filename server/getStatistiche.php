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

$query = "SELECT idBiglietto, data, idPercorso, annoNascita, studente, abbonamento
        FROM biglietti";

$ris = $conn->query($query);
if($ris){
    $biglietti = array();
    $nBambini = 0;
    $nAnziani = 0;
    $nAbbonati = 0;
    $nStudenti = 0;
    $cont =0;
    if($ris->num_rows > 0){
        while($vet = $ris->fetch_assoc()){
            $data = (int)$vet["data"].substr(0,4);
            $nascita = (int)$vet["annoNascita"];
            $nBambini +=  ($data - $nascita < 11) ? 1 : 0;
            $nAnziani +=  ($data - $nascita > 80) ? 1 : 0;
            $nAbbonati +=  ((int)$vet["abbonamento"] == 1) ? 1 : 0;
            $nStudenti +=  ((int)$vet["studente"] == 1) ? 1 : 0;

            $biglietti[$cont] = new stdClass();
            $biglietti[$cont]->idBiglietto = $vet["idBiglietto"];
            $biglietti[$cont]->data = $vet["data"];
            $biglietti[$cont]->idPercorso = $vet["idPercorso"];
            $biglietti[$cont]->annoNascita = $vet["annoNascita"];
            $biglietti[$cont]->studente = $vet["studente"];
            $biglietti[$cont]->abbonamento = $vet["abbonamento"];

            $cont++;
        }
        $jObj->biglietti = $biglietti;
        $jObj->nBambini = $nBambini;
        $jObj->nAnziani = $nAnziani;
        $jObj->nAbbonati = $nAbbonati;
        $jObj->nStudenti = $nStudenti;
    }else{
        $jObj = preparaRisp(-1, "Non ho trovato biglietti");
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