
# Boost your flutter development with templates

Android studio make it really easy for us to create a new activity or fragments with the pre defined file templates. Sadly, This is not the case for flutter, you need to create the file then again inside the file you will write everything yourself or use the live code templets.


## Let's start

To create a new file template Right click on any folder > New > Edit file templates.

![](https://miro.medium.com/max/818/1*AJx-VvEpz_M6-2i-WFzFQg.png)
Then click `Add`, enter the name of the template and the file extension which is `.dart`.

Now add one of the following templates in the code area.

## Stateless

```
import 'package:flutter/material.dart';
#set( $items = $NAME.split("_") )
#set( $class = "" )
#set( $item = "" )
#foreach($item in $items)
   #set( $class = $class + $item.substring(0,1).toUpperCase() + $item.substring(1).toLowerCase() )
#end
class ${class} extends StatelessWidget {
  ${class}({Key key}) : super(key: key);
@override
  Widget build(BuildContext context) {
    return Container(color: Colors.blue);
  }
}
```

## StatefulWidget
```
import 'package:flutter/material.dart';
#set( $items = $NAME.split("_") )
#set( $class = "" )
#set( $item = "" )
#foreach($item in $items)
   #set( $class = $class + $item.substring(0,1).toUpperCase() + $item.substring(1).toLowerCase() )
#end
class ${class} extends StatefulWidget {
  ${class}({Key key}) : super(key: key);
@override
  _${class}State createState() => _${class}State();
}
class _${class}State extends State<${class}> {
  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.blue);
  }
}
```

## Mixin

```
#set( $items = $NAME.split("_") )
#set( $class = "" )
#set( $item = "" )
#foreach($item in $items)
   #set( $class = $class + $item.substring(0,1).toUpperCase() + $item.substring(1).toLowerCase() )
#end
mixin ${class} {
}
```

## Extension

```
#set( $items = $NAME.split("_") )
#set( $class = "" )
#set( $item = "" )
#foreach($item in $items)
   #set( $class = $class + $item.substring(0,1).toUpperCase() + $item.substring(1).toLowerCase() )
#end
extension ${class} on ${on} {
}
```
![](https://miro.medium.com/max/875/1*1dlzKTSrzq87yahyC9WYOA.png)
The language used to create the template is [Velocity Template Language](http://velocity.apache.org/).

#### Example
`#set( $MyName = "XYZ")` it create a new variable.

`#foreach($item in $items) #end` it's like any other `foreach` used in other languages it iterate over the `items`.

`$NAME` it's a predefined variable contain the file name. To get the list of the predefined variables you can [visit this link](https://www.jetbrains.com/help/idea/file-template-variables.html#custom_template_variables).

## Usage

Click on any folder then > New > Select the templet you want to use.

![](https://miro.medium.com/max/824/1*i4BNk4utuJx1L_SpbJkiHw.png)
It will ask you to enter the name of the file. the name of the file should be in [snake case](https://dart.dev/guides/language/effective-dart/style#do-name-libraries-and-source-files-using-lowercase_with_underscores) `file_name_something`.

## Bonus

If noticed above there is a duplication in all the templates, which is this part:

```
#set( $items = $NAME.split("_") )
#set( $class = "" )
#set( $item = "" )
#foreach($item in $items)
   #set( $class = $class + $item.substring(0,1).toUpperCase() + $item.substring(1).toLowerCase() )
#end
```

Now to solve this issue you can create one include template that has this code then include it to another template using `parse` .


`#parse("include_template_name.extension")`

![](https://miro.medium.com/max/875/1*ipa7KbCiq186Xc8Ec7JYjA.png)

So if we change the Stateful widget templet to include the name part it will be like this:

```
import 'package:flutter/material.dart';
#parse("FileNameMaker.dart")
class ${class} extends StatefulWidget {
  ${class}({Key key}) : super(key: key);
@override
  _${class}State createState() => _${class}State();
}
class _${class}State extends State<${class}> {
  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.blue);
  }
}
```

---
