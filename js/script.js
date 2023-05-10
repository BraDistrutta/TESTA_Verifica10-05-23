/*
    Completare le due funzioni indicate e collegare in modo opportuno 
    i metodi alla pagina html. 

    NOTA. E' possibile servirsi di altre funzioni per completare quanto indicato.
*/
var today = new Date();
var _btnAcquista = null;
var _main = null;
var urlBase = window.location.href.substring(0,46);
window.onload = init();

/**
 *  Inizializza l'interfaccia richiedendo i dati necessari 
 * e caricando dinamicamente la select e creando il grafico
 */
function init(/** EVENTUALI PARAMETRI */){
    _btnAcquista = document.getElementById("btnAcquista");

    _main = document.querySelector("main");

    console.log(urlBase);
    console.log(today);

    chiamaServer();
}

/**
 * Gestisce la prenotazione del percorso mandando i dati al server 
 * e visualizzando la sua risposta. 
 * 
 * E' necessario controllare che sia compilato ALMENO il percorso,
 * gli altri campi vengono valorizzati a NO o alla data di oggi.
 * 
 * 
 * PER IL 10. Fare il donwload di un file html creato dinamicamente che contenga 
 * le info relative alla prenotazione.
 */
function acquista(/** EVENTUALI PARAMETRI */){
    let _selPercorsi = document.getElementById("selPercorsi");
    let _txtAnno = document.getElementById("txtAnno");
    let _Studente = document.getElementById("divStudente");
    let _Abbonamento = document.getElementById("divAbbonamento");



}

async function chiamaServer() {
    let promise2 = await fetch(urlBase + "server/getStatistiche.php", {
            method:"get"
        }
    );

    let JSONStatistiche = await promise2.json();
    //let percorsi = JSONStatistiche.statistiche;
    console.log(JSONStatistiche);
    //console.log(percorsi);

    disegnaGrafico(JSONStatistiche);

    let nPosti = [20,20,20,20,20];
    let data = today.getFullYear() + "-0" + (today.getMonth()+1) + "-" + today.getDate();
    console.log(data);

    for(let i = 0;i<JSONStatistiche.biglietti.length;i++){
        console.log(JSONStatistiche.biglietti[i].data);
        if(JSONStatistiche.biglietti[i].data == data)
            nPosti[parseInt(JSONStatistiche.biglietti[i].idPercorso-1)]--;
    }

    let promise1 = await fetch(urlBase + "server/getPercorsi.php", {
            method:"get"
        }
    );

    let JSONpercorsi = await promise1.json();
    let percorsi = JSONpercorsi.percorsi;
    console.log(JSONpercorsi);
    console.log(percorsi);

    let _selPercorsi = document.getElementById("selPercorsi");
    for(let i =0;i<percorsi.length;i++){

        _selPercorsi.innerHTML += '<option value="'+percorsi[i].idPercorso+'">'+percorsi[i].descr+' con '+nPosti[i]+' posti disponibili</option>';
    }
}

function disegnaGrafico(statistiche) {
    const data = {
        labels: ['Bambini', 'Anziani', 'Studenti', 'Abbonati'],
        datasets: [{
            label: 'N. Biglietti',
            data: [statistiche.nBambini, statistiche.nAnziani, statistiche.nStudenti, statistiche.nAbbonati],
            backgroundColor: [
                'rgb(255, 99, 132)',
                'rgb(75, 192, 192)',
                'rgb(255, 205, 86)',
                'rgb(201, 203, 207)'
            ]
        }]
    };

    const config = {
        type: 'polarArea',
        data: data,
        options: {}
    };

    let canvas = document.createElement("canvas");
    document.getElementById("mainGrafico").appendChild(canvas);
    let grafico = new Chart(canvas, config);

    console.log(data);
}

let html = `
<html>
    <head>
        <title>Biglietto</title>
        <style>
            body, main{
                ....
            }

            main{
                ....
            }

            section{
                ....
            }

            footer{
                ....
            }
        </style>
    </head>
    <body>
        <main>
            <section>
                <article>
                    <h3>.....</h3>
                </article>
                <article>
                    .....
                </article>
            </section>
            <section>
                <h2>......</h2>
            </section>
            <footer>
                Biglietto generate alle .... del giorno .....
            </footer>
        </main>
    </body>
</html>
`;
