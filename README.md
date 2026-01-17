# DevOps

### Hello 002

Bu benim ilk DevOps projemdir.

---

### Docker'a terminalden login olmak için

``` 
docker login  -u KULLANICI_ADI    -p  PAROLA  
```

---

### CLI

```
KonuştuğumYer   emir        araç        :     sürüm
---------------------------------------------------------------------
docker          pull        nginx       :     stable-alpine3.23-perl
docker          pull        nginx       :     latest
docker          pull        nginx


docker          push	    kullaniciadi/nginx    :   sürümno


docker 	        run 	    -it        -d       -p  9998:80      --name mydemo2       nginx:alpine

docker          login        -p  123456789    -u kullaniciadi

docker          ps
```


---
```
yağ + domates + tuz + soğan + patates + su + salça + ateş + kibrit + tencere + bıçak + kaşık + kapak + tabak = yemek v1.0

algoritma    
malzemeleri alınacak
ocağa kontrol
tencereyi ocağın üstüne koy
bıçak kontrol et
bıçağı al
domatesi doğra
```
---

###  Docker  Image


### ============= Kendi projemizi Docker image haline çevimek =============


### Maven

#### Version 1
```
docker   build     --build-arg   JAR_FILE=target/devops_001_hello-1.0.0.jar       --tag  mimaraslan/devops_001_hello:v001     .
```


#### Version 2
```
docker   build     --build-arg   JAR_FILE=target/devops_001_hello-1.0.2.jar       --tag  mimaraslan/devops_001_hello:v002     .
```


#### Version 3
```
docker buildx  build     --build-arg   JAR_FILE=target/devops_001_hello-1.0.3.jar       --tag  mimaraslan/devops_001_hello:v003     .
```

#### Eğer en son version her ne ise onun için mutlaka latest sürümü de çıkartılmalı.
```
docker buildx  build     --build-arg   JAR_FILE=target/devops_001_hello-1.0.3.jar       --tag  mimaraslan/devops_001_hello:latest     .
```

---

### ============= kendi projemizi Docker image'den container haline çevimek =============

```
docker  run  -it  -d   -p  9091:8080     --name my-app1     mimaraslan/devops_001_hello:v001
```


http://localhost:9091

```
docker  run  -it  -d   -p  9092:8080     --name my-app2     mimaraslan/devops_001_hello:v002
```

http://localhost:9092


```
docker  run  -it  -d   -p  9093:8080     --name my-app3     mimaraslan/devops_001_hello:v003
```

http://localhost:9093

---

### ============= Docker Hub'a image göndermek =============

```
docker push mimaraslan/devops_001_hello:v001
```

```
docker push mimaraslan/devops_001_hello:v002
```

```
docker push mimaraslan/devops_001_hello:v003
```

---

### ============= Docker Hub'dan image çekmek =============

```
docker pull mimaraslan/devops_001_hello:v001
```

```
docker pull mimaraslan/devops_001_hello:v002
```

```
docker pull mimaraslan/devops_001_hello:v003
```


---

## Gradle

### Build v1
```
docker build     --build-arg   JAR_FILE=build/libs/devops_002_hello-1.0.0.jar       --tag  mimaraslan/devops_002_hello:v001     .
```

### Build v2
```
docker build     --build-arg   JAR_FILE=build/libs/devops_002_hello-1.0.2.jar       --tag  mimaraslan/devops_002_hello:v002     .
```

### Build v3
```
docker build     --build-arg   JAR_FILE=build/libs/devops_002_hello-1.0.3.jar       --tag  mimaraslan/devops_002_hello:v003     .
```


#### Eğer en son version her ne ise onun için mutlaka latest sürümü de çıkartılmalı.
```
docker build     --build-arg   JAR_FILE=build/libs/devops_002_hello-1.0.2.jar       --tag  mimaraslan/devops_002_hello:latest     .
```

---

### ============= Docker Hub'a image göndermek =============

```
docker push mimaraslan/devops_002_hello:v001
```

```
docker push mimaraslan/devops_002_hello:v002
```

```
docker push mimaraslan/devops_002_hello:v003
```

