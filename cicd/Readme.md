# Continuous integration 
***
Proyecto en el cual se encuentran lo necesaria para integracion continua del proyecto para la creacion de articulos de investigacion.  
## Volumenes
***
Es necesario ejecutar el siguiente comando, esto con el fin de crear los volumenes necesarios para su funcionamiento.  

```bash
mkdir -p /volumenes/vol_gitlab \ 
        /volumenes/vol_gitlab/config  /volumenes/vol_gitlab/logs /volumenes/vol_gitlab/data \
        /volumenes/vol_jenkins \
        /volumenes/vol_registry
```
  
/volumenes/vol_gitlab  
/volumenes/vol_gitlab/config  
/volumenes/vol_gitlab/logs  
/volumenes/vol_gitlab/data
  
/volumenes/vol_jenkins  

### Gitlab
***
La forma de adicionar un repositorio al repositorio local es la siguiente.  

- Adicionamos el repositorio remoto.  
```bash
git remote add <nombre-repositorio-remoto> <url-repositorio-remoto> 
```
- Hacemos push al repositorio añadido 
```
git push <nombre-repositorio-remoto> <branch>
```
gitlab-rake gitlab:storage:rollback_to_legacy ID_FROM=1 ID_TO=50
