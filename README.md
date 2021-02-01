# 오토레이아웃 정복하기 - 프로젝트 Social Media Table
![동작 화면](./image.gif)

## 새로 알게된 점
### `UIImageView.clipToBounds`

`UIImageView` 안에 이미지가 프레임 바깥으로 벗어나면(= 이미지 크기 프레임 크기보다 큰 경우) 벗어난 이미지 부분을 자른다.

### `UIFont.preferredFont(forTextStyle: UIFont.TextStyle)`

> 사용자가 선택한 콘텐츠 크기 범주에 맞게 배율을 조정하여 지정된 텍스트 스타일에 대한 시스템 글꼴의 인스턴스를 반환합니다.
https://developer.apple.com/documentation/uikit/uifont/1619030-preferredfont

애플에서 제공하는 시스템 텍스트 스타일을 사용할 수 있다.

```swift
authorLabel.font = UIFont.preferredFont(forTextStyle: .caption1)
```

### CHCR을 프로그래밍 방식으로 지정하기

Compression Resistance → 콘텐츠를 자르지 않도록 뷰를 바깥쪽으로 밀어낸다.
```swift
authorLabel.setContentCompressionResistancePriority(.required,
                                                    for: .horizontal)
```
Hugging Priority → 뷰를 안쪽으로 당겨 콘텐츠 주변에 꼭 맞도록 한다.
```swift
authorLabel.setContentHuggingPriority(.required, for: .horizontal)
```

### `UIStackView.spacingUseSystem`
시스템에서 제공하는 `spacing` 사용하기

```swift
profileStack.spacing = UIStackView.spacingUseSystem
```
