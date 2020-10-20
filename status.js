const express = require('express');
const app = express();
const { exec } = require('child_process');

var status = '';

app.get('/', (req, res) => {
	res.send('<html><head><title>RPI Speedify Status</title><link rel="icon" href="data:;base64,iVBORw0KGgo="/></head><body>'+status+'</body></html>');
});


setInterval(function(){

	exec('/usr/share/speedify/speedify_cli show adapters', (error, stdout, stderr) => {
		if (error) {
			return;
		}
		status = stdout;
	});

},5000);

app.listen(80);

