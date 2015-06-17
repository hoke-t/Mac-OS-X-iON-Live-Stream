# Mac-OS-X-iON-Live-Stream
Simple live stream OS X cocoa application for iON wifi-enabled camera

WARNING: This code is really bad and hackish. I am open sourcing just to let others use this if they have a similar need.

I used this because I wanted a full screen live stream from my iON wifi camera. The web interface is a little wonky so I looked at the JavaScript and replicated the frame requests in Swift. Feel free to submit a pull request to add a feature or fix very bad bugs such as infinite threads being created if the camera's ip cannot be found (oops), etc. As I said, this was a very hackish quick implementation that I used once.
