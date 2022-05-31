# Livello Trasporto

# Introduzione

Lasciamo ora il livello rete e passiamo al quarto livello dello stack: il livello trasporto.

Questo livello ha due compiti principali:

- Rendere la comunicazione di rete - _che è connectionless_ - affidabile end-to-end.
  I router sono dei dispositivi che lavorano a livello 3, questo vuol dire che loro mandano avanti i pacchetti, come dei passamano, non gli importa cosa succede ai pacchetti: se non arrivano, se il buffer si riempie e fanno cadere i pacchetti in eccesso. Sono tutti problemi che per i router non sono importanti, semplicemente loro vanno avanti a spedire i pacchetti successivi.
  Quindi il primo compito del livello trasporto è assicurarsi che i pacchetti dispersi vengano reinviati, in modo da rendere la connessione affidabile.
- Gestire la congestione.
  Immaginiamo questa situazione: un router riceve 300Gb di dati al secondo e ha un buffer di 300Gb, però riesce a elaborare e spedire solo 10Gb al secondo. Ne consegue che il primo secondo restano da gestire 290Gb, ma il secondo subito dopo arrivano altri dati che superano la capacità del buffer, quindi il router li lascia cadere. I router che hanno inviato quei pacchetti non riceveranno l'ack e quindi ripeteranno il processo; ben presto non solo il router centrale sarà congestionato, la congestione si espanderà a macchia d'olio verso tutti gli altri router.
  Quello che fa il livello trasporto è regolare in maniera rapida e responsive la pressione sui router: non appena ci si rende conto che la rete inizia a congestionarsi bisogna subito mettere in pratica dei sistemi appositi per decongestionarla immediatamente.

I protagonisti della suite di protocolli del livello trasporto sono TCP e UDP.

![Schema illustrativo del livello trasporto](assets/schema-livello-trasporto.png)

## Ruolo del livello trasporto

> I pacchetti a livello trasporto si chiamano **segmenti**.

Quando il destinatario finale riceve i segmenti provvede a fare il riordino, che è solo prerogativa sua, non di chi trasmette i dati (i router leggono solo la busta pacchetto, non quella segmento).

Il livello trasporto riguarda solo il mittente originale e il destinatario finale. Non riguarda i router nel mezzo, in questo modo la backbone di internet non viene appesantita e si mantiene la scalabilità.

Il destinatario finale deve crearsi un buffer in cui salvare i _pacchetti_ e una volta ricostruito il _segmento_ originale (messo tutto in ordine) può passarlo al livello di sopra.

### Congestionare i router

I pacchetti sono grandi pochi kilobit, se ne mandassi uno alla volta userei solo una frazione della rete (se ad esempio avessi una 100 mega, userei pochissimo), quindi bisogna trovare un modo di inviare più pacchetti insieme senza però congestionare i router.

Il problema sta nel capire quali pezzi del segmento ci siamo persi e richiedere il reinvio di quelli soltanto. In pratica dobbiamo trovare un modo per far conoscere al destinatario un'informazione che ha solo il mittente.

È matematicamente impossibile avere la certezza di riuscirci, ma dobbiamo avere fiducia che prima o poi ci riusciamo. Ci basta una certezza che la rete funzioni il 99,9% delle volte e lo faccia nei tempi previsti.

Non posso sapere se il mio pacchetto farà o meno saltare un router sopraffatto dal lavoro, quindi non mi resta che mandare il mio pacchetto sperando che i router nel mezzo reggano. E come me fanno tutti i mittenti sulla rete.

Esiste però una strategia da adottare per evitare che un congestionamento si propaghi a macchia d'olio. Per sapere i miei limiti inizio inviando con un pacchetto, se torna l'ack posso provare a mandarne due, se tornano gli ack provo a mandarne 4 e così via, in questo modo sto testando la rete come fosse una scatola nera.

Lo stesso fanno tutti gli altri router connessi. I router ricevono sempre più pacchetti e a un certo punto saltano e fanno il drop. Se io ad esempio ho inviato 8 pacchetti e mi tornano solo 7 ack vuol dire che probabilmente c'è stato il drop del router, quindi devo rimodulare i miei ritmi, rallentare.

Il rallentamento non è graduale: si rallenta tornando ad inviare 1 solo pacchetto per volta. Questo decadimento serve perché se il pacchetto è droppato vuol dire che i buffer dei router sono pieni, quindi la cosa più furba è ripartire da 1, dar modo al router di smaltire il carico, e ricominciare il gioco.

Ci sono anche casi in cui il protocollo fa affidamente all'utente come fosse parte dell'architettura: il protocollo UDP prevede che l'utente rimandi o rinunci a stabilire una connessione se questa non risponde o risponde lentamente (quindi se la rete è congestionata). Alcune applicazioni quindi possono essere basate su protocolli connectionless.

## Socket

Il socket sono come dei bocchettoni, identificano chi è che invia i dati, sono formati da indirizzo IP e dalla porta usata, dato che ogni porta corrisponde ad una applicazione.

