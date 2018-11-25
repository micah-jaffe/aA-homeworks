document.addEventListener("DOMContentLoaded", function(){

});

const canvas = document.getElementById('mycanvas');
const ctx = canvas.getContext('2d');

ctx.fillStyle = 'red';

ctx.fillRect(0, 0, 500, 500);

ctx.beginPath();
ctx.strokeStyle = 'blue';
ctx.lineWidth = 10;
ctx.arc(100, 300, 50, 0, 2 * Math.PI);
ctx.stroke();

ctx.fillStyle = 'green';
ctx.fill();

ctx.beginPath();
ctx.moveTo(400, 400);
ctx.lineTo(400, 500);
ctx.lineTo(300, 400);
ctx.fillStyle = 'pink';
ctx.fill();