# demo-autoscaling-scl-meetup
Demo realizada para Meetup AWS #1 en Santiago de Chile

La idea de este proyecto es mostrar como usar escalabilidad de instancias EC2 en
AWS con metricas personalizadas, para esto este proyecto presenta una aplicación
que corre dentro de una instancia EC2 que consume mensajes de una cola SQS
como parte de un grupo de autoescalado el que crece o descrece usando politicas
de autoescalado que dependen de una metrica personalizada que es generada por una
funcion Lambda-

## pre-requistos:
* Cuenta AWS creada
* [aws cli instalado](http://docs.aws.amazon.com/cli/latest/userguide/installing.html)
* Creados en AWS cola de Mensajes con nombre DEMO_INPUT en servicio SQS
* Terraform instalado en tu equipo, [guia de instalación](https://www.terraform.io/intro/getting-started/install.html)

##Instalacion de la Demo

Para instalar realizar los siguientes pasos
1. Descargar proyecto desde Git-Hub
2. [Usando aws cli crear un profile](http://docs.aws.amazon.com/cli/latest/userguide/cli-chap-getting-started.html) con las credenciales de tu cuenta con el nombre demoprofile
2. Ejecutar Terrafom plan desde el directorio del proyecto para ver que intenta crear terraform
3. Ejecutar Terraform apply para crear infraestrcutura

##Probar la demo
