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


```
docker push mimaraslan/devops_002_hello:v001
```

```
docker push mimaraslan/devops_002_hello:v002
```

```
docker push mimaraslan/devops_002_hello:v003
```
 