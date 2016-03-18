# survata-ios-demo-app

## 1. Clone the git repository locally. 

## 2. Run "pod install" in order to install all the necessary modules. 
If your computer doesn't recognize pod, it's because you don't have Cocoapods installed. Go install it!

Once you have that installed, it should create a .xcworkspace. Use that instead of the .xcodeproj. 

## 3. Integrating SurveyWall
You can display it in your project however you like, but I chose to use a UIView, an ActivityIndicatorView, and a Button in order to trigger the creation of the survey. 

```swift
func createSurvey() {
        if created { return }
        let option = SurveyDebugOption(publisher: Settings.publisherId)
        option.preview = Settings.previewId
        option.zipcode = Settings.forceZipcode
        option.sendZipcode = Settings.sendZipcode
        option.contentName = Settings.contentName
        survey = Survey(option: option)
        
        survey.create {[weak self] result in
            self?.created = true
            switch result {
            case .Available:
                self?.showSurveyButton()
            default:
                self?.showFull()
            }
        }
    }
```
![alt text](http://media2.giphy.com/media/3XdsWf4oqSZ6E/giphy.gif)



