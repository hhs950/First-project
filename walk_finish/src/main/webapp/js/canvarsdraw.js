var isDrawing = false;
			var x = 0;
			var y = 0;

			var canvas = document.getElementById("canvas1");
			var ptx = canvas.getContext("2d");

			canvas.addEventListener("mousedown", function (e) {
			    x = e.offsetX;
			    y = e.offsetY;
			    isDrawing = true;
			});

			canvas.addEventListener("mousemove", function (e) {
			    if (isDrawing) {
			        drawSign(ptx, x, y, e.offsetX, e.offsetY);
			        x = e.offsetX;
			        y = e.offsetY;
			    }
			});

			canvas.addEventListener("mouseup", function (e) {
			    if (isDrawing) {
			        drawSign(ptx, x, y, e.offsetX, e.offsetY);
			        x = 0;
			        y = 0;
			        isDrawing = false;
			    }
			});

			canvas.addEventListener("mouseleave", function (e) {
			    x = 0;
			    y = 0;
			    isDrawing = false;
			});

			document.getElementById("erase").addEventListener("click", function (e) {
			    if (ptx != null) {
			        ptx.clearRect(0, 0, canvas.width, canvas.height);
			    }
			})

			function drawSign(ptx, x1, y1, x2, y2) {
			    if (ptx != null) {
			        ptx.save();
			        ptx.beginPath();
			        ptx.strokeStyle = "#1DDB16";
			        ptx.lineWidth = 1;
			        ptx.moveTo(x1, y1);
			        ptx.lineTo(x2, y2);
			        ptx.stroke();
			        ptx.closePath();
			        ptx.restore();
			    }
			}