#Learning Perlin Sketch
###Processing and Processing.s
Originally posted Dec 12, 2012 (12/12/12 !!)

This project was created as a simple sketch to teach myself the basics of perlin noise. 

![Image of the Perlin Learning sketch in action][demoScreenShot1]

I posted the project by request of Cameron (Kerr?), [Command Z](http://www.flickr.com/photos/command_z/), who wanted to see the source code.

Interacting with the sketch:
- *Press 'g'* to toggle the display between viewing the modified image vs viewing a greyscale version of the noise field. The greyscale version makes it easier to see the values that are causing the rotation.
- *Press 'S'* to save a screen cap. This only works on the executable version, not Processing.js 
- *Click the mouse* to cycle through different photos (coded only for two but easy to add more)
- *Mouse over the image* to cause the tiles to spin a bit

The two photos used in the sketch are:
- [Tiny car in Assisi](http://www.flickr.com/photos/sboyd/6237466147/in/set-72157627874124564)
- [Rooftop of the CBC](http://www.flickr.com/photos/sboyd/4911046612/in/set-72157624671011581/)

The sketch currently runs under Processing v2.0b7. Processing is available from Processing.org

The sketch uses standard Processing methods (no special Java libs etc...) which means that it can be easily ported to Processing.js (http://processingjs.org/). Note, you'll want to add the @pjs directives to pre-load the images in Processing.js.
You can see this sketch running on Processing.js here, sspboyd.ca/perlin . 

Stephen Boyd

[@sspboyd](http://twitter.com/sspboyd)
![Image of the Perlin Learning sketch in action][demoScreenShot2]

[demoScreenShot1]:http://farm9.staticflickr.com/8060/8267826055_c646b67d9e_c_d.jpg "Image of the Perlin Learning sketch in action"
[demoScreenShot2]:http://farm9.staticflickr.com/8480/8267829775_52a787fee2_c_d.jpg "Image of the Perlin Learning sketch in action"
