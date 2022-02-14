<div id="top"></div>

[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![MIT License][license-shield]][license-url]
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

Here's a blank template to get started: To avoid retyping too much info. Do a search and replace with your text editor for the following: `github_username`, `repo_name`, `twitter_handle`, `linkedin_username`, `email`, `email_client`, `project_title`, `project_description`

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

Use this space to show useful examples of how a project can be used. Additional screenshots, code examples and demos work well in this space. You may also link to more resources.

_For more examples, please refer to the [Documentation](https://example.com)_

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

Distributed under the MIT License. See `LICENSE.txt` for more information.

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- CONTACT -->
## Contact

Said Issaoui - [LinkedIn](https://www.linkedin.com/in/said-issaoui-55095315b/)

Project Link: [https://github.com/saidIssaoui/flutter_employe_manager](https://github.com/saidIssaoui/flutter_employe_manager)

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- ACKNOWLEDGMENTS -->
## Acknowledgments

* []()
* []()
* []()

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- MARKDOWN LINKS & IMAGES -->
[contributors-shield]: https://img.shields.io/github/contributors/saidIssaoui/flutter_employe_manager.svg?style=for-the-badge
[contributors-url]: https://github.com/saidIssaoui/flutter_employe_manager/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/saidIssaoui/flutter_employe_manager.svg?style=for-the-badge
[forks-url]: https://github.com/saidIssaoui/flutter_employe_manager/network/members
[stars-shield]: https://img.shields.io/github/stars/saidIssaoui/flutter_employe_manager.svg?style=for-the-badge
[stars-url]: https://github.com/saidIssaoui/flutter_employe_manager/stargazers
[issues-shield]: https://img.shields.io/github/issues/saidIssaoui/flutter_employe_manager.svg?style=for-the-badge
[issues-url]: https://github.com/saidIssaoui/flutter_employe_manager/issues
[license-shield]: https://img.shields.io/github/license/saidIssaoui/flutter_employe_manager.svg
[license-url]: https://github.com/saidIssaoui/flutter_employe_manager/blob/main/LICENSE.txt
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://www.linkedin.com/in/said-issaoui-55095315b/
[product-screenshot]: images/add_task.gif
[product-screenshot-2]: images/manage_employee.gif
