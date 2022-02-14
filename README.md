<div id="top"></div>

[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![BSD License][license-shield]][license-url]
[![LinkedIn][linkedin-shield]][linkedin-url]



<!-- PROJECT LOGO -->
<br />
<div align="center">
  <a href="https://github.com/saidIssaoui/flutter_employe_manager">
    <img src="images/logo.png" alt="Logo" width="80" height="80">
  </a>

<h3 align="center">Employee Manager</h3>

  <p align="center">
    project_description
    <br />
    <a href="https://github.com/saidIssaoui/flutter_employe_manager"><strong>Explore the docs »</strong></a>
    <br />
    <br />
    <a href="https://github.com/saidIssaoui/flutter_employe_manager/issues">Report Bug</a>
    ·
    <a href="https://github.com/saidIssaoui/flutter_employe_manager/issues">Request Feature</a>
  </p>
</div>



<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#acknowledgments">Acknowledgments</a></li>
  </ol>
</details>



<!-- ABOUT THE PROJECT -->
## About The Project

[![Product Name Screen Shot][product-screenshot]]()
[![Product Name Screen Shot 2][product-screenshot-2]]()

There are many great applications to manage and track your employees available on GitHub; however, I didn't find one that really suited my needs so I created this enhanced one. I want to create a flutter application so amazing that it'll be the last one you ever need -- I think this is it.

Here's why:
* Your time should be focused on excuting the task. The application will give you location and guide you through your task.
* You shouldn't be afraid from the employee behaviour because the application will track all.

Of course, no one application will serve all needs since your needs may be different. So I'll be adding more in the near future. You may also suggest changes by forking this repo and creating a pull request or opening an issue.

<p align="right">(<a href="#top">back to top</a>)</p>



### Built With

* [Flutter](https://flutter.dev/)

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- GETTING STARTED -->
## Getting Started


To get a local copy up and running follow these simple example steps.

### Prerequisites

This is an example of how to list things you need to use the software and how to install them.
* Flutter
  ```sh
  https://docs.flutter.dev/get-started/install
  ```
* Firebase/NodeJs backend
  ```https
  https://github.com/saidIssaoui/api_promoted.git
  ```  
### Installation

1. Get a free API Key at [cloud console](https://console.cloud.google.com/apis/credentials)
2. Add Firebase to your Android app [firebase setup](https://firebase.google.com/docs/android/setup)
3. Clone the repo
   ```sh
   git clone https://github.com/saidIssaoui/flutter_employe_manager.git
   ```
4. Install flutter packages
   ```sh
   flutter pub get
   ```
5. Enter your API in `AndroidManifest.xml`
   ```xml
   <meta-data android:name="com.google.android.geo.API_KEY"
               android:value="Your_Api"/>
   ```
6. Enter your API in `AppDelegate.swift`
   ```swift
   GMSServices.provideAPIKey("Your_Api")
   ```  
7. Enter your API in `map.dart && add_task.dart`
   ```dart
   String googleAPIKey = 'Your_Api';
   PlacePicker(
              "Your_Api",)
   ```     
8. Enter your API in `index.html`
   ```html
   <script src="https://maps.googleapis.com/maps/api/js?key=Your_Api"></script>
   ```
<p align="right">(<a href="#top">back to top</a>)</p>



<!-- USAGE EXAMPLES -->
## Usage

This app help you to track your employee work progress and assure that he/she is working from the right place and at the right time.

_For more examples, please refer to the [Documentation](https://github.com/saidIssaoui/flutter_employe_manager/blob/main/README.md)_

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- CONTRIBUTING -->
## Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement".
Don't forget to give the project a star! Thanks again!

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/NewFeature`)
3. Commit your Changes (`git commit -m 'Add some NewFeature'`)
4. Push to the Branch (`git push origin feature/NewFeature`)
5. Open a Pull Request

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- LICENSE -->
## License

Distributed under the BSD 3-Clause License. See `LICENSE.txt` for more information.

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- CONTACT -->
## Contact

Said Issaoui - [LinkedIn](https://www.linkedin.com/in/said-issaoui-55095315b/)

Project Link: [https://github.com/saidIssaoui/flutter_employe_manager](https://github.com/saidIssaoui/flutter_employe_manager)

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- ACKNOWLEDGMENTS -->
## Acknowledgments

* [abuanwar072](https://github.com/abuanwar072/Chat-Messaging-App-Light-and-Dark-Theme)
* [MarcusNg](https://github.com/MarcusNg/flutter_covid_dashboard_ui)

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- MARKDOWN LINKS & IMAGES -->
[contributors-shield]: https://img.shields.io/github/contributors/saidIssaoui/flutter_employe_manager.svg
[contributors-url]: https://github.com/saidIssaoui/flutter_employe_manager/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/saidIssaoui/flutter_employe_manager.svg
[forks-url]: https://github.com/saidIssaoui/flutter_employe_manager/network/members
[stars-shield]: https://img.shields.io/github/stars/saidIssaoui/flutter_employe_manager.svg
[stars-url]: https://github.com/saidIssaoui/flutter_employe_manager/stargazers
[issues-shield]: https://img.shields.io/github/issues/saidIssaoui/flutter_employe_manager.svg
[issues-url]: https://github.com/saidIssaoui/flutter_employe_manager/issues
[license-shield]: https://img.shields.io/github/license/saidIssaoui/flutter_employe_manager.svg
[license-url]: https://github.com/saidIssaoui/flutter_employe_manager/blob/main/LICENSE.txt
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg
[linkedin-url]: https://www.linkedin.com/in/said-issaoui-55095315b/
[product-screenshot]: images/add_task.gif
[product-screenshot-2]: images/manage_employee.gif
