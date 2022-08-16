# Auto Route
___
## Setup And Usage

Create a placeholder class and annotate it with `@MaterialAutoRouter` which takes a list of routes as a required argument.

__Note__: Unless you want to generate a part of file (.gr.dart) The name of the router must be prefixed with `$` so we have a generated class with the same name minus the `$`.

```dart
// @CupertinoAutoRouter              
// @AdaptiveAutoRouter              
// @CustomAutoRouter              
@MaterialAutoRouter(              
  replaceInRouteName: 'Page,Route',              
  routes: <AutoRoute>[              
    AutoRoute(page: HomePage, initial: true),              
    AutoRoute(page: CounterPage),              
  ],              
)              
class $AppRouter {}
```
> __Tip__: You can Shorten auto-generated route names from e.g. __BookListPageRoute__ to __BookListRoute__ using the replaceInRouteName argument.

## Now simply run the generator
Use the [watch] flag to watch the files' system for edits and rebuild as necessary.

```dart
flutter packages pub run build_runner watch
```
# Navigating Without Context
Here's an example using get_it which is just a personal favorite, you can use any dependency injection package you like.
```dart
void main(){          
// make sure you register it as a Singleton or a lazySingleton          
  getIt.registerSingleton<AppRouter>(AppRouter());          
  runApp(MyApp());          
 }          
          
class MyApp extends StatefulWidget {          
  @override          
  Widget build(BuildContext context) {          
    final router = getIt<AppRouter>();          
    return MaterialApp.router(          
      routerDelegate: AutoRouterDelegate(router),          
      routeInformationParser: router.defaultRouteParser(),          
      );          
    }
```
now you can access to your router anywhere inside of your App without using context.
```dart
getIt<AppRouter>().push(...);
```
# Navigating Between Screens
`AutoRouter` offers the same known push, pop and friends methods to manipulate the pages stack using both the generated `PageRouteInfo` objects and paths.
```dart
// get the scoped router by calling              
AutoRouter.of(context)              
// or using the extension              
context.router       
// or using dependency injection
getIt<AppRouter>().pushNamed(path);
              
// adds a new entry to the pages stack              
router.push(const BooksListRoute())            
// or by using using paths            
router.pushNamed('/books')             
          
// removes last entry in stack and pushs provided route           
// if last entry == provided route page will just be updated          
router.replace(const BooksListRoute())              
// or by using using paths            
router.replaceNamed('/books')            
          
// pops until provided route, if it already exists in stack              
// else adds it to the stack (good for web Apps).              
router.navigate(const BooksListRoute())            
// or by using using paths            
router.navigateNamed('/books')          
        
// on Web it calls window.history.back();      
// on Native it navigates you back       
// to the previous location      
router.navigateBack();      
      
// adds a list of routes to the pages stack at once          
router.pushAll([          
   BooksListRoute(),          
   BookDetailsRoute(id:1),          
]);          
          
// This's like providing a completely new stack as it rebuilds the stack          
// with the list of passed routes          
// entires might just update if already exist          
router.replaceAll([          
   LoginRoute()          
]);          
// pops the last page unless stack has 1 entry              
context.router.pop();             
// keeps poping routes until predicate is satisfied          
context.router.popUntil((route) => route.name == 'HomeRoute');          
// a simplifed version of the above line          
context.router.popUntilRouteWithName('HomeRoute');          
// pops all routes down to the root          
context.router.popUntilRoot();          
               
// removes the top most page in stack even if it's the last          
// remove != pop, it doesn't respect WillPopScopes it just           
// removes the entry.          
context.router.removeLast();           
          
// removes any route in stack that satisfis the predicate          
// this works exactly like removing items from a regualar List          
// <PageRouteInfo>[...].removeWhere((r)=>)          
context.router.removeWhere((route) => );          
              
// you can also use the common helper methods from context extension to navigate          
context.pushRoute(const BooksListRoute());          
context.replaceRoute(const BooksListRoute());          
context.navigateTo(const BooksListRoute());          
context.navigateNamedTo('/books');          
context.navigateBack();         
context.popRoute();
```
# Passing Arguments
__AutoRoute__ automatically detects and handles your page arguments for you, the generated route object will deliver all the arguments your page needs including path/query params.

e.g. The following page widget will take an argument of type Book.
```dart
class BookDetailsPage extends StatelessWidget {              
 const BookDetailsPage({required this.book});              
              
  final Book book;           
  ...
```
>Note: Default values are respected. Required fields are also respected and handled properly.

The generated `BookDetailsRoute` will deliver the same arguments to it's corresponding page.
```dart
router.push(BookDetailsRoute(book: book));
```
>Note: all args are generated as named parameters regardless of their original type.

## References
[Flutter Auto Route](https://pub.dev/packages/auto_route)