I bocchettoni sono gestiti da TCP.

Prima di usare un socket il livello tcp da la 3-way handshake, che serve ad aprire la connessione tra i due socket (la vedremo meglio passo passo).

Il socket c'è anche in UDP ma non richiede la 3-way handshake per aprire la connessione.

# APPUNTI 30 nov

Al contrario di UDP, TCP ha bisogno di un'operazione preliminare di apertura della comunicazione tra due host end to end, inoltre ha bisogno anche di un'operazione di chiusura.

Questa procedura non è un semplice convenevole ma porta con se dei processi che rendono la connessione affidabile, scalabile, efficiente.

Quando mando una richiesta per aprire una comunicazione TCP le possibilità sono due:

- Risposta: OK (tramite ack TCP)
  - Il mittente manda un terzo messaggio con i parametri per inizializzare lo scambio dati (la connessione sarà bidimensionale).
- Risposta: NO (non ritorna l'ack TCP)
  - Perché no?
    - Quando instauriamo una connessione TCP bisogna mettere in piedi tutta una serie di protocolli che rende affidabile la connessione.
    - Se un pacchetto maledetto non arriva io non posso recapitare il segmento incompleto, quindi serve un buffer per tenere i pacchetti in attesa di quelli mancanti.
    - Il processo di comunicazione deciderà quanto buffer allocare alla comunicazione in entrata, quindi un server può rifiutare una connessione TCP se sta esaurendo il buffer e non riesce quindi ad allocare un buffer.
- Possibile attacco: fare richiesta di avvio connessione, ricevere l'ack e non mandare il terzo messaggio. Per mitigare questo attacco si usano i soliti timeout. Questa è una decisione non conforme al protocollo di comunicazione, quindi un comportamento "strano".
- Quando si chiude la comunicazione si fanno i convenevoli perché entrambi gli estremi di comunicazione si accordano sul fatto che nessuno ha più nulla da comunicare all'altro. Nel momento in cui si accordano, si butta giù tutto e si liberano le risorse che erano impegnate.
  - Se non chiudiamo più la connessione, il buffer rimane allocato e questo non va bene, ci sono dei meccanismi in cui si mandano pacchetti ambigui che servono solo a tenere impegnata la connessione.

Come funziona la fase di scambio dati end-to-end.

A inizio connessione mando un segmento solo, se arriva e ricevo l'ack procedo al raddoppio, mando il secondo segmento, se arriva mando subito i segmenti 3 e 4, poi ne mando altri 4 e così via finché ricevo gli ack.

Se ad un certo punto non mi torna l'ack di un segmento potrebbe essere un sintomo di riempimento della rete, se lo rispedisco e arriva l'ack allora era solo un problemino incidentale e nulla più, ma se inizia a perderne di più è un sintomo grave e vuol dire che il buffer di un router nel mezzo si sta congestionando, quindi bisogna decelerare.

Si decelera con stop-and-wait: si riparte da un pacchetto e si procede col probing: mando un pacchetto e vedo se il router ce la fa.

La fase in cui raddoppio i pacchetti ogni volta si chiama slow start; quando poi arrivo al punto in cui mi ricordo che la scorsa volta si congestionò il router, non raddoppio più e mando solo un pacchetto in più per volta, questa fase si chiama congestion avoidance.

La variabile intera (SW=Sliding window) che mi dice quanti pacchetti sto inviando ha anche la funzione di controllo di flusso: se il server con cui sto comunicando ha un buffer limitato e non riesce a stare dietro ai pacchetti che gli mando va a finire che è proprio il destinatario che fa cadere la comunicazione. Ad esempio se usiamo un Raspberri Pi quello potrebbe collassare subito.

Per sapere il limite di ricezione del destinatario si usa il meccanismo di apertura connessione del porotocollo TCP che abbiamo visto.

Così facendo quando la variabile intera arriva al massimo consentito dal destinatario, il mittente non accelera più.

- Controllo di flusso: non spedire mai più dati di quanti ne può ricevere il destinatario;
- Controllo di congestione: non spedire più dati di quanti ne fanno congestionare il router più scarso;

Il protocollo UDP non fa nulla di tutto ciò, invia i dati e basta. Il protocollo UDP lascia queste considerazioni e scelte all'applicazione che gli sta sopra.

Tutta internet è una rete best-effort, ognuno fa il meglio che può.

Se oggigiorno internet funziona molto bene è perché troviamo sempre strade spianate, non congestionate.

Questo vuol dire che abbiamo un'infrastruttura capace di reggere tutto questo traffico senza entrare in congestione.

La congestion window non rappresenta il numero di pacchetti inviati e basta ma il numero di pacchetti inviati di cui ancora aspetto un ack. Se spedisco quattro pacchetti e ricevo un ack, si libera un posto nella finestra per mandare un altro pacchetto.

Non appena mi rendo conto che ho ricevuto 4 ack posso allargare la finestra.
