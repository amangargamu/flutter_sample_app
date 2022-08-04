## Running Tests
Now you have written test cases for project you are working on. To run those test cases you can simply do this through command line or integrated tools in IDE.

### Via Command line
1. Open the terimal and run `flutter test` 
2. It will run all the test cases inside `test/` folder

### Via IDE Integrated tools
1. In `Visual Studio Code` we have `test` section under `extensions` section
2. Click on that `test` section button and hit `run` button (see figure)
![Image](https://i.im.ge/2022/07/05/u0y2g1.png)
3. This test panel is really helpful it shows the all the test cases like tree structure, you can open any node and see the children (tests) of that particular test case
4. You can also `debug` all test cases and also `run / debug` any paritular test case

## Test Coverage
Now you know how to `run/debug` test cases. But if you want to see what percentage of the project covers test cases. Means, if we have written test cases for this `module/class/method` or not.

To run all unit and widget tests with coverage information use the following command:

```sh
$ flutter test --coverage --test-randomize-ordering-seed random
```

This command will run all the test cases in random order and generate a file `lcov.info`. You can dind this file in root of the project under `coverage/` folder.

We have a powerful extension in `visual studio code` named `Coverage Gutters`. Install that extension.

![Image](https://i.im.ge/2022/07/05/u0AwTP.png)

Once you download the extension, to see test coverage of that particular file, open that file. (*Note: first run the test coverage command to generate latest `lcov.info` file*)

On the bottom panel of `visual studio code` you will be able to see the `watch` button, by clicking on that you will be able to see the test coverage of that file.

![Image](https://i.im.ge/2022/07/05/u0AHWK.png)

Now you can see the 33% of the file is covered under the test cases. Green color before line represent that line is covered under the test cases and red color before the line means we need to write the test cases for that code.  

![Image](https://i.im.ge/2022/07/05/u0C7Zc.png)

>By clickin on the same coverage button in bottom bar, you can off the extension.


### To view the generated coverage report on web you can generate html file from the `lcov.info` file

```sh
# Generate Coverage Report
$ genhtml coverage/lcov.info -o coverage/

# Open Coverage Report
$ open coverage/index.html
```

>If `open` command is not supported you can directly open the `index.html` file in browser. You can find this `index.html` file under coverage section.

>Also genhtml might not work on Windows OS :( In that case you can refer to this 2 min read article [Lcov in windows](https://fredgrott.medium.com/lcov-on-windows-7c58dda07080)

# Reference and Useful links
- https://github.com/linux-test-project/lcov
- https://code.visualstudio.com/
- https://fredgrott.medium.com/lcov-on-windows-7c58dda07080