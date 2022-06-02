# Ripasso Generale Reti Di Calcolatori

1. >  Dato l'indirizzo IP 130.136.128.128 con maschera di rete 255.255.128.0 quante sottoreti sono individuate e a quale sottorete appartiene l'indirizzo suddetto?
```
130.136.128.128 si esprime in binario come:
10000010 10001000 10000000 10000000
e la maschera di rete 255.255.128.0 si esprime in binario come:
11111111 11111111 10000000 00000000
da qui si vede che la rete di classe B 130.136.x.y viene estesa con un solo bit, quindi possiamo identificare massimo due sottoreti e la nostra sottorete appartiene alla sottorete 1
```

2. > a quale sottorete appartiene l’indirizzo IPv4: 130.136.9.1 se la maschera di rete è 255.255.248.0? (suggerimento: 248 è pari a 128+64+32+16+8)
```
scriviamo in binario 130.136.9.1
10000010 10001000 00001001 00000001

scriviamo in binario 255.255.248.0
11111111 11111111 11111000 00000000

Quindi il nostro indirizzo apparterra' alla sottorete 00001 -> 1 della rete di classe B
```

3. > Come si esprime 37 in binario?
```
0100101
```

4. > quale numero di host ha la macchina con indirizzo IPv4 130.136.249.0 / 23 se utilizzo la notazione CIDR per esprimere la sottorete a cui appartiene (indicando /23)?
```
La macchina ha indirizzo ip
10000010 10001000 11111001 00000000

e la maschera' di rete e'
11111111 11111111 11111110 00000000

Quindi sara' nella sottorete 1111100 -> 124 della rete di classe B

e avra' numero di host
1 00000000 -> 256.
```

5. > 4) e se l’indirizzo IP della domanda precedente fosse stato 250.129.9.132 con maschera CIDR /25?
```
in tal caso l’indirizzo è di Classe C e in binario si scrive:
11111010 10000001 00001001 10000100
mentre la maschera di rete /25 corrisponde a
11111111 11111111 11111111 10000000
da cui si evince che c’è solo un bit che estende il numero di rete di classe C (i primi 3 byte a sinistra).
Esistono quindi solo due sottoreti della rete di classe C.
Il valore corrispondente nell’indirizzo IP per quel bit è 1, quindi appartiene alla sottorete 1 e ha numero di
host 0000100 = 4
```

6. > quante reti IP di classe B si “fondono” tra loro se utilizzo una maschera di rete /13?
```
/13 equivale a 11111111 11111000 00000000 00000000
/16 equivale a 11111111 11111111 00000000 00000000 (una rete di classe B)
i bit di differenza sono 3, quindi si fondono 2^3 = 8 reti di classe B in una super-rete.
Notare che non sappiamo nulla degli indirizzi IP, ma ragioniamo solo sulle maschere di rete
```

7. > uali classi di rete IPv4 posso utilizzare se voglio poter indirizzare al massimo 300 host della mia rete locale? E se ne voglio indirizzare almeno 300 host?
```
# TODO
```

8. > Quali dei seguenti sono indirizzi IPv4 leciti?
```
a) 120.121.122.123
b) 123.123.321.321 -> no (321 > 255)
c) 130.136.256.0
d) 1.2.3.4
e) 2001:0db8:0:0:1319:8a2e:0307:7344 -> no (indirizzo ipv6)
f) www.dominio.it -> no (dominio)
g) 1:0:0:0 -> no (due punti?)
h) 1.255.1.255
i) AA.BB.CC.DD -> no (le lettere)
j) 110.011.110.001 -> no (gli zero prima del numero?)
k) FF.FF.FF.FF.FF.FF -> no (FF?)
```
9. > Dato l’indirizzo IP 130.136.5.128 con maschera di rete 255.255.255.0 quante sottoreti sono individuate e a quale sottorete appartiene l’indirizzo suddetto? Quale è il primo e l'ultimo indirizzo IPv4 utile (cioè assegnabile a un host) della sottorete individuata? (scrivere i due indirizzi IPv4 per intero)

