<div style="text-align:center;">

# 15. Házi feladat - Jenkins
Creadted by NT
</div>


Ebben a házi feladatban egy olyan Jenkins pipeline megírása volt a feladat, ami egy publikus GIT repóból letölt egy telepítőszrkiptet, majd a Jenkins slave node-on végrehajt egy webszerver telepítést, készít egy file-t a telepítés időpontjáról, majd a telepítési idővel ellátott TXT fájlt artifactként elmenti. 

#### apache_install.sh ismertetése:

A parancsok többéségnél szereplő **sudo** utasítás szükséges ahhoz, hogy specifikus parancsokat tudjunk futtatni root jogosultságokkal.  

Ebben a bash scriptben először a **yum update** paranccsal frissítjük a yum repositoryt, majd a **yum install httpd -y**-vel pedig telepítésre kerül az Apache webszerver. A "-y" kapcsoló azért szükséges, mert nélküle interakciót várna el futás közben, amire a jelenlegi automatizált eljárás alkalmával nem lenne lehetőségünk.

A **systemctl status httpd**-paranccsal a szolgáltatás állapotát kérdezzük le, így megbizonyosodhatunk arról, hogy a telepítés sikeres volt-e, valamint fut-e éppen a szolgáltatás. 

A **current date** változóval meghatározzuk a dátum formátumát, amit a következő parancsban felhasználunk a telepítés időpontját tartalmazó **apache_install_date.txt**-nél.

A scriptben fellelhető dupla **echo** és **sleep 2** parancsok a készítő nem túl kifinomult izlésvilágát hivatott tükrözni. Ezek a parancsok üres sorokat (echo - vélhető szeparációs szándék) és 2 másodperces késleltetéseket (sleep 2 - user olvasási sebesség kielégítés) használ a felhasználó számára.


#### Jenkinsfile ismertetése

A Jenkins pipeline-ban meghatározásra kerül a feladat elvégzésére kijelölt **node** (slave). Az első stage-en letöltésre kerül a **GITHUB repositoryban** tárolt bash script. A következőben először futtatási joggal (chmod +x) látjuk el, majd futtatjuk az **apache_install.sh**-t.

A **post** blokkban pedig a pipeline elmenti az apache_install_date.txt-t, mint artifact. 













