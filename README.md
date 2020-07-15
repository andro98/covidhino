# Covidhino

A Covid-19 Application Tracker made with Flutter for both android and ios

## Description
  Try to follow MVVM design pattern, using provider as state management, the application have 3 main features, preventions from covid-19, world cases and map showing for each continent, for your country cases and a chart to see the current curve
  
##  Current Problem
  <ul>
    <li>API doesn't contain information for active cases for all the world</li>
    <li>API doesn't contain information for total cases per continent</li>
    <li>Static location for my country</li>
    <li>Need a refactor for some parts of code</li>
  </ul>

## TODO
  <ul>
    <li>Seaching for an API that retrieve data by continent</li>
    <li>Change Map's markers to heat map</li>
    <li>Add dynamic location base on user location</li>
    <li>Add localization</li>
  </ul>

## Design:
  <a href="https://www.uplabs.com/posts/covid-19-e9c787fc-2d76-47e5-8b43-e3e5c68bfe5e">Ram Lakhan</a>

## Packages: 

  <table>
  <tr>
    <th>For</th>
    <th>Package Name</th>
  </tr>
  <tr>
    <th>State Managment</th>
    <th><a href="https://pub.dev/packages/provider">provider</a></th>
  </tr>
   <tr>
    <th>Http Requests</th>
    <th><a href="https://pub.dev/packages/http">http</a></th>
  </tr>
  <tr>
    <td>Google Maps</td>
    <td><a href="https://pub.dev/packages/google_maps_flutter#-installing-tab-">google_maps_flutter</a></td>
  </tr>
  <tr>
    <td>Charts</td>
    <td><a href="https://pub.dev/packages/fl_chart#-installing-tab-">fl_chart</a></td>
  </tr>
   <tr>
    <td>App Icon</td>
    <td><a href="https://pub.dev/packages/flutter_launcher_icons">flutter_launcher_icons</a></td>
  </tr>
  <tr>
    <td>Toggle Switch</td>
    <td><a href="https://pub.dev/packages/toggle_switch">toggle_switch</a></td>
  </tr>
   <tr>
    <td>Number Formatter</td>
    <td><a href="https://pub.dev/packages/intl">intl</a></td>
  </tr>
</table>

## Demo
![Covid-19 Demo](./demo/Covidhino.gif)