```
# TODO
```

10. > Dato l’indirizzo IP 130.136.5.128 /23, ovvero con maschera di rete 255.255._____.0, quante sottoreti sono individuate e a quale sottorete appartiene l’indirizzo suddetto? Quale è il numero di host dell'host corrispondente all'indirizzo IPv4 sopra indicato per questa sottorete? Quale è il primo e l'ultimo indirizzo IPv4 utile (cioè assegnabile a un host) della sottorete individuata? (scrivere i due indirizzi IPv4 per intero)
```
# TODO
```
11. > Dato l’indirizzo IP 130.136.5.128 /21, ovvero con maschera di rete 255.255._____.0, quante sottoreti sono individuate e a quale sottorete appartiene l’indirizzo suddetto? Quale è il numero di host dell'host corrispondente all'indirizzo IPv4 sopra indicato per questa sottorete? Quale è il primo e l'ultimo indirizzo IPv4 utile (cioè assegnabile a un host) della sottorete individuata? (scrivere i due indirizzi IPv4 per intero)
```
# TODO
```

12. 
```
L'esecuzione del comando "tracert flora.cs.unibo.it" producei seguenti output:passo indirizzo IP RTT
1 192.168.100.1 (192.168.100.1) 43.171 ms
2 172.18.9.157 (172.18.9.157) 42.037 ms
3 richiesta scaduta
4 richiesta scaduta
5 137.204.2.201 (137.204.2.201) 67.678 ms
6 csgw-cesia.cs.unibo.it (130.136.254.253) 69.391 ms
7 flora.cs.unibo.it (130.136.5.36) 67.935 ms
Questo significa che esiste un cammino su Internet funzionante verso flora.cs.unibo.it, oppure no?
```
```
# TODO
```
13. > Analizzando i dati, come mai alcuni router più lontani mostrano tempi di RTT minori di router più vicini? come è possibile? è possibile valutare quale sia il router tra quelli elencati in media più congestionato? Perchè?
```
# TODO
```
14. > Come disegnereste la topologia di una rete locale, basata su tecnologia Ethernet, che permetta di connettere 1 Router/ADSL verso Internet (con due schede di rete) per fornire accesso a 64 PC (ognuno con una sola scheda di rete) suddivisi equamente in 3 laboratori diversi dello stesso edificio, e tre stampanti di rete IPv4, in modo che ogni laboratorio abbia accesso alla propria stampante di rete sul proprio segmento di rete locale Ethernet, un mail server, un firewall e un antivirus server, e avendo a disposizione per l'acquisto solo Hub a 4 porte (costo 30 Euro) e Switch a 24 porte (costo 300 Euro)? Considerate separatamente aspetti di efficienza, affidabilità, prestazioni e costo totale.
```
# TODO
```
15. > Immaginate di possedere una rete di classe A di indirizzo 20.0.0.0 e supponete di volere progettare l'assegnazione e configurazione degli indirizzi IPv4 su una rete come quella disegnata in figura. Progettate il subnetting della rete (definire le sottoreti) in modo che siano sprecati il minor numero possibile di indirizzi IP, e garantendo la gerarchia della rete secondo lo schema dei router sotto indicati. Completare lo schema con le informazioni di configurazione IPv4 di ogni router e degli host client (a campione) sotto indicati.
![immagine domanda 15](immagine-domanda-15.png)
```
# TODO
```

16. > Internet è una rete a commutazione di circuito? Perché?

```
# TODO
```

17. > Descrivere almeno 3 fattori che determinano il throughput di comunicazione di una rete di calcolatori (quantità di bit di dati al secondo ricevuti con successo dal destinatario):
```
# TODO
```
18. > Quali tecnologie di rete locale tra quelle viste a lezione usano un canale di comunicazione ad accesso multiplo (broadcast)?

