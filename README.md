# liferay-test-portlet

- Gradle Version Required | 5.6.4
- JVM                     | 1.8.0_292 (AdoptOpenJDK 25.292-b10)


## Build

gradle build

## Deploy

Copy build/libs/*.jar to liferay server deploy folder

## Set developer setting in portal-*.properties

```
theme.css.fast.load=false
layout.template.cache.enabled=false
freemarker.engine.resource.modification.check.interval=0
minifier.enabled=false  
```

## Adding to JIRA: INTRANET


## Possiblities

Input, with badges.
    On input check for tab button press
        take input value, split on comma and add tags into input
