# Lab 8 - *Tinder*

**Tinder** is a mock Tindr app featuring gestures and custom transitions

Time spent: **8** hours spent in total

## User Stories

The following **required** user stories are complete:

- [x] User can drag card using a pan gesture (+1pt)
- [x] Card rotates as user pans (+1pt)
- [x] Card animates when user ends panning gesture (+2pt)
- [x] User can view profile - basic modal transition (+1pt)

The following **stretch** user stories are implemented:

- [ ] User can view profile - custom modal transition (+2pt)

Please list two areas of the assignment you'd like to **discuss further with your peers** during the next class (examples include better ways to implement something, how to extend your app in certain ways, etc):

1. Why don't UIImageViews have a action capability naturally?
2. How can we make the animation look better

## Video Walkthrough

Here's a walkthrough of implemented user stories:

<img src= 'https://i.gyazo.com/dd2561830e9b52078882d24375588538.gif' width='' alt='Video Walkthrough' />

## Notes

Getting the image to have a tap capability. Figured you should be able to control drag to code for an action but you can't. And also, you can't make a segue from an image to another ViewController so I had to control drag from the top if the CardViewController to the ProfileViewController.

## License

Copyright [2018] [Nancy and Carlos]

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
