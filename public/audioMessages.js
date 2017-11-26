if (navigator.mediaDevices) {
  console.log('getUserMedia supported.');
  console.log('App: ', app);

  var constraints = {
    audio: true
  };
  var chunks = [];
  var mediaRecorder;

  app.ports.recordStart.subscribe(function() {
    navigator.mediaDevices.getUserMedia(constraints).then(function(stream) {
      mediaRecorder = new MediaRecorder(stream);
      mediaRecorder.start();
      console.log(mediaRecorder.state);
      console.log("recorder started");

      mediaRecorder.onstop = function(e) {
        console.log("data available after MediaRecorder.stop() called.");

        var blob = new Blob(chunks, {'type': 'audio/ogg; codecs=opus'});
        chunks = [];
        // jstoelm
        var audioURL = window.URL.createObjectURL(blob);
        app.ports.audioUrl.send(audioURL);
        console.log('AudioURL: ', audioURL);
        console.log("recorder stopped");
      };

      mediaRecorder.ondataavailable = function(e) {
        chunks.push(e.data);
      };
    })
  });

  app.ports.recordStop.subscribe(function() {
    if (mediaRecorder) {
      mediaRecorder.stop();
    }
    console.log(mediaRecorder.state);
    console.log("recorder stopped");
  });

};
