# Java Checkstyle Action
A GitHub Action to run Java Checkstyle on Java repositories

## Usage
Add a `.github/workflows/main.yml` to your repo containing this:
```java
on: [push]

jobs:
  checkstyle:
    runs-on: ubuntu-latest
    name: A job to run Java checkstyle
    steps:
      - name: Checkout
        uses: actions/checkout@v2
      - name: Run Java Checkstyle
        uses: kallumj/java-checkstyle-action@v8
        with:
            stylefile: "sun"
```

## Inputs

### `workdir`
The relative path to the directory to work from

### `stylefile`
The stylefile to use with checkstyle, either `sun`, or `google`. Sun by default. 