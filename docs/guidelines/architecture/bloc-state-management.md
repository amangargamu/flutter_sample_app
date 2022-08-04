# BLoC State Management



In Flutter, there are different options for managing states. One of them is Bloc Pattern **(Business Logic Component)** which is one of the most popular state management techniques and is recommended by Google as well.

## Why Bloc?

Bloc makes it easy to separate presentation from business logic, making your code fast, easy to test, and reusable.

When building production quality applications, managing state becomes critical.

As developers we want to:

- know what state our application is in at any point in time.
- easily test every case to make sure our app is responding appropriately.
- record every single user interaction in our application so that we can make data-driven decisions.
- work as efficiently as possible and reuse components both within our application and across other applications.
- have many developers seamlessly working within a single code base following the same patterns and conventions.
- develop fast and reactive apps.

Bloc was designed to meet all of these needs and many more.

There are many state management solutions and deciding which one to use can be a daunting task. There is no one perfect state management solution! What's important is that you pick the one that works best for your team and your project.

Bloc was designed with three core values in mind:

**Simple:** Easy to understand & can be used by developers with varying skill levels.
**Powerful:** Help make amazing, complex applications by composing them of smaller components.
**Testable:** Easily test every aspect of an application so that we can iterate with confidence.

Overall, Bloc attempts to make state changes predictable by regulating when a state change can occur and enforcing a single way to change state throughout an entire application.
Before diving directly into the code, let’s have a visual experience of the architecture which we are going to study:

## Architecture

