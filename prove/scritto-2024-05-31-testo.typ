#set align(center)
= Scritto Reti Di Calcolatori
== 2024-30-31


#set align(left)
NOTE: _Questa è una copia scritta a mano dell'esame_

#set par(
  justify: true
)

#set enum(numbering: "1.a)")

== Domande

+ [5] Perché si utilizzano gli acknowledgement nella comunicazione di rete? 
  E perché si utilizzano in due dei sette livelli protoccolari ISO/OSI?

+ [5] Quali tra le tecniche di modulazione digitale (FSK, ASK, PSK, QAM) nelle 
  reti senza fili sono MENO resistenti all'interferenza (cioè a più rischio di 
  erorri)? Giustificare la risposta.

+ [5] Cosa indica la regola dei 6dB e quale utilità pratica ha?

+ [15] Alice e Bob devono produrre la fattorizzazione di 4 numeri primi 
  #underline[compresi tra 1 e 100]: $a_1, a_2$ da Alice a Bob, e $b_1, b_2$ da 
  Bob a Alice. Inizia Alice con la spedizione del primo messaggio verso Bob. 
  Ogni ricevitore verifica che il messaggio provenga dal mittente previsto 
  (garanzia del mittente) e che il messaggio sia integro (non modificabilità). 
  Fornire la progettazione #underline[del più efficiente protocollo sicuro] che 
  garantisca che la fattorizzazione finale di $X$ ottenuta sia da Alice che da 
  Bob (dopo i messaggi scabiati) sia il valore esatto $X = a_1 * a_2 * b_1 * b_2$ 
  evitando che Trudy possa modificare tale somma o conoscereil valore di $X$ 
  (privacy).
  Suggerimento: considerare anche attacchi forza bruta #footnote[Come detto 
  durante l'esame, i numeri primi compresi tra 1 e 1000 sono pochi (circa 100). 
  Quindi forza bruta da parte di trudy non è detto che sia sulla chiave...] e 
  replay da parte di Trudy.

+ [10] Se il comando *PING flora.cs.unibo.it* produce il seguente risultato 
  quale può essere la causa? e quali protocolli e servizi di rete vengono usati 
  per determinare i risultati sotto indicati?

  #box(
      //height: 9pt,
      stroke: black,
      inset: 10pt,
      [
    PING flora.cs.unibo.it (130.136.5.36): 56 data bytes \
    64 bytes from 130.136.5.36: icmp_seq=0 ttl=54 time=16.624 ms \
    64 bytes from 130.136.5.36: icmp_seq=1 ttl=54 time=15.590 ms \
    ping: sendto: No route to host \
    ping: sendto: No route to host \
    Request timeout for icmp_seq 2 \
    Request timeout for icmp_seq 3 \
    64 bytes from 130.136.5.36: icmp_seq=4 ttl=54 time=15.404 ms \
    64 bytes from 130.136.5.36: icmp_seq=5 ttl=54 time=14.712 ms \
      ]
  )


  e se invece il risultato fosse stato questo?

  #box(
      //height: 9pt,
      stroke: black,
      inset: 10pt,
      [
    PING flora.cs.unibo.it (130.136.5.36): 56 data bytes \
    ping: cannot resolve flora.cs.unibo.it: Unknown host
      ]
  )

+ [10] Un segmento di rete locale dispone di un Web Proxy locale in grado di 
  contenere in media $X%$ delle richieste di pagine web richieste dagli host 
  della rete locale (tutte di dimensione molto limitata). Se la latenza della 
  rete locale è di 9ms e se la latenza del collegamento a internet verso i Web 
  Server esterni è in media 300ms, quale è il #underline[ritardo medio] per il 
  completamento di una richiesta HTTP da parte di un browser su un PC della rete 
  locale? e quale deve essere la percentuale di $X%$ per avere un ritardo medio 
  di $97%$ms

+ [5] data la matrice dei bit di parità pari che segue cosa possiamo dire su 
  eventuali errori della sequenza di bit? (i bit sottolineati sono i bit di 
  parità pari). Spiegare.

  #box(
    stroke: black,
    inset: 5pt,
    table(
      columns: 8,
      stroke: none,
      [1], [0], [1], [0], [0], [1], [], [#underline[1]],
      [1], [1], [1], [0], [0], [0], [], [#underline[0]],
      [0], [1], [1], [1], [0], [0], [], [#underline[1]],
      [1], [0], [1], [0], [1], [0], [], [#underline[1]],
      [1], [1], [1], [1], [0], [1], [], [#underline[1]],
      [1], [1], [1], [1], [1], [1], [], [#underline[0]],
      [], [], [], [], [], [], [], [],
      [#underline[1]], [#underline[1]], [#underline[1]], [#underline[0]], 
      [#underline[1]], [#underline[1]]
    )
  )

+ [10] 
  + Quante sottoreti /20 si possono realizzare dalla rete che contiene l'host 
    146.128.128.128? Numero di sottoreti /20:
  + Quale è il range di indirizzi (dal numero di rete al broadcast) della quinta
    di queste sottoreti (ovvero la numero 4)?
    - IPv4 del numero di rete della quinta sottorete /20:
    - IPv4 del broadcast della quinta sottorete:
  + A quale sottorete appartiene l'host 146.128.128.133?

+ [25] Define gli indirizzi Ipv4 e maschere di rete da assegnare agli host e ai 
  router come da schema indicato. Leggere pagina successiva...

  #place(
    center,
    square(
      [
      #set align(center + horizon)
      Internet
      ]
    )
  )
  #place(
    center,
    dy: 50pt,
    line(
      start: (0%, 0%),
      end: (0%, 5%)
    )
  )
  #place(
    center,
    dy: 90pt,
    circle(
      radius: 25pt,
      [
      #set align(center + horizon)
      N
      ]
    )
  )
  
  #place(
    center,
    dy: 120pt,
    line(
      start: (-8%, 0%),
      end: (-35%, 4%)
    )
  )
  
  #place(
    center,
    dy: 120pt,
    dx: 80pt,
    line(
      start: (8%, 0%),
      end: (35%, 4%)
    )
  )
  
  #place(
    left,
    dy: 130pt,
    circle(
      radius: 30pt,
      [
      #set align(center + horizon)
      Subnet A
      ]
    )
  )
  #place(
    left,
    dx: 30pt,
    dy: 192pt,
    line(
      start: (0%, 0%),
      end: (0%, 5%)
    )
  )
  #place(
    left,
    dy: 230pt,
    circle(
      radius: 30pt,
      [
      #set align(center + horizon)
      Subnet A1
      ]
    )
  )
  
  #place(
    right,
    dy: 130pt,
    circle(
      radius: 30pt,
      [
      #set align(center + horizon)
      Subnet B
      ]
    )
  )
  #place(
    right,
    dx: -30pt,
    dy: 192pt,
    line(
      start: (0%, 0%),
      end: (0%, 5%)
    )
  )
  #place(
    right,
    dy: 230pt,
    circle(
      radius: 30pt,
      [
      #set align(center + horizon)
      Subnet B1
      ]
    )
  )

  #v(300pt)

  Limiti di hosts:
  #table(
    columns: 2,
    align: center,
    table.header([*Subnet*], [*Max numero di hosts*]),
    [Subnet A], [490],
    [Subnet A1], [155],
    [Subnet B], [35],
    [Subnet B1], [12]
  )

  Per la rete N indicare i seguenti valori:
  - Network N = 133.99.240.0/22
  - Netmask: 
  - First host: 
  - Last host: 
  - Router di N: 
  - Broadcast di N: 

  Per _ciascuna_ le subnet indicare i seguenti valori:
  - Netmask: 
  - First host: 
  - Last host: 
  - Gateway del router della subnet:
  - Router della subnet: 
  - Broadcast della subnet: 

+ [10] Una rete locale (LAN) deve essere progettata e realizzata a livello 
  fisico della infrastruttura con i seguenti requisiti: si devono connettere 80
  host client con interfaccia ethernet, esistono 4 server (S1, S2, S3, S4) per i
  servizi ad elevate prestazioni per i quali sono acquistate macchine apposite 
  ognuna dotata di una interfaccia Ethernet, esistono 4 stampanti di rete, 
  esiste un router R dotato di doppia interfaccia Ethernet: interna (LAN) e 
  esterna (WAN/Internet).
  Disegna qui sotto lo schema dei collegamenti dell'infrastruttura di rete 
  locale (utilizzando solo switch a 24 porte), avendo come obiettivo il corretto
  funzionamento di Ethernet e il bilanciamento del carico di rete medio, oltre
  che la potenziale limitazione degli effetti dei guasti, e limitando il budget
  di spesa al minimo.
  + Quale sarà il numero minimo di cavi Ethernet di collegamento da acquistare 
    per non avere nessuna partizione di rete?
  +  Quali servizi di rete sono utili  indispensabili sui server per il 
    collegamento a internet?
  + Se l'interfaccia WAN del router avesse l'IPv4 129.1.255.254, rispetterebbe
    le linee guida per la scelta dell'IP del Router della #underline[rete locale]?
  + Se ogni host della LAN dovesse essere connesso ad Internet, ma senza 
    disporre dell'intera rete 129.1.0.0/16, avendo acquistato solo l'indirizzo
    pubblico IPv4 129.1.255.254, quale soluzione potremmo realizzare?
