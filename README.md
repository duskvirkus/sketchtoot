# SketchToot

Creative coding sketchbook which makes it easy to posts progress images to [Mastodon](https://joinmastodon.org/).

- **Operating Systems Supported:** Linux
- **Libraries Supported:** [Processing](https://processing.org/)

## Setup

### General

1. Clone this repository. `git clone https://github.com/violetcraze/sketchtoot.git`
2. Run `npm install`. If you don't have npm on your machine find instructions on how to install it [on the node.js website](https://nodejs.org/en/download/).
4. Create a Mastodon account and be sure to check the box on the `Settings>Profile` page that says `This is a bot account`. In `Settings>Development` add an application.
3. Create a .env file with your mastodon credentials. You will find the token, secret, and key on the application you just added under `Settings>Development`. Example file:
```
ACCESS_TOKEN=
CLIENT_SECRET=
CLIENT_KEY=
API_DOMAIN=https://botsin.space/api/v1/
```

### Processing

1. If you don't already have processing find instructions on how to install it on [the processing website](https://processing.org/).
2. Add processing-java to your path. In `~/.bashrc` add `PATH=$PATH:/path/to/processing-java`. Test by running `processing-java --help` in a new terminal.

## Usage

### Processing

Create a new processing sketch by running `./scripts/new-processing.sh <sketchname>`

Change directory into your new sketch `cd sketchbook/processing/<sketchname>/sketch`.

Then you can run `./build.sh` to build and run your sketch. Press `F1` to capture the current frame. You can do this multiple times. When you close the sketch you will be asked if you would like to post the images you've captured. And to write alternative text for any of the ones you select.

It make take a moment to post your images but you should be able to see them on Mastodon immediately after the program exits.
