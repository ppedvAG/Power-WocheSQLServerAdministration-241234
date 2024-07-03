--Audit = Überwachung

--1. Audit Datei aktivieren --> Sicherheit
--2. Serverüberwachung --> Aktion auswählen und Auditdatei aus 1. angeben
--3. DB Überwachung --> Auditdatei angeben--> Aktion auswählen

--Leider klappt das Anzeigen im SSMS aktuell nicht
--aber mit dem hier schon.. Filter mit where

select * from sys.fn_get_audit_file 
	('c:\_SQLdata\Securityaudit2_3CE2F6F5-013C-4768-ACA9-44F737BD209A_0_133644722507190000.sqlaudit', default, default) 

where server_principal_name ='EVa'