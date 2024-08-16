# https-spacelift.io-blog-terraform-proxmox-provider
Este repositorio automatiza el despliegue de VMs en un clúster Proxmox usando Terraform y plantillas Cloud-Init. Simplifica la configuración de red, almacenamiento y claves SSH, facilitando la creación y gestión de múltiples VMs de forma declarativa y eficiente. Ideal para administrar infraestructuras virtuales.
Este repositorio contiene un ejemplo de cómo desplegar máquinas virtuales en Proxmox utilizando Terraform. La configuración está basada en el uso de plantillas del tipo **Cloud-Init**, lo que permite una mayor flexibilidad en la inicialización de las VMs.

## Requisitos
- Proxmox VE con API habilitada.
- Terraform instalado (puede estar en tu máquina local o en un servidor con acceso a Proxmox).
- Plantilla Cloud-Init en Proxmox (ver enlaces abajo para su creación).

## Instrucciones

1. Clona este repositorio en tu máquina local:
   ```bash
   git clone https://github.com/lizzijuliet/https-spacelift.io-blog-terraform-proxmox-provider.git
   cd https-spacelift.io-blog-terraform-proxmox-provider

2. Configura las variables necesarias en el archivo vars.tf. Puedes modificar los valores predeterminados para adaptarlos a tu entorno

3. Ejecuta los siguientes comandos para desplegar las VMs:
   ```bash
   terraform init
   terraform plan
   terraform apply

Terraform procederá a desplegar las máquinas virtuales en el clúster Proxmox de acuerdo a la configuración especificada.

## Importante: Crear Plantilla Cloud-Init

Es necesario que la plantilla utilizada para clonar las VMs sea del tipo Cloud-Init. Puedes seguir uno de los siguientes enlaces para aprender a crear una plantilla Cloud-Init en Proxmox:

Creación de una plantilla Cloud-Init en Proxmox - Medium
Guía paso a paso: Crear una imagen Cloud-Init lista para usar en Proxmox

## Generación de Tokens de API en Proxmox

Para poder interactuar con Proxmox desde Terraform, necesitarás un token de API. Consulta este artículo para aprender a generar un token y configurar las credenciales en Terraform:

Generación de token en Proxmox para uso con Terraform

## Variables Clave

## Variables Clave

- `api_url`: URL de la API de Proxmox.
- `token_id`: ID del token para autenticar la API de Proxmox.
- `token_secret`: Secreto del token para autenticar la API.
- `proxmox_host`: Nodo de Proxmox donde se desplegará la VM.
- `ssh_key`: Clave pública SSH para acceder a las VMs.
- `template_ubuntu`: Nombre de la plantilla Cloud-Init que se utilizará para clonar las VMs.


## Recursos de Terraform

El recurso principal en este repositorio es proxmox_vm_qemu, utilizado para crear VMs en Proxmox basadas en una plantilla Cloud-Init. Este recurso permite configurar parámetros como CPU, memoria, almacenamiento y red, asegurando una inicialización adecuada de las VMs.

## Recursos útiles

- [Creación de una plantilla Cloud-Init en Proxmox - Medium](https://medium.com/@aj.abdelwahed/proxmox-creating-a-cloud-init-template-in-proxmox-55d1d1570e12)
- [Guía paso a paso: Crear una imagen Cloud-Init lista para usar en Proxmox](https://akashrajvanshi.medium.com/step-by-step-guide-creating-a-ready-to-use-ubuntu-cloud-image-on-proxmox-03d057f04fb2)
- [Generación de token en Proxmox para uso con Terraform](https://spacelift.io/blog/terraform-proxmox-provider)

## Nota
No es necesario tener Proxmox instalado localmente. Puedes utilizar Visual Studio Code con el plugin de Terraform para ejecutar el código, siempre y cuando el sistema desde donde ejecutes Terraform tenga acceso a la red donde se encuentra el clúster Proxmox.

## Extensión de Terraform para Visual Studio Code

Para una mejor experiencia al trabajar con Terraform en Visual Studio Code, puedes usar la siguiente extensión:

- **Nombre:** Terraform
- **ID:** 4ops.terraform
- **Descripción:** Soporte para el lenguaje de configuración Terraform (incluye Terragrunt)
- **Versión:** 0.2.5
- **Editor:** Anton Kulikov
- **Enlace en VS Marketplace:** [Terraform Extension](https://marketplace.visualstudio.com/items?itemName=4ops.terraform)
