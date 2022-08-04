# Flutter Flavors
Flavors are just comfortable. They let you define some build configuration and switch them as you want. For example you could have one flavor for development, and one for production. You can set different url for api calls or different icons and app names. With a click you’re ready to develop or to release your great application.

We use a lot flavor configurations, not only for comfort, but also to be sure to deploy the right version of the app.
This project contains 3 flavors:

- development
- staging
- production

To run the desired flavor either use the launch configuration in VSCode/Android Studio or use the following commands:

```sh
# Development
$ flutter run --flavor development --target lib/main_development.dart
$ flutter build ios --no-codesign --flavor development --target lib/main_development.dart

# Staging
$ flutter run --flavor staging --target lib/main_staging.dart

# Production
$ flutter run --flavor production --target lib/main_production.dart
$ flutter build ios --no-codesign --flavor production --target lib/main_production.dart
```

---

## Creating Flavors
    


#### 1. Regarding android the productFlavors are defined in the app gradle module.

Add  flavors in the app level build.gradle in android

```
├──android
│   ├── app
│   │   ├── build.gradle
```
![](https://miro.medium.com/max/1050/1*xYW0XiHlE0-18zndn_e0Mg.png)
As you can see is pretty straightforward and you can set different application id suffixes.
Note that flavor names have to be the same as the cli flutter command.

Now for example you can add icons based on flavor type.

#### 2. Create separate main files for all flavors in lib/
```
├──lib
│   ├── main_development.dart
│   ├── main_staging.dart
│   ├── main_production.dart

```

#### 3. Set run configurations
Create a directory in .idea folder "runConfigurations" and add xml files like the following

![Image](https://i.im.ge/2022/07/06/u9H5Zc.png)
**DEV**
```xml
<component name="ProjectRunConfigurationManager">
  <configuration default="false" name="development" type="FlutterRunConfigurationType" factoryName="Flutter">
    <option name="buildFlavor" value="development" />
    <option name="filePath" value="$PROJECT_DIR$/lib/main_development.dart" />
    <method v="2" />
  </configuration>
</com
```
**PROD**
```xml
<component name="ProjectRunConfigurationManager">
  <configuration default="false" name="production" type="FlutterRunConfigurationType" factoryName="Flutter">
    <option name="buildFlavor" value="production" />
    <option name="filePath" value="$PROJECT_DIR$/lib/main_production.dart" />
    <method v="2" />
  </configuration>
</component>
```
**STAG**
```xml
<component name="ProjectRunConfigurationManager">
  <configuration default="false" name="staging" type="FlutterRunConfigurationType" factoryName="Flutter">
    <option name="buildFlavor" value="staging" />
    <option name="filePath" value="$PROJECT_DIR$/lib/main_staging.dart" />
    <method v="2" />
  </configuration>
</component>
```

#### Now you can select entrypoints from Android Studio

![](https://i.im.ge/2022/07/06/u9HR7h.png)