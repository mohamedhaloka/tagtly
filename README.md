## Tagtly for hyberlink

Flutter package for Android and iOS allow you to show a wide range of hyperlinks either in the input field or in an article view, for example.

Package help you detects
- Email.
- url.
- Social media accounts Tag [Facebook , Twitter , Instagram].
- the words start with `#` [Hashtag].
- Date and Time

And we'll add more later..

<img src="https://github.com/favicon.ico" width="120" height="300">


## Usage
- **As Text Field**

you can use `TagtlyTextField` for decorate all hyberlinks
```dart
TagtlyTextField(  
  decoration: const InputDecoration(  
      hintText: 'Type anything',  
      contentPadding: EdgeInsets.symmetric(horizontal: 8)),  
	  onChanged: (String value) {    },  
)
```

You can add your own style to the `TagtlyTextField` as you do in the `TextFormField` it is just like.

-   **As ReadOnlyText**

If you want to display the text as read-only without modifying it, then `TagtlyTextView` will help you.
```dart
TagtlyTextView(  
  "Text here #welcome mnhaloka@gmail.com",  
  onClick: (TextObj textObj) => log(textObj.type.toString()),  
)
```
The argument  `onClick(TextObj)`  is called when user tapped a hybertext.
It will return TextObj contain `textContent` and `textType`.
You can add some actions in this callback with the tapped text.

### `TagtlyTextView()` and `TagtlyTextField()`
This package build with Regex.

| Regex  | Detect in `TagtlyTextView()` | Detect in `TagtlyTextField()`|
| ------------- | ------------- |------------- |
| Url  | ✅  | ✅ |
| Email  | ✅  | ❌ |
| Hashtag  | ✅  | ✅|
| Tag [Twitter , Facebook , Instagram]  | ✅  |✅ |
| Date  | ✅  | ✅|
| Time  | ✅  | ✅|

### How i can you it in `TagtlyTextField()`
| Regex  | View | 
| ------------- | ------------- |
| Url  | https://www.tagtly.com  |
| Email  | example@tagtly.com| 
| Hashtag  | #tagtly  |
| Tag [Twitter]  | tw: @mo_nasr or twitter: @mo_nasr  |
| Tag [Facebook]  | fb: @mo_nasr or facebook: @mo_nasr  |
| Tag [Instagram]  | insta: @mo_nasr or instagram: @mo_nasr  |
| Date  | 21/07/2022, 21-07-2022, 21.07.2022 and more formats  |
| Time  | 12:50  |

### How does the text appear in `TagtlyTextView()`
| Regex  | View | 
| ------------- | ------------- |
| Url  | https://www.tagtly.com - like input |
| Email  | example@tagtly.com - like input| 
| Hashtag  | #tagtly - like input|
| Tag [Twitter]  | https://www.twitter.com/mo_nasr  |
| Tag [Facebook]  | https://www.facebook.com/mo_nasr  |
| Tag [Instagram]  | https://www.instagram.com/mo_nasr  |
| Date  | 21/07/2022, 21-07-2022, 21.07.2022 and more formats - like input |
| Time  | 12:50 - like input |


If you have any requests or questions, please feel free to ask on  [github](https://github.com/mohamedhaloka/tagtly/issues).
