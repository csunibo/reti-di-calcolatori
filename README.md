# \<Insegnamento\>

Una raccolta di risorse per l'insegnamento di \<Insegnamento\> del Corso di
Laurea in Informatica.

## Presentazione

[Questo sito](https://csunibo.github.io/<insegnamento>) elenca staticamente
i contenuti della raccolta. Qui, documenti e presentazioni con estensione
`.md`, `.tex`, `.doc`, `.docx`, `.ppt` o `.pptx` sono automaticamente
convertiti in formato PDF.

## Contribuire

Si può contribuire al progetto tramite una [_pull request_](https://docs.github.com/en/enterprise-server@3.1/pull-requests).
La seguente tabella elenca gli identificativi validi per le cartelle a livello
radice. Ciascun contenuto deve essere collocato nella cartella che meglio lo
descrive e avere un nome accettato dalla relativa espressione regolare, qualora
essa sia specificata.

Identificativo | Espressione regolare accettante i nomi dei contenuti | Esempi
-------------- | ---------------------------------------------------- | ------
`appunti` | `[a-z0-9]+(-[a-z0-9]+)*\.[a-zA-Z]+` | `notion-di-mario-modulo2.link`, `glossario.tex`
`dispense` | `\d+(-[a-z0-9]+)+\.[a-zA-Z]+` | `00-introduzione.pdf`, `01-fondamenti-del-calcolo.txt`
`esercizi` | `[a-z0-9]+(-[a-z0-9]+)*\.[a-zA-Z]+` | `eserciziario-del-tutor.pdf`, `esercitazione-2022-05-10.tex`, `esercizio-1-12.c`
`lavagne` | `\d{4}-\d{2}-\d{2}(-[a-z0-9]+)+\.[a-zA-Z]+` | `2022-02-21-presentazione.pdf`, `2022-02-22-modelli-di-calcolo.png`
`libri` | `[a-z0-9]+(-[a-z0-9]+)*\.[a-zA-Z]+` | `fioresi-morigi-introduzione-all-algebra-lineare.pdf`
`lucidi` | `\d+(-[a-z0-9]+)+\.[a-zA-Z]+` | `00-introduzione.pptx`, `01-fondamenti-del-calcolo.pdf`
`prove`| `(scritto\|totale\|parziale\d\|orale(\d?)\|progetto(\d?))-\d{4}(-\d{2}-\d{2})?(-[a-z0-9]+)?-(testo\|soluzione)(-[a-z0-9]+)?\.[a-zA-Z0-9]+` | `parziale2-testo-2022-05-24-b.pdf`, `totale-soluzione-2022-05-31-incompleto.pdf`, `orale-testo-2022-06-08.md`
`varie` | `[a-z0-9]+(-[a-z0-9]+)*\.[a-zA-Z]+` | `calcolatore-in-rete.link`, `utile-contenitore-docker.link`, `veloce-script.sh`

Non sono ammessi:
1. collegamenti pubblicitari o che puntano a risorse esterne non gratuite;
1. programmi in formato binario;
1. contenuti duplicati;
1. risorse non rilevanti per l'insegnamento in questione.
