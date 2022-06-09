# Subnetting e netmask

> BUONA PRATICA (che applicheremo nei nostri esercizi):
> Di solito l'ultimo host indirizzabile di una rete/sottorete viene assegnato al router di quella rete/sottorete.

# Es. 1 - Alcuni esempi di indirizzi IPv4, relative reti e sottoreti e uso della maschera di rete.

Prendiamo la rete `130.136.0.0`, che in binario sarebbe:

`10000010.10001000.00000000.00000000`

- Che classe di rete è?
  Classe B. (È la rete del dipartimento di Informatica ndr).

Prendiamo ora la sua maschera di rete _naturale_ (associata a rete di classe B):

`11111111.11111111.00000000.00000000` = `255.255.0.0` (netmask)

Se invece usassi la maschera di rete:

`11111111.11111111.10000000.00000000` = `255.255.128.0`

- Quante sottoreti avrei creato?
  In questo modo avrei definito 2 sottoreti da $2^{15} = 32.768$ host.

Prendiamo ora un host in particolare, prendiamo l'host `72.48` della rete `130.136.0.0`. Ovvero:

`10000010.10001000.01001000.00110000` = `130.136.72.48`.

Se usassi la netmask che segue:
`11111111.11111111.11000000.00000000` = `255.255.192.0`.

- Quante sottoreti avrei definito? Da quanti host ciascuna?
  Avrei definito 4 sottoreti da $2^{14} = 16.384$ host.
- A quale sottorete apparterrebbe l'host `72.48`?
  Alla sottorete `01`.

# Es. 2 - Netmask numbers

Enumerare tutte le combinazioni di netmask number

`00000000` = 0

`10000000` = 128

`11000000` = 192

`11100000` = 224

`11110000` = 240

`11111000` = 248

`11111100` = 252

`11111110` = 254

`11111111` = 255

Quali delle seguenti sono maschere di rete legali:

- `128.0.0.0`
  **Sì**, è una maschera di rete! molto strana ma lo è...
- `255.128.0.0`
  **Sì**, è una maschera di rete.
- `255.128.255.0`
  **No**, non è una maschera di rete.
- `255.192.128.0`
  **No**, non è una maschera di rete.
- `255.192.0.0`
  **Sì**, è una maschera di rete.

# Es. 3 - Host di una sottorete

Data la scheda di rete con indirizzo IPv4 `193.180.117.42` e netmask `255.255.255.224`.

Specificare a quale rete/sottorete appartiene `193.180.117.42` e quale è il suo numero di host.

- Risposta 1

  `11000001.10110100.01110101.00101010` = 193.180.117.42 (IPv4);

  `11111111.11111111.11111111.11100000` = 255.255.255.224 (netmask);

  ```
  11000001.10110100.01110101.00101010  &
  11111111.11111111.11111111.11100000  =
  --------------------------------------
  11000001.10110100.01110101.00100000
  ```

  Quindi:

  - La rete è la rete di classe B `193.180.0.0`;
  - La sottorete è la sottorete `193.180.117.32`;
  - L'host è l'host di indirizzo `117.42`, che è il `10` della sottorete.

- Quali sono gli indirizzi IPv4 di questa rete e sottorete?
  In binario:
  - 11000001.10110100.01110101.001`00000` - host a zero indica la rete e sottorete;
  - 11000001.10110100.01110101.001`00001` - host 1, valore dell'ultimo byte di indirizzo = 33;
  - 11000001.10110100.01110101.001`00010` - host 2, ultimo byte = 34;
  - 11000001.10110100.01110101.001`00011` - host 3, ultimo byte = 35;
  - ...
  - 11000001.10110100.01110101.001`11110` - host 30, ultimo byte = 62;
  - 11000001.10110100.01110101.001`11111` - host number tutto a 1 indica il broadcast di sottorete, valore dell'ultimo byte = 63.
  In decimale:
  - `193.180.117.32` - la sottorete;
  - `193.180.117.33` - host 1;
  - `193.180.117.34` - host 2;
  - ...
  - `193.180.117.62` - ultimo host;
  - `193.180.117.63` - broadcast.

# Es. 4 - Spazi di indirizzamento

Una ditta ha acquistato il dominio `200.100.80.0` con netmask `255.255.255.240`.

La ditta ti chiede di indirizzare (in IPv4) **12** host in questa rete e sottorete.

Come devono essere configurate?

- Qual è la classe di rete?
  È una rete di **classe C**; lo capisco dal valore 200 del primo byte.
- Qual è quindi lo spazio di indirizzamento?
  Essendo una rete di classe C, vuol dire che la rete è la `200.100.80.0` con netmask naturale `255.255.255.0`.
  Attenzione, la rete aziendale invece ha netmask `255.255.255.240`❗️
  Tradotto in binario la netmask è:
  `11111111.11111111.11111111.11110000`.
  Gli indirizzi IPv4 del mio spazio di indirizzamento saranno quindi:
  ```
  200.     100.     80.      (00000000)
  11111111.11111111.11111111. 11110000
  ```
  Quindi la mia sottorete è la `0000` (in decimale semplicemente la 0) delle 16 possibili.
- Ho indirizzi a sufficienza per i miei 12 host della rete/sottorete?
  Lo spazio di host prevede tutte le combinazioni finali dei bit a zero nella netmask, ovvero degli ultimi 4 bit del quarto byte dell'indirizzo IP, le quali combinazioni sono:
  - 0000 - il numero riservato per indicare la rete/sottorete;
  - 0001 - primo host assegnabile, nel byte sarebbe `00000001` = 1;
  - 0010 - secondo host assegnabile, `00000010` = 2;
  - ...
  - 1110 - ultimo host assegnabile, `000001110` = **14**;
  - 1111 - broadcast della sottorete.
  Quindi posso assegnare numeri di host dal 1 al 14.
  Quindi riesco a soddisfare la richiesta di connettere 12 host.

# Es. 5 - Calcolo maschera di rete e sottorete

Supponiamo di voler dividere la rete di classe B 130.136 in 8 sottoreti.

- Quanti host potrà contenere al massimo ogni sottorete?
  Per creare 8 sottoreti serve prendere 3 bit dalla parte host, quindi restano 16-3=13 bit per indirizzare gli host di ogni sottorete. $2^{13}=8192$, tolti gli l'indirizzo che rappresenta la rete e quello di broadcast, potrò avere al più 8190 host per ogni sottorete.
- Come definisco la maschera di rete?
  Devo prendere 3 bit dalla parte host dell'indirizzo IP per poter creare 8 sottoreti, quindi la netmask sarà del tipo: `11111111.11111111.11100000.00000000`, che in decimale sarebbe 255.255.(128+64+32).0 = 255.255.224.0.
