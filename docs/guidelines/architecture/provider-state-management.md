# Provider

[Provider](https://pub.dev/packages/provider) is a package written in 2018 by [Remi Rousselet](https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=1&cad=rja&uact=8&ved=2ahUKEwjXrMKO8dLjAhWoT98KHUCDB_oQFjAAegQIARAB&url=https%3A%2F%2Ftwitter.com%2Fremi_rousselet&usg=AOvVaw3bEIgT0j4c_5xbq-YWB70q) that is similar to [ScopedModel](https://pub.dev/packages/scoped_model) but is not limited to exposing a [Model](https://pub.dev/documentation/scoped_model/latest/scoped_model/Model-class.html) subclass. It too is a wrapper around [InheritedWidget](https://api.flutter.dev/flutter/widgets/InheritedWidget-class.html), but can expose any kind of state object, including BLoC, [streams](http://dart%20stream%20listen/), [futures](https://api.dartlang.org/stable/dart-async/Future-class.html), and others. Because of its simplicity and flexibility, Google announced at [Google I/O](https://www.youtube.com/watch?v=d_m5csmrf7I) ’19 that [Provider](https://pub.dev/packages/provider) is now its preferred package for state management. Of course, you can still use [others](https://flutter.dev/docs/development/data-and-backend/state-mgmt/options), but if you’re not sure what to use, Google recommends going with [Provider](https://pub.dev/packages/provider).

[Provider](https://pub.dev/packages/provider) is built “with widgets, for widgets.” With [Provider](https://pub.dev/packages/provider), we can place any state object into the widget tree and make it accessible from any other (descendant) widget. [Provider](https://pub.dev/packages/provider) also helps manage the lifetime of state objects by initializing them with data and cleaning up after them when they are removed from the widget tree. For this reason, [Provider](https://pub.dev/packages/provider) can even be used to implement BLoC components, or serve as the basis for [other](https://flutter.dev/docs/development/data-and-backend/state-mgmt/options) state management solutions! 😲 Or it can be used simply for [dependency injection](https://en.wikipedia.org/wiki/Dependency_injection) — a fancy term for passing data into widgets in a way that reduces coupling and increases testability. Finally, [Provider](https://pub.dev/packages/provider) comes with a set of specialized classes that make it even more user-friendly. We’ll explore each of these in detail.

- [BasicProvider](https://pub.dev/documentation/provider/latest/provider/Provider-class.html)
- [ChangeNotifierProvider](https://pub.dev/documentation/provider/latest/provider/ChangeNotifierProvider-class.html)
- [StreamProvider](https://pub.dev/documentation/provider/latest/provider/StreamProvider-class.html)
- [FutureProvider](https://pub.dev/documentation/provider/latest/provider/FutureProvider-class.html)
- [ValueListenableProvider](http://valuelistenableprovider/)
- [MultiProvider](https://pub.dev/documentation/provider/latest/provider/MultiProvider-class.html)
- [ProxyProvider](https://pub.dev/documentation/provider/latest/provider/ProxyProvider-class.html)

## **Installing**

First, to use [Provider](https://pub.dev/packages/provider), add the dependency to your pubspec.yaml:

[https://tenor.com/view/ionos-warten-waiting-gif-18098039">Ionos](https://tenor.com/view/ionos-warten-waiting-gif-18098039">Ionos)

```
provider: latest_provider
```

Then import the [Provider](https://pub.dev/packages/provider) package where needed:

```
import 'package:provider/provider.dart';
```

## **Basic Provider**

Let’s create a basic [Provider](https://pub.dev/packages/provider) at the root of our app containing an instance of our model:

```dart
Provider<MyModel>(
  builder: (context) => MyModel(),
  child: MyApp(...),
)
```

> Note the different syntax for accessing our MyModel instance. This is functionally equivalent to using the Consumer widget. The Consumer widget is useful if you can’t easily get a BuildContext reference in your code.
> 

What do you expect will happen to the original `MyWidget` we created earlier? Do you think it will now display the new value of `bar`? **Unfortunately, no**. It is not possible to listen to changes on plain old Dart objects (at least not without [reflection](https://api.dartlang.org/stable/dart-mirrors/dart-mirrors-library.html), which is not available in Flutter). That means [Provider](https://pub.dev/packages/provider) is not able to “see” that we updated the `foo` property and tell `MyWidget` to update in response.

## **ChangeNotifierProvider**

However, there is hope! We can make our `MyModel` class implement the [ChangeNotifier](https://api.flutter.dev/flutter/foundation/ChangeNotifier-class.html) mixin. We need to modify our model implementation slightly by invoking a special `notifyListeners()` method whenever one of our properties change. This is similar to how [ScopedModel](https://pub.dev/packages/scoped_model) works, but it’s nice that we don’t need to inherit from a particular model class. We can just implement the [ChangeNotifier](https://api.flutter.dev/flutter/foundation/ChangeNotifier-%E2%80%A6) mixin. Here’s what that looks like:

```dart
class MyModel with ChangeNotifier {
  String _foo;  String get foo => _foo;

  void set foo(String value) {
    _foo = value;
    notifyListeners();
  }
}
```

As you can see, we changed our `foo` property into a `getter` and `setter` backed by a private `_foo` variable. This allows us to “intercept” any changes made to the `foo` property and tell our listeners that our object changed.

Now, on the [Provider](https://pub.dev/packages/provider) side, we can change our implementation to use a different class called [ChangeNotifierProvider](https://pub.dev/documentation/provider/latest/provider/ChangeNotifierProvider-class.html):

```dart
ChangeNotifierProvider<MyModel>(
  builder: (context) => MyModel(),
  child: MyApp(...),
)
```

That’s it! Now when our `OtherWidget` updates the `foo` property on our `MyModel` instance, `MyWidget` will automatically update to reflect that change. Cool huh?

One more thing. You may have noticed in the `OtherWidget` button handler that we used the following syntax:

```dart
final model = Provider.of<MyModel>(context);
```

**By default, this syntax will automatically cause our `OtherWidget` instance to rebuild whenever `MyModel` changes.** That might not be what we want. After all, `OtherWidget` just contains a button that doesn’t change based on the value of `MyModel` at all. To avoid this, we can use the following syntax to access our model *without* registering for a rebuild:

```dart
final model = Provider.of<MyModel>(context, listen: false);
```

This is another nicety that the [Provider](https://pub.dev/packages/provider) package gives us for free.

## **StreamProvider**

At first glance, the [StreamProvider](https://pub.dev/documentation/provider/latest/provider/StreamProvider-class.html) seems unnecessary. After all, we can just use a regular [StreamBuilder](https://api.flutter.dev/flutter/widgets/StreamBuilder-class.html) to consume a stream in Flutter. For example, here we listen to the [onAuthStateChanged](https://pub.dev/documentation/firebase_auth/latest/firebase_auth/FirebaseAuth/onAuthStateChanged.html) stream provided by [FirebaseAuth](https://pub.dev/documentation/firebase_auth/latest/firebase_auth/firebase_auth-library.html):

```dart
@override
Widget build(BuildContext context {
  return StreamBuilder(
   stream: FirebaseAuth.instance.onAuthStateChanged,
   builder: (BuildContext context, AsyncSnapshot snapshot){
     ...
   });
}
```

To do this with [Provider](https://pub.dev/packages/provider) instead, we can expose this stream via a [StreamProvider](https://pub.dev/documentation/provider/latest/provider/StreamProvider-class.html) at the root of our app:

```dart
StreamProvider<FirebaseUser>.value(
  stream: FirebaseAuth.instance.onAuthStateChanged,
  child: MyApp(...),
}
```

Then consume it in a child widget like any other [Provider](https://pub.dev/packages/provider):

```dart
@override
Widget build(BuildContext context) {
  return Consumer<FirebaseUser>(
    builder: (context, value, child) => Text(value.displayName),
  );
}
```

Besides making the consuming widget code much cleaner, **it also abstracts away the fact that the data is coming from a stream**. If we ever decide to change the underlying implementation to a [FutureProvider](https://pub.dev/documentation/provider/latest/provider/FutureProvider-class.html), for instance, it will require no changes to our widget code. *In fact, you’ll see that this is the case for all of the different providers below*. 😲

## **FutureProvider**

Similar to the example above, [FutureProvider](https://pub.dev/documentation/provider/latest/provider/FutureProvider-class.html) is an alternative to using the standard [FutureBuilder](https://api.flutter.dev/flutter/widgets/FutureBuilder-class.html) inside our widgets. Here is an example:

```dart
FutureProvider<FirebaseUser>.value(
  value: FirebaseAuth.instance.currentUser(),
  child: MyApp(...),
);
```

To consume this value in a child widget, we use the same [Consumer](https://pub.dev/documentation/provider/latest/provider/Consumer-class.html) implementation used in the [StreamProvider](https://pub.dev/documentation/provider/latest/provider/StreamProvider-class.html) example above.

## **ValueListenableProvider**

[ValueListenable](https://api.flutter.dev/flutter/foundation/ValueListenable-class.html) is a Dart interface implemented by the [ValueNotifier](https://api.flutter.dev/flutter/foundation/ValueNotifier-class.html) class that takes a value and notifies listeners when it changes to another value. We can use it to wrap an integer counter in a simple model class:

```dart
class MyModel {
  final ValueNotifier<int> counter = ValueNotifier(0);
}
```

> When using complex types, ValueNotifier uses the == operator of the contained object to determine whether the value has changed.
> 

Let’s create a basic [Provider](https://pub.dev/packages/provider) to hold our main model, followed by a [Consumer](https://pub.dev/documentation/provider/latest/provider/Consumer-class.html) and a nested [ValueListenableProvider](https://pub.dev/documentation/provider/latest/provider/ValueListenableProvider-class.html) that listens to the `counter` property:

```dart
Provider<MyModel>(
  builder: (context) => MyModel(),
  child: Consumer<MyModel>(builder: (context, value, child) {
    return ValueListenableProvider<int>.value(
      value: value.counter,
      child: MyApp(...)
    }
  }
}
```

> Note that the type of the nested provider is int. You might have others. If you have multiple Providers registered for the same type, Provider will return the “closest” one (nearest ancestor).
> 

Here’s how we can listen to the `counter` property from any descendant widget:

```dart
class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<int>(
      builder: (context, value, child) {
        return Text(value.toString());
      },
    );
  }
}
```

And here is how we can *update* the `counter` property from yet another widget. Note that we need to access the original `MyModel` instance.

```dart
class OtherWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Text('Update'),
      onPressed: () {
        final model = Provider.of<MyModel>(context);
        model.counter.value++;
      },
    );
  }
}
```

## **MultiProvider**

If we are using many [Provider](https://pub.dev/packages/provider) widgets, we may end up with an ugly nested structure at the root of our app:

```dart
Provider<Foo>.value(
  value: foo,
  child: Provider<Bar>.value(
    value: bar,
    child: Provider<Baz>.value(
      value: baz ,
      child: MyApp(...)
    )
  )
)
```

[MultiProvider](https://pub.dev/documentation/provider/latest/provider/MultiProvider-class.html) lets us declare them all our providers at the same level. This is just [syntactic sugar](https://en.wikipedia.org/wiki/Syntactic_sugar); they are still being nested behind the scenes.

```dart
MultiProvider(
  providers: [
    Provider<Foo>.value(value: foo),
    Provider<Bar>.value(value: bar),
    Provider<Baz>.value(value: baz),
  ],
  child: MyApp(...),
)
```

## **ProxyProvider**

[ProxyProvider](https://pub.dev/documentation/provider/latest/provider/ProxyProvider-class.html) is an interesting class that was added in the v3 release of the [Provider](https://pub.dev/packages/provider) package. This lets us declare Providers that themselves are dependent on up to 6 other Providers. In this example, the `Bar` class depends on an instance of `Foo.` This is useful when establishing a root set of services that themselves have dependencies on one another.

```
MultiProvider (
  providers: [
    Provider<Foo> (
      builder: (context) => Foo(),
    ),
    ProxyProvider<Foo, Bar>(
      builder: (context, value, previous) => Bar(value),
    ),
  ],
  child: MyApp(...),
)
```

> The first generic type argument is the type your ProxyProvider depends on, and the second is the type it returns.
> 

## **Listening to Multiple Providers Simultaneously**

What if we want a single widget to list to multiple Providers, and trigger a rebuild whenever any of them change? We can listen to up to 6 Providers at a time using variants of the [Consumer](https://pub.dev/documentation/provider/latest/provider/Consumer-class.html) widget. We will receive the instances as additional parameters in the `builder` method.

```
Consumer2<MyModel, int>(
  builder: (context, value, value2, child) {
    //value is MyModel
    //value2 is int
  },
);
```