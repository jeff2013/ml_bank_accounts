# ml_bank_accounts

Frameworks used and their justifications

Alamofire + Objectmapper
  - A solid networking framework that is easily extensible with other great frameworks like objectmapper and moya (not used)
  - I've used a couple networking frameworks in the past and Alamofire has been my favorite, it's kept up to date, easy to use
  - Alamofire also pairs nicely with objectmapper which makes data mapping extremely easy
  - Alamofire and objectmapper can also be used with Moya to create an additional abstraction layer that has more robust error handling etc
 
SVProgressHUD
  - A simple framework for displaying a circular progress popup which is easy to use and useful when performing network requests etc
  - I've used this framework in the past and it's lightweight and very easy to use and customize
  
TextAttributes
  - An attributed text styling framework that, when paired with a wrapper class, makes styling text extremely easy.
  
Design decisions
  - I've included a design document of my initial wireframes of how I wanted the application to look with some initial considerations of datat formats etc.
  - I went with a simple white/grey style that's very "apple" like with a matched color palette using specific shades of red, green and blue
  - My goal of with the design was to display the information in a clean and readable way. I thought about what I would want in a banking application and where my eyes naturally gravitate to and that's where I chose to place the pertinant information.
  - I also payed specific attention to keep consistent spacing (16pt) to keep the app feel consistent and also adjusted font sizes to make certain information pop out to the user.
  
Additonal considerations
  - Offline data? 
    - I considered an offline cache of the data so that the user wouldn't have to make consistent network requests (i.e stay on the network) to use the application but I decided against it because keeping sensitive banking information cached on a device is a security risk. 
  - Animations? I thought of adding keyframe animations to spruce the application up but I thought it to be not appropriate considering the context of the application.

This was actually a really fun application to create, overall I spent about 2 days of juggling this and school to complete this application.
