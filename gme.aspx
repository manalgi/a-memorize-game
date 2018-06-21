<%@ Page Language="VB" AutoEventWireup="false" CodeFile="gme.aspx.vb" Inherits="gme" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>lol</title>
    <style>
       canvas{
            border:3px double red;
             }

    </style>
</head>
<body onload="startgame()">
    <script>
        var ctx,i=0;
        var first, sec, third, fourth;
        var first1, sec1, third1, fourth1;
        var arr=[],arr1=[];
        var check = true;
        var score;

        function startgame() {
            gameblock.start();
                first = new componant(150, 170, 40, "blue","circle");//1
                sec = new componant(250, 100, 40,"red","circle");//2
                third = new componant(350, 170, 40,"green","circle");//3
                fourth = new componant(250, 250, 40, "yellow","circle");//4
                first1 = new componant(350, 370, 20, "blue","circle");//1
                sec1 = new componant(400, 330, 20,"red","circle");//2
                third1 = new componant(450, 370, 20,"green","circle");//3
            fourth1 = new componant(400, 420, 20, "yellow", "circle");//4
            score = new componant(360, 40, "30px", "black", "text");
        }
        var gameblock = {
            canvas: document.createElement("canvas"),
            start: function () {
                this.canvas.width = 500;
                this.canvas.height = 500;
                ctx = this.canvas.getContext("2d");
                document.body.insertBefore(this.canvas, document.body.childNodes[0]);
                this.interval = setInterval(updategme,150);
                window.addEventListener('keydown', function (e) {
                    gameblock.key = e.keyCode;
                    repeat();
                })
                window.addEventListener('keyup', function (e) {
                    gameblock.key = false;
                })
                    
            },
            stop : function() {
            clearInterval(this.interval);
                               }
        }

        //drawing the componant
        function componant(width, height, r, color, type) {
            this.type = type;
            this.width = width;
            this.height = height;
            this.r = r;
            this.color = color;
            this.update = function () {
                if (this.type == "text") {
                    ctx.font = this.r + " " + "Consolas";
                    ctx.fillStyle = color;
                    ctx.fillText("SCORE: " + num, this.width, this.height);
                } else {
                    ctx.beginPath();
                    ctx.arc(this.width, this.height, this.r, 0, 2 * Math.PI);
                    ctx.fillStyle = this.color;
                    ctx.fill();
                    ctx.stroke();
                }
            }
            this.clearscore = function () {
                ctx.clearRect(360, 0, 500, 40);
            }
        }
        //the main function
        function updategme() {
            first.update();
            sec.update();
            third.update();
            fourth.update();
            first1.update();
            sec1.update();
            third1.update();
            fourth1.update();

            if (check == true) { 
                creatnum();  
            }
            //score.text="SCORE: " + num;
             score.clearscore();
             score.update();
        }
        //user keyboard
        function user() {
                        
                    if ( gameblock.key == 37) {
                        first1.color = "darkblue";
                        arr1.push(1);
                        inp = 1;
                    }
                    else {
                        first1.color = "blue";
                    }
                    if ( gameblock.key == 39) {
                        third1.color = "darkgreen";
                        arr1.push(2);
                        inp = 2;
                    }
                    else {
                        third1.color = "green";
                    }
                    if ( gameblock.key == 38) {
                        sec1.color = "darkred";
                        arr1.push(3);
                        inp = 3;
                    }
                    else {
                        sec1.color = "red";
                    }
                    if (gameblock.key == 40) {
                        fourth1.color = "gold";
                        arr1.push(4);
                        inp = 4;
                    }
                    else {
                        fourth1.color = "yellow";
                    }
                    
                    first1.update();
                    sec1.update();
                    third1.update();
                    fourth1.update();
        }
        var j = 0,num=0;
        var inp;
        //checking the user action
        function repeat() {
  
                    user();
            if (inp != arr[j]) {//arr1 - user arr-computer
                alert("you lost, try again");
                    restart();
                    return;
                }
            j++;
            first.color = "blue";
            sec.color = "red";
            third.color = "green";
            fourth.color = "yellow";
            first.update();
            sec.update();
            third.update();
            fourth.update();
         
            //document.getElementById("demo2").innerHTML = "sec " + arr1;
            if (arr.length == j) { check = true; num++ }
        }
        //computer action
        function creatnum() {

            arr.push(Math.floor(Math.random() * 4) + 1);

            if (arr[i] == 1) {
                first.color = "black";
            }
            else {
                first.color = "blue";
            }
            if (arr[i] == 2) {
                third.color = "black";
            }
            else {
                third.color = "green";
            }
            if (arr[i] == 3) {
                sec.color = "black";
            } else {
                sec.color = "red";
            }
            if (arr[i] == 4) {
                fourth.color = "black";
            }
            else {
                fourth.color = "yellow";
            }
            i++;
            first.update();
            sec.update();
            third.update();
            fourth.update();
            check = false;
            //document.getElementById("demo1").innerHTML = "first " + arr;

            j = 0;
            arr1 = [];
        }
        function restart() {
            arr = [];
            arr1 = [];
            i = 0;
            j = 0;
            check = true;
            inp = undefined;
               //gameblock.start();
            this.interval = setInterval(updategme, 150);

        }

    </script>


     <canvas id="canvas2" width="500" height="500" style="border:5px double blue; background-color:cadetblue;">
            </canvas>
        <script>
            var canvass2 = document.getElementById("canvas2");
            var ctx2 = canvass2.getContext("2d");
            var r = canvass2.height / 2;
            ctx2.translate(r, r);
            r = r * 0.90;
            setInterval(drawclock, 1000);

            function drawclock() {
               /* ctx2.arc(100, 0, r, 0, 2 * Math.PI);
                ctx2.fillStyle = "white";
                ctx2.fill();
                var thumbImg = document.createElement('img');
                thumbImg.src = 'photos/samuel1.jpg';
                ctx2.drawImage(thumbImg, -200, -200, 400, 350);
                ctx2.closePath();
                ctx2.fill();*/
                drawface(ctx2, r);
                drawnum(ctx2, r);
                drawTime(ctx2, r);

              
            };

            function drawface(ctx2, r) {
                var grad;
                ctx2.beginPath();
                ctx2.arc(0, 0, r, 0, 2 * Math.PI);
                ctx2.fillStyle = "cadetblue";
                ctx2.fill();
                grad = ctx2.createRadialGradient(0, 0, r * 0.95, 0, 0, r * 1.1);
                grad.addColorStop(0, 'red');
                grad.addColorStop(0.25, '#ff3333');
                grad.addColorStop(0.5, 'white');
                grad.addColorStop(0.75, '#ff3333');
                grad.addColorStop(1, '#ff3333');
                ctx2.strokeStyle = grad;
                ctx2.lineWidth = r*0.1;
                ctx2.stroke();

                ctx2.beginPath();
                ctx2.arc(0, 0, r*0.1, 0, 2*Math.PI);
                ctx2.fillStyle = 'red';
                ctx2.fill();

                

            }
            
            function drawnum(ctx2, r) {
                var ang;
                var num;
                ctx2.font = r * 0.15 + "px arial";
                ctx2.textBaseline = "middle";
                ctx2.textAlign = "center";

                for (num = 1; num < 13; num++) {
                    ang = num * Math.PI / 6;
                    ctx2.rotate(ang);
                    ctx2.translate(0, -r * 0.85);
                    ctx2.rotate(-ang);
                    ctx2.fillText(num.toString(), 0, 0);
                    ctx2.rotate(ang);
                    ctx2.translate(0, r * 0.85);
                    ctx2.rotate(-ang);
                }
            }
            function drawTime(ctx2, r){
            var now = new Date();
            var hour = now.getHours();
            var minute = now.getMinutes();
            var second = now.getSeconds();
            //hour
            hour=hour-12;
            hour=(hour*Math.PI/6);
            drawHand(ctx2, hour, r*0.5, r*0.07);
            //minute
            minute=(minute*Math.PI/30)+(second*Math.PI/(30*60));
            drawHand(ctx2, minute, r*0.65, r*0.07);
            // second
            second=(second*Math.PI/30);
            drawHand(ctx2, second, r*0.6, r*0.02);
            }

            function drawHand(ctx2, pos, length, width) {
            ctx2.beginPath();
            ctx2.lineWidth = width;
            ctx2.lineCap = "round";
            ctx2.moveTo(0,0);
            ctx2.rotate(pos);
            ctx2.lineTo(0, -length);
            ctx2.stroke();
            ctx2.rotate(-pos);
            }

            
         </script>
    <p>the Rules: use your keyboard to repeat after the computer, after each new step you have to reapet from the begining </p>
   
</body>
</html>
