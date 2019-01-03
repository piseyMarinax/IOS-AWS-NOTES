# ISO_AWS_NOTES

20190102


 ****** Topics include:
* AWS Mobile introduction
* Create your app project
* Adding authentication
* Adding Facebook and Google logins
* Configure data and file storage
* Reading, updating, deleting, and querying data
* Uploading, downloading, and deleting files


What should you know:
* Server related concepts.
* Swift 4
* Xcode 

Should check out Course : 
* Xcode 
* Browser 
* Swift 4 Essential Training Course 
You also want AWS to access what’s available from AWS

I. Getting Started with AWS Mobile 

1. AWS Mobile introduction
        - AWS console - aws.amazone.com
        - AWS mobile - https://aws.amazon.com/mobile
        - AWS Mobile Hub - https://console.aws.amazon.com
        - Create projects 
        - Getting started kits and tutorials
    AWS Mobile hub
* Https://aws.amazon.com/mobile
* User sign-in
* NoSQL database
* User file storage


2. AWS Console and Project 
* Aws.amazon.com/mobilehub
* Create account and log in
* Use the console to create a project
* Configure your project to use AWS backend 

        Create and Configure project 
            1. Aws.amazon.com/mobilehub 
            2. Pick platform (e.g IOS)
            3. Cloud-enable existing app
                - Name your project (e.g, items)
                - Download the configuration for project
3. Create and configure the app project
            - Client project (e.g IOS app) 
            - Install CocoaPods
            - Add AWS Mobile SDK to project
            - Needs configuration to access AWS backend (Awsconfiguratoin.json)
Xcode 
      1. Creat Xcode app project
      2. Install AWSMobileClient CocoaPod -cocoapods.org
      3. Add AWS Mobile SDK - pod ‘AWSMobileClient’, ‘ ~>2.6.13’
            - Add awsconfiguration.json
            - Use xcworkplace going forward
            - Import AWSMobileClient
            - Modify didFinishLaunchingWithOptions


Sudo gem install cocoapods
* Pod init 
* Open podfile. “Add AWSMobileClient“
* Pod install
* Open Notes.xcworksplace

git remote set-url origin https://github.com/piseyMarinax/ISO_AWS_NOTES.git

20180103
4.     Available AWS Mobile Cocoa-pod
                - aws.amazon.com/mobilehub
                - Access to project and apps
                - Specific backend services already added
                - More then can be added.
            1. Available AWS Mobile CocoaPods
            - Version of CocoaPods
            - To use the latest version, don’t specify a number
           - See Podfile.lock to see version in use
           - Go to the CocoaPod
          - For example https://cocoapods.org/pods/AWSMobileClient
