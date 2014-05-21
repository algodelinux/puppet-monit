puppet-monit
============

Módulo puppet que instala el servicio monit en los servidores de aula para monitorizar y controlar los siguientes servicios:

* isc-dhcp-server
* inetd
* ntpd
* apache2
* rsyslogd
* sshd
* nslcd
* nscd
* crond
* autofs

Por otra parte, monitorizamos la temperatura de la CPU, placa base y disco duro.

Monit tratará de reiniciar servicios si hay algún problema y en caso de que no sea posible, nos informará 
por e-mail.

Almacenamos la configuración para monitorizar los servicios comunes en /etc/monit/monitrc 
y configuraciones que vayan a aplicarse tan sólo a algunos servidores en archivos dentro del directorio
/etc/monit/monit.d/

Por ejemplo, el servicio freeradius tan sólo se encuentra instalado en algunas máquinas. Así que 
almaceno su configuración en un archivo /etc/monit/monit.d/freeradius.


Creado por:

Esteban M. Navas Martín  
Administrador informático  
IES Valle del Jerte  
Plasencia  
11-Abril-2014  
