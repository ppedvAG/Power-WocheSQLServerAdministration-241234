select * from [bigben\hr].db.schema.tabelle
openrowset

SELECT d.* FROM OPENROWSET(
    'SQLNCLI',
    'Server=Seattle1;Trusted_Connection=yes;',
    AdventureWorks2022.HumanResources.Department
) AS d;