# Progettazione completa di domini IP

## Traccia

Rete di classe B Dominio 130.136.0.0/16**(1)** da dividere in 3 sottoreti:

- **IP1** con 48 host;
- **IP2** con 260 host suddivisi in due sottoreti:
  - sottorete IP2A con 140 host;
  - sottorete IP2B con 120 host;
- **IP3** con 4 host.

> Attenzione: nel numero di host indicati nella traccia includeremo sempre il router (quindi ad es. IP1 ha 48 host, router incluso).

# Svolgimento

Si parte dal basso e si procede verso l’alto e dalla “fetta più grande”, in questo modo non creiamo reti più grandi di quanto necessario.

Dobbiamo definire **(2)**:

- Rete e sottorete;
- Netmask;
- Primo host indirizzabile;
- L’ultimo host indirizzabile;
- Indirizzo IP del router;
- Il broadcast.

> Da buoni sistemisti occuperemo gli indirizzi IP in maniera ordinata e compatta, così da rendere la rete future-proof nel caso volessimo aggiungere grosse sottoreti in futuro

## Sottoreti di **IP2**

Innanzitutto il router generale della rete IP2 sarà contenuto in una delle due sottoreti (IP2A o IP2B), dopo ci torniamo.

Partiamo dalla rete `130.136.0.0`, abbiamo tutti gli host a disposizione. Partiamo dal gruppo maggiore, quello che deve contenere 140 host.

### Sottorete **IP2A**

140 host da indirizzare, la potenza di 2 minima per poterli contenere è $2^8$; conterremo più di 140 host, ben 256, ma non è un male perché se in futuro vorremo aggiungere più host non dovremo preoccuparci di riconfigurare la rete.

Per gli host ci serviranno quindi 8 bit (così arriviamo a 255), quindi come maschera di rete potremo definire una netmask del tipo: `255.255.255.0` (detto in CIDR: `/24`) In questo modo rubiamo tutto il terzo byte per suddividere la rete.

Con questa netmask possiamo realizzare fino a 256 sottoreti, potremmo teoricamente scegliere quelli che vogliamo per le nostre due reti, ma se li diamo a caso creiamo frammentazione, per questo andremo in ordine.

Il primo indirizzo disponibile è 130.136.0.0, che però sappiamo essere il nome di rete e sottorete. La sottorete la indicheremo con: `130.136.0.0/24`.

> `130.136.0.0/24` è diverso dalla rete che abbiamo indicato nella traccia (`130.136.0.0/16`) perché quella indicava la rete, questo indirizzo che termina in `/24` indica la **sottorete**.

Quindi, riempiendo lo schema:

- Rete e sottorete: `130.136.0.0/24`;
- Netmask: `255.255.255.0`;

L’ultimo indirizzo è sempre l’indirizzo di broadcast, quindi:

- Broadcast della rete: `130.136.0.255`;

Quindi diamo al router l’indirizzo appena precedente (l’ultimo host indirizzabile, come best practice):

- Indirizzo IP del router: `130.136.0.254`;

Quindi l’ultimo host indirizzabile per davvero avrà indirizzo:

- Ultimo host indirizzabile: `130.136.0.253`;

Infine il primo host indirizzabile sarà:

- Primo host indirizzabile: `130.136.0.1`.

Abbiamo così definito la prima subnet, la **IP2A**.

### Sottorete **IP2B**

Qui la potenza di 2 minima è $2^7$ = 128 host, solo 8 host in più a quelli necessari. Un buon sistemista cerca di capire se la rete in futuro è probabile che cresca e, in tal caso, sceglierà comunque un bit in più in modo da tenersi largo. In questo caso prenderemo 128 host e ci terremo il grado minimo di elasticità.

Abbiamo quindi a disposizione 7 bit per l’host e l’ottavo bit del byte lo possiamo regalare alla netmask.

Vogliamo quindi che il terzo byte valga 1 e poi ci prendiamo il primo bit dell’ultimo byte. In altre parole la netmask sarà una `/25`, ovvero: `255.255.255.128`.

In pratica sto prendendo una sotto-sottorete, perché l’intera sottorete sarebbe sprecata per soli 120 host.

Quindi, riempiendo lo schema:

- Rete e sottorete: `130.136.1.0/25`;
- Netmask: `255.255.255.128`;
- Primo host indirizzabile: `130.136.1.1`;
- Ultimo host indirizzabile: `130.136.1.125`;
- Indirizzo IP del router: `130.136.1.126`;
- Broadcast della rete: `130.136.1.127`.

### Sottorete **IP2**

Dobbiamo includere nella rete **IP2** le due sottoreti A e B e fare in modo che la riempiano interamente.

> Problema: come facciamo a dire che vogliamo sia gli host a 0 che quelli a 1 nel terzo byte? Scriviamo `130.136.0.0/23`.

Quindi, riempiendo lo schema:

- Rete e sottorete: `130.136.0.0/23`;
- Netmask: `255.255.254.0`;
- Primo host indirizzabile: `130.136.0.1`;
- Ultimo host indirizzabile: `130.136.1.253`;
- Indirizzo IP del router: `130.136.1.254`;
- Broadcast della rete: `130.136.1.255`.

## Sottorete **IP1**

Per la sottorete IP1 dobbiamo avere spazio per almeno 48 host, quindi la potenza di 2 minima è $2^6$=64.

Quindi la netmask sarà del tipo `255.255.255.192`. Dato che le sottoreti 0 e 1 le abbiamo già prese, la sottorete per **IP1** sarà la 2.

Quindi, riempiendo lo schema:

- Rete e sottorete: `130.136.2.0/26`;
- Netmask: `255.255.255.192`;
- Primo host indirizzabile: `130.136.2.1`;
- Ultimo host indirizzabile: `130.136.2.61`;
- Indirizzo IP del Router: `130.136.2.62`;
- Broadcast della rete: `130.136.2.63`.

## Sottorete **IP3**

Infine per la sottorete IP3 ci serve indirizzare solo 4 host, quindi la netmask sarà del tipo `255.255.255.248`.

Quindi, riempiendo lo schema:

- Rete e sottorete: `130.136.3.0/29`;
- Netmask: `255.255.255.248`;
- Primo host indirizzabile: `130.136.3.1`;
- Ultimo host indirizzabile: `130.136.3.5`;
- Indirizzo IP del Router: `130.136.3.6`;
- Broadcast della rete: `130.136.3.7`.

---

# Note

**(1)**: quel `/16` vuol dire che ho la netmask `255.255.0.0`, che essendo la rete di classe B non ci cambia nulla poiché corrisponde alla netmask naturale; ci conferma che abbiamo a disposizione tutta la rete di classe B.

**(2)**: queste informazioni le dovremo fornire sempre negli esercizi da esame.
