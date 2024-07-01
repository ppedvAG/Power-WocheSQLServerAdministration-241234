/*


SETUP


Instanzfunktionen


Pfade für DB

Dateien einer Datenbank:
Daten   .mdf (master data file)
Logfile .ldf (log data file)
eigene Pfade für Daten und Logfile --> Trenne Daten von Logfile (eig Laufwerke)

Pfad für Backup:
defintiv einen, auf dem keine DB Dateien liegen

tempDB
- #t
- Zeilenversionierung
- IX Wartung
- Cursor
- Auslagerung
- Sortieren

Eigene Laufwerke für die Ldf und mdf der Tempdb

Pfad für Installation
c:\Program Files


Security

Windows Auth

oder 

gemischte Auth
Windows + SQL Logins
Wenn gemischter Modus , dann auch SA aktiv, wen jeder kennt (dangerzone)


Dienste und deren Konten

SQL Server (Datenbankmodul)
SQL Agent  (Jobs)
SQL Browser teilt dem Client mit auf welchem Port ist die benannten Instanz zu finden
braucht Port UDP 1434

SQL Volltextsuche ()

where name like 'maier'  (mayr, meirer, meir)

select soundex ('Meyr'), soundex ('Mayer')


SQL kann mehrfach installiert 

Aufruf  (Server XY)

XY Port 1433  Std Instanz
XY\FE  Port random  (42127)



SQL Express 0 Euro

Kein Zugriff darauf

Servername\SQLExpress
Browserdienst aktiv? (default deaktiviert)
Firewall UPD 1434
Port der beannten Instanz auch in der Firewall offen

Dienstkonto
NT Service\MSSQLSERVER
NT Service sind reine lokale Konten (kein Netzwerkzugriff), ändern Kennwwörter automatisch
viele verwenden Domänenkonten



MAXDOP 

Arbeitspeicher  4 Kern .. 16 GB
4 GB für OS

HV-DC    1024 - 2048						2 Kerne
HV-SQL1  5000 fix (nicht dynamisch)         4 Kerne
HV-SQL2  4500 (nicht dynamisch)             4 Kerne

gilt für HV-DC, HV-SQL1 und HV-SQL2

schulung\Administrator
ppedv2023!


/*


 Volumewartungstask = reine Windows Sicherheitseinstellung


jede Vergrößerung verbraucht eigtl die doppelte Schreibarbeit
da Windows zuerst die Dateien vergrößert und mit 0 beschreibt
eigtl ein Sicherheitsfeature: Lokaler Sicherheitsrichtlinien.. Zuweisen von Benutzerrechten
----------------------
0101010110101111111111
----------------------

aktiviert man den Datenvol..wa..task... dann kann SQL Server eigenständig vergrößeren
ohne vorher ausnullen-- schneller,

-->IO reduzieren! Aber einem guten Admin ist das wurst! ;-) Siehe DB Settings


Frage nach Verzeichnissen  :
Trenne Log von Daten physikalisch (HDDs) !!
Wirklich ideal 

MAXDOP = Anzahl der log Prozessoren (max 8)
-->eigenes Kapitel

TempDB
#tabellen, Zeilenversionierung
IX Wartung, Auslagerungen beim Sortieren etwa

Trenne Daten von Log und am besten eig HDDs

Aber auch : 
Anzahl der DAtendateien = Anzahl der Kerne  max 8 
Traceflags 1117 + 1118


Soviele Dateien wie Kerne, aber max 8
Mehrere Tabellen könne im gleiche Block liegen, aber nur ein Thread darf zugreifen

-T1117 Uniform Extents... kein gleichzeitiger Zugriff mehr auf denselben Block, da jede Tabelle einen eig block belegt
-T1118 immer gleich große Dateien.. greife nie in den Mechanismus ein, der wird sonst ausser Kraft gesetzt


--Arbeitspeicher. 
Setup schlägt für SQL einen max Speicher vor, um im worst Case nicht den gesamten RAM zu belegen
--DAS OS braucht auch Luft zum atmen... das Setup berücksichtigt die Umgebung (OS)
--Sharepoint: Wenn auf dem Server 95% Speicherauslastung, dann stellt SP Dienste
--Begrenze den SQL Server immer im Bereich MAX RAM... (OS)


--MAX Speicher immer einstellen
--MIN Speicher nur bei Konkurrrenz (weiterer Instanz) sinnvoll
-- der mind RAM Wert wird erst belegt, wenn SQL Daten entsprechend abgelegt hat.

--AUFGABEN

--Findest du die Werte aus dem Setup im SQL Server wieder?
--MAXDOP = 4
--im Setup MAXDOP 8

--tempdb 4 dateien
--Das Setup hätte 8 angelegt

--VM hat 2 CPUs und hat 4 GB RAM

--wenn man nachträglich die VM anpasst, dann sollten eben auch die Werte im SQL angepasst
--werden


hv-sql1 -- Standardinstanz (1433)
schulung\Administrator
ppedv2023!

ca 6 GB
4 Kerne
C:\


MAXDOP: 4
RAM: MAX 3,8 GB
Tempdb: Datendateien 4
MDF und ldf.. getrennt
Backup anderer Ort

Auth



*/