```
docker push mimaraslan/devops_002_hello:latest
```

---

### ============= Docker Hub'dan image çekmek =============

```
docker pull mimaraslan/devops_002_hello:v001
```

```
docker pull mimaraslan/devops_002_hello:v002
```

```
docker pull mimaraslan/devops_002_hello:v003
```

```
docker pull mimaraslan/devops_002_hello
```


---

### Network
Sistemler uygulamalardan meydana gelir. 
Apps (uygulamalar) aralarında da bağ vardır.

---

```
docker network ls
```

```
docker network create --help
```

```
docker network create -d bridge    my-network
```

```
docker network create --driver  bridge   my-network
```

Network bilgisi

```
docker network inspect  my-network
```


---

Bu networkü kim kullanacak?

---

Çalışan bir container'ın network'e bağlanması kullanması lazım.

Image1 ---> run ---> Container1   (Kalp)
Image2 ---> run ---> Container2   (Beyin)
Image3 ---> run ---> Container3   (Akciğer)


Bunların bir arada çalışmasını
Container1   +  Container2  +  Container3


```
docker network --help
```


### Network'e eklediğim uygulamalar

```
docker network connect  my-network    my-app-1
```

```
docker network connect  my-network    my-app-2
```

```
docker network connect  my-network    my-app-3
```


### Network'ten bir uygulamayı çıkarma

```
docker network  disconnect  my-network    my-app-1
```

### Network silme komutu
```
docker network  rm    my-network
```
---


### Volume  (kayıt alanı, ayar dosyaları)

Volumleri listele
```
docker volume ls
```

Volume oluştur
```
docker  volume  create   my-volume
```

Volume bilgisini almak
```
docker volume inspect  my-volume
```

```
docker volume rm
```

ÖDEV: my-volume ile my-app1'i bağlayın.
Gordon Ai o kısımdan öğrenebilirsiniz.



Bu kullanılmayınları
```
docker volume prune
```


Zorla silmek istiyorsak

```
docker volume prune  --all  
```




Sadece istediğim bir volume silmek
```
docker volume rm  my-volume2
```

Sadece istediğim birden fazla volume silmek
```
docker  volume  rm   my-volume1 my-volume2 my-volume3
```


---

### docker compose

```
docker compose version
```

### Seçilen Docker File dosyasını çalıştır.
```
docker compose  -f  compose.yaml  up
```
```
docker compose  --file  compose.yaml  up
```

###  Seçilen Docker File dosyasını durdur.
```
docker compose  -f  compose.yaml  down
```

```
docker compose  --file  compose.yaml  down
```




### ======= KUBERNETES (K8s) =========

#### Kurulum
https://minikube.sigs.k8s.io/


Windows
```
winget install Kubernetes.minikube
```


MacOS
```
brew install minikube
```

---

Bir terminal aç. 
Minikube çalıştır ve bu terminali çalışman bitinceye kapatma!

```
minikube start
```

İşin bitince minikube aracını durudur.

```
minikube stop
```

---

yeni bir terminal aç
#### dashboard ile arayüz üzerinden Kubernets'in içini yönetebilirim.




---



### ==== K8s ====


Kubernetes ile iletişim kuracağım aracın adı
```
kubectl version
```

Yardım komutu
```
kubectl   get    --help
```


Sistemdeki kaynakların isimlerindeki kısatlmalar
```
kubectl api-resources
```


### ==== Pod ====


Pod oluşturması için
```
kubectl  run  my-pod1  --image=mimaraslan/devops_002_hello:v002
```

Image'den pod yapmak
```
kubectl run nginx --image=nginx
```


Podların listesini bize verir.
```
kubectl get pods
kubectl get pod
kubectl get po
```


Podların bize detayını verir.
```
kubectl get pods  -o wide
```

Nodeları listeler
```
kubectl get nodes
kubectl get node
kubectl get no
```

Nodeların detayını verir.
```
kubectl get nodes  -o wide
```


---
### Yaml ile Pod oluşturmak
```
kubectl  apply  -f   _01_my_pod_create.yaml
```

```
kubectl  delete  -f   _01_my_pod_create.yaml
```





---




### ==== Deployment ====

