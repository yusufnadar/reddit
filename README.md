 # Scroll Mate

Multiple scroll controller works synchronization and define how many line to show

[![pub](https://img.shields.io/pub/v/scroll_mate)](https://pub.dev/packages/scroll_mate)

## Preview

<img src="https://github.com/yusufnadar/reddit/master/preview.mov" alt="Example Project" />

<video id="video" width="320" height="240" controls>
   <source src="https://drive.google.com/file/d/1yUTFdm7fwbvYlsjpRL_ypuQhoN27j9p4/view?usp=sharing" type='video/mp4'>
   Your browser does not support the video tag.
</video> 

## Getting Started

You can handle multiple scroll controller synchronization. All lines scrolls start and end at the
same time. Decide how many lines do you want to show on the screen.

## Properties

### Scroll Mate Model

| Parameter            | Type                                          | required | default                    |
|----------------------|-----------------------------------------------|----------|----------------------------|
| `items`              | `List<T>`                                     | yes      | -                          |
| `builder`            | `ScrollMateItem Function(T title, int index)` | yes      | -                          |
| `lineCount`          | `int`                                         | no       | 2                          |
| `title`              | `Widget`                                      | no       | `SizedBox()`               |
| `crossAxisAlignment` | `CrossAxisAlignment`                          | no       | `CrossAxisAlignment.start` |
| `crossAxisSpacing`   | `double`                                      | no       | `10`                       |
| `mainAxisSpacing`    | `double`                                      | no       | `20`                       |
| `scrollPadding`      | `EdgeInsets`                                  | no       | `EdgeInsets.zero`          |

### Scroll Mate Item

| Parameter     | Type     | required | default |
|---------------|----------|----------|---------|
| `item`        | `Widget` | yes      | -       |
| `leftMargin`  | `double` | no       | 0       |
| `rightMargin` | `double` | no       | 0       |

## Features

- [x] Multiple scroll controller works synchronization
- [x] Define a line count parameter to show users
- [x] Generic type can be used and custom widget you can show

## Usage

```
ScrollMateList<String>(
      scrollMateModel: ScrollMateModel(
        lineCount: 4,
        items: Interests.list,
        title: buildInterestTitle(),
        builder: (String title, int index) {
          return ScrollMateItem(
            rightMargin: 20,
            leftMargin: 20,
            item: ScrollMateChip(title: title.toString(), index: index),
          );
        },
      ),
    );
```

```
const Padding(
      padding: EdgeInsets.only(bottom: 15, left: 20, top: 15),
      child: Text(
        'Interests',
        style: TextStyle(fontSize: 20, color: Color(0xff4c546d), fontWeight: FontWeight.bold),
      ),
    );
```

```
ScrollMateItem(
      rightMargin: 20,
      leftMargin: 20,
      item: Container(
        height: 40,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: const Color(0xff4c546d),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ).item;
```
