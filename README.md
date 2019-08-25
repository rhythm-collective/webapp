# siteapp

[![Build Status](https://travis-ci.org/rhythm-collective/siteapp.svg?branch=master)](https://travis-ci.org/rhythm-collective/siteapp) [![Coverage Status](https://coveralls.io/repos/github/rhythm-collective/siteapp/badge.svg?branch=master)](https://coveralls.io/github/rhythm-collective/siteapp?branch=master) [![License: AGPL v3](https://img.shields.io/badge/License-AGPL%20v3-blue.svg)](https://www.gnu.org/licenses/agpl-3.0)

## Initial configuration

- Follow the [TypeScript React Starter](https://github.com/Microsoft/TypeScript-React-Starter#typescript-react-starter) quick start guide.
- Read the [React Typescript Cheatsheet](https://github.com/typescript-cheatsheets/react-typescript-cheatsheet#reacttypescript-cheatsheets)
- Read [Use Typescript to Develop React Applications](https://egghead.io/courses/use-typescript-to-develop-react-applications)
- Take a look at [Ultimate React Component Patterns with Typescript 2.8](https://levelup.gitconnected.com/ultimate-react-component-patterns-with-typescript-2-8-82990c516935)

- Open the keyengine workspace.
- Install the workspace recommended extensions.
- Enter the workspace console with ```ctrl+` ```.
- Initialize the node workspace `npm install`
- Start active transpiling: `Ctrl + Shift + B`

## To create new examples or compiling in Typescript

- Write your .ts files under the `engine/` or `example/` directories.
- The folder and file structure you create will be mimicked in the `bin/` directory.
- There is no compilation level difference between files in `engine/` or `examples/`.
- The `index.html` should not live in the `bin/` directories, and should reference compiled code. See existing examples.

## Set Up Debugging in Firefox

- Install [Debugger for Firefox](https://marketplace.visualstudio.com/items?itemName=hbenl.vscode-firefox-debug)
- Launch the debugger with 'Launch Firefox' debug launch (see launch.json).

## Set Up Debugging in Chrome

> *Contribution Needed* Please fill out when configuring for chrome debugging.
> [Debugger for Chrome](https://marketplace.visualstudio.com/items?itemName=msjsdiag.debugger-for-chrome)
> Please match the style of [Debugging in Firefox](#Debugging-in-Firefox)

## Debugging in Browser

- In a workspace bash terminal run `./node_modules/.bin/ws -p 80 --hostname lvh.me`.
- Run the launch task of your preferred browser.

## Debugging

- Place breakpoints as you wish.
- Run Debug launch task.

### Possible Errors

- **SEC_ERROR_UNKNOWN_ISSUER**
  - If you use a system level adblocker or a VPN, disable them. (Ex. Adguard)

- **Loading failed for the \<script> with source *[url]***
  - If you use a system level adblocker or a VPN, disable them. (Ex. Adguard)

## Testing the spotify example

- Navigate to [Web Playback SDK Quick Start](https://developer.spotify.com/documentation/web-playback-sdk/quick-start/#)
- Generate your own access token. (It will expire in an hour.)
- Paste it into the quotes at `const token = '';` on line 13.
- The webserver should be restarted with `./node_modules/.bin/ws -p 80 --hostname lvh.me`
- Run the Launch Firefox Examples project.
- Navidate to `examples/spotify`.
- If it worked you will see: `Ready with Device ID ###...`
- If you get the error:

```bash
Authentication failed spotify:21:77
    onSpotifyWebPlaybackSDKReady http://lvh.me/examples/spotify:21
    _onEvent https://sdk.scdn.co/spotify-player.js:2
    _onEvent https://sdk.scdn.co/spotify-player.js:2
    _handleMessages https://sdk.scdn.co/spotify-player.js:2
    _receiveMessage https://sdk.scdn.co/spotify-player.js:2
```

  Then your access token has either expired, or is incorrect.

- Open a Spotify instance, and look for `Web Playback SDK Quick Start Player` in the device menu. Select it and play a song.
- If you hear nothing in the browser, but you see all of the console output related to it, check that the audio auto play permissions are enabled. (In the security shield box.)

## Testing the drawlook example

- The webserver should be started with `./node_modules/.bin/ws -p 80 --hostname lvh.me`
- Run the Launch Firefox Examples project.
- Navidate to `examples/draw`.
- If it worked you will see an animating line running up at canvas.

## Helm setup

> Follow this section to set up your local helm environment. You do not need to set up a local helm environment if you will be using the remove github pipeline exclusively.

```bash
# todo
```

## Context Specific Helm Setup

> Do not call these commands when already conntected to a previously set up remote cluster.

1) Initialize cert-manager. ([cert-manager installation walkthrough](https://docs.cert-manager.io/en/latest/getting-started/install/kubernetes.html))
   > When installing cert-manager, the final step, make sure you set the default issuer to either prod or staging.
   >
   >`helm install cert-manager --namespace cert-manager jetstack/cert-manager --set ingressShim.defaultIssuerName=letsencrypt-staging --set ingressShim.defaultIssuerKind=ClusterIssuer`
   >
   >`helm install cert-manager --namespace cert-manager jetstack/cert-manager --set ingressShim.defaultIssuerName=letsencrypt-prod --set ingressShim.defaultIssuerKind=ClusterIssuer`

2) Create the defined ACME issuers.

   ```bash
   kubectl apply -f issuers.yaml
   ```

### Upgrading cert-manager

> Visit this link to upgrade the helm cert manager. ([cert-manager Upgrade](https://docs.cert-manager.io/en/latest/tasks/upgrading/index.html))