```
# TODO
```

19. > Meglio una rete che invia 10 Mb/s con un ritardo di 1 secondo o una rete che invia 1Mb/s con un ritardo di 100 ms? Motivare la risposta.
```
# TODO
```

20. > Quali componenti gestiscono la comunicazione di rete IPv4 a livello Rete (3)? Quali compiti assolvono?

```
# TODO
```

21. > Il protocollo UDP si differenzia da TCP? Come? A quale livello sono implementati
```
# TODO
```
22. > A quale classe appartengono i seguenti indirizzi IPv4?

```
- 140.140.140.140
- 120.120.120.120
- 191.191.191.191
```
23. > sono equivalenti il controllo di flusso e il controllo di congestione in TCP? Da quali fattori sono governati?
```
# TODO
```

24. > Un calcolatore può essere connesso a Internet senza disporre di una maschera di rete e di un DNS server? E nel caso di una connessione wireless a Internet?
```
# TODO
```

25. > A cosa serve il protocollo ICMP? Quali applicazioni viste a lezione si basano su tale protocollo?
```
# TODO
```

26. > Quali di queste sono maschere di rete legali? (suggerimento: considerare anche il valore in binario)

```
- 255.0.0.0
- 254.255.0.0
- 255.254.0.0
- 255.193.0.0
- 255.128.0.0
- /23
- /24
- /25
- /26
- /30
- /31
- /32
- /33
- 0.0.0.255
- 10.0.0.0
- 11111100.0.0.0
- FF.FB.00.00
```

27. > Che utilità ha il meccanismo RTS/CTS nelle reti 802.11?
```
# TODO
```

28. > a quale sottorete appartiene l’indirizzo IPv4: 180.17.225.5 se la maschera di rete è 255.255.240.0? (suggerimento: 240 è pari a 128+64+32+16)
```
- sottorete 225 della rete di classe B 180.17
- sottorete 225 della rete di classe C 180.17
- sottorete 17 della rete di classe C 180.17.255
- sottorete 224 della rete di classe B 180.17
- sottorete 14 della rete di classe B 180.17
- nessuna delle precedenti
```

29. > Come si esprime 97 in binario?
```
# TODO
```

31. > Quali sono il primo e l'ultimo indirizzo IPv4 utile per la sottorete 130.136.249.0? e a quali sottoreti apparterrebbero gli host ai quali fossero attribuiti i due indirizzi suddetti se la maschera di rete fosse /22?
```
# TODO
```

32. > Quanti host puo contenere la rete di cui e' router il nodo 190.12.32.47/23? E se la maschera di rete fosse 255.255.255.0? E se la maschera di rete fosse 255.255.255.128?
```
# TODO
```
33. > Sono disponibili indirizzi IPv4 a partire da 130.136.17.0 e si vogliono attribuire indirizzi IPv4 a 3 diversi domini di rete X, Y, K composti rispettivamente da 100, 60, e 10 indirizzi, sprecandone il meno possibile. Come possono essere identificate le sottoreti X,Y,K e quali sono gli indirizzi di rete e di broadcast per ognuna di loro?

```
# TODO
```

34. > In quali modalita si puo configurare il funzionamento di un access point WI-FI 802.11?

```
# TODO
```
35. > A quale sottorete appartiene l’indirizzo IPv4: 130.136.17.1 se la maschera di rete è 255.255.240.0? (suggerimento: 240 è pari a 128+64+32+16) (scrivere il procedimento sotto)

```
# TODO
```

36. > Quale numero di host ha la macchina con indirizzo IPv4 130.136.247.2 / 22 se utilizzo la notazione CIDR per esprimere la sottorete a cui appartiene (indicando /22)? (scrivere il procedimento sotto). E a quale sottorete appartiene l’host, nella rete di classe B 130.136.x.y, se uso maschera di rete /22?
```
# TODO
```