![](https://bloclibrary.dev/assets/bloc_architecture_full.png)

Using the bloc library allows us to separate our application into three layers:
- Presentation
- Business Logic
- Data 
  - Repository
  - Data Provider
  
We're going to start at the lowest level layer (farthest from the user interface) and work our way up to the presentation layer.

### Data Layer
> The data layer's responsibility is to retrieve/manipulate data from one or more sources.

The data layer can be split into two parts:

- Repository
- Data Provider
This layer is the lowest level of the application and interacts with databases, network requests, and other asynchronous data sources.
### Data Provider
> The data provider's responsibility is to provide raw data. The data provider should be generic and versatile.

The data provider will usually expose simple APIs to perform CRUD operations. We might have a `createData`, `readData`, `updateData`, and `deleteData` method as part of our data layer.

```dart
class DataProvider {
    Future<RawData> readData() async {
        // Read from DB or make network request etc...
    }
}
```

### Repository
>The repository layer is a wrapper around one or more data providers with which the Bloc Layer communicates.
```dart
class Repository {
    final DataProviderA dataProviderA;
    final DataProviderB dataProviderB;

    Future<Data> getAllDataThatMeetsRequirements() async {
        final RawDataA dataSetA = await dataProviderA.readData();
        final RawDataB dataSetB = await dataProviderB.readData();

        final Data filteredData = _filterData(dataSetA, dataSetB);
        return filteredData;
    }
}

```
As you can see, our repository layer can interact with multiple data providers and perform transformations on the data before handing the result to the business logic Layer.

### Business Logic Layer

> The business logic layer's responsibility is to respond to input from the presentation layer with new states. This layer can depend on one or more repositories to retrieve data needed to build up the application state.

Think of the business logic layer as the bridge between the user interface (presentation layer) and the data layer. The business logic layer is notified of events/actions from the presentation layer and then communicates with repository in order to build a new state for the presentation layer to consume.
```dart
class BusinessLogicComponent extends Bloc<MyEvent, MyState> {
    BusinessLogicComponent(this.repository) {
        on<AppStarted>((event, emit) {
            try {
                final data = await repository.getAllDataThatMeetsRequirements();
                emit(Success(data));
            } catch (error) {
                emit(Failure(error));
            }
        });
    }

    final Repository repository;
}
```

### Bloc-to-Bloc Communication
Because blocs expose streams, it may be tempting to make a bloc which listens to another bloc. You should **not** do this. There are better alternatives than resorting to the code below:
```dart
class BadBloc extends Bloc {
  final OtherBloc otherBloc;
  late final StreamSubscription otherBlocSubscription;

  BadBloc(this.otherBloc) {
    // No matter how much you are tempted to do this, you should not do this!
    // Keep reading for better alternatives!
    otherBlocSubscription = otherBloc.stream.listen((state) {
      add(MyEvent())
    });
  }

  @override
  Future<void> close() {
    otherBlocSubscription.cancel();
    return super.close();
  }
}
```

While the code above is error free (and even cleans up after itself), it has a bigger problem: it creates a dependency between two blocs.

Generally, sibling dependencies between two entities in the same architectural layer should be avoided at all costs, as it creates tight-coupling which is hard to maintain. Since blocs reside in the business logic architectural layer, no bloc should know about any other bloc.

![](https://bloclibrary.dev/assets/architecture.png)
A bloc should only receive information through events and from injected repositories (i.e., repositories given to the bloc in its constructor).

If you're in a situation where a bloc needs to respond to another bloc, you have two other options. You can push the problem up a layer (into the presentation layer), or down a layer (into the domain layer).

### Connecting Blocs through Presentation

You can use a `BlocListener` to listen to one bloc and add an event to another bloc whenever the first bloc changes.

```dart
class MyWidget extends StatelessWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<WeatherCubit, WeatherState>(
      listener: (context, state) {
        // When the first bloc's state changes, this will be called.
        //
        // Now we can add an event to the second bloc without it having
        // to know about the first bloc.
        BlocProvider.of<SecondBloc>(context).add(SecondBlocEvent());
      },
      child: TextButton(
        child: const Text('Hello'),
        onPressed: () {
          BlocProvider.of<FirstBloc>(context).add(FirstBlocEvent());
        },
      ),
    );
  }
}
```
The code above prevents SecondBloc from needing to know about FirstBloc, encouraging loose-coupling. The flutter_weather application uses this technique to change the app's theme based on the weather information that is received.

In some situations, you may not want to couple two blocs in the presentation layer. Instead, it can often make sense for two blocs to share the same source of data and update whenever the data changes.

### Connecting Blocs through Domain
Two blocs can listen to a stream from a repository and update their states independent of each other whenever the repository data changes. Using reactive repositories to keep state synchronized is common in large-scale enterprise applications.

First, create or use a repository which provides a data Stream. For example, the following repository exposes a never-ending stream of the same few app ideas:
```dart
class AppIdeasRepository {
  int _currentAppIdea = 0;
  final List<String> _ideas = [
    "Future prediction app that rewards you if you predict the next day's news",
    'Dating app for fish that lets your aquarium occupants find true love',
    'Social media app that pays you when your data is sold',
    'JavaScript framework gambling app that lets you bet on the next big thing',
    'Solitaire app that freezes before you can win',
  ];

  Stream<String> productIdeas() async* {
    while (true) {
      yield _ideas[_currentAppIdea++ % _ideas.length];
      await Future<void>.delayed(const Duration(minutes: 1));
    }
  }
}
```
The same repository can be injected into each bloc that needs to react to new app ideas. Below is an AppIdeaRankingBloc which yields a state out for each incoming app idea from the repository above:
```dart
class AppIdeaRankingBloc
    extends Bloc<AppIdeaRankingEvent, AppIdeaRankingState> {
  AppIdeaRankingBloc({required AppIdeasRepository appIdeasRepo})
      : _appIdeasRepo = appIdeasRepo,
        super(AppIdeaInitialRankingState()) {
    on<AppIdeaStartRankingEvent>((event, emit) async {
      // When we are told to start ranking app ideas, we will listen to the
      // stream of app ideas and emit a state for each one.
      await emit.forEach(
        _appIdeasRepo.productIdeas(),
        onData: (String idea) => AppIdeaRankingIdeaState(idea: idea),
      );
    });
  }

  final AppIdeasRepository _appIdeasRepo;
}
```
### Presentation Layer
>The presentation layer's responsibility is to figure out how to render itself based on one or more bloc states. In addition, it should handle user input and application lifecycle events.

Most applications flows will start with a AppStart event which triggers the application to fetch some data to present to the user.

In this scenario, the presentation layer would add an AppStart event.

In addition, the presentation layer will have to figure out what to render on the screen based on the state from the bloc layer.

```dart
class PresentationComponent {
    final Bloc bloc;

    PresentationComponent() {
        bloc.add(AppStarted());
    }

    build() {
        // render UI based on bloc state
    }
}
```