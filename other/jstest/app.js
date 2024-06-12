const canvas = document.getElementById('canvas');
const ctx = canvas.getContext('2d');
const colorPicker = document.getElementById('colorPicker');
const imageUploader = document.getElementById('imageUploader');
const cutButton = document.getElementById('cutButton');

canvas.width = 800;
canvas.height = 600;

let drawing = false;
let brushColor = '#000000';
let startX, startY, endX, endY;
let isSelecting = false;
let selectStartX, selectStartY, selectEndX, selectEndY;

canvas.addEventListener('mousedown', (e) => {
    if (e.shiftKey) { // 按住Shift键进入选择模式
        isSelecting = true;
        selectStartX = e.offsetX;
        selectStartY = e.offsetY;
    } else {
        drawing = true;
        startX = e.offsetX;
        startY = e.offsetY;
        ctx.beginPath();
        ctx.moveTo(startX, startY);
    }
});

canvas.addEventListener('mousemove', (e) => {
    if (drawing) {
        ctx.lineTo(e.offsetX, e.offsetY);
        ctx.strokeStyle = brushColor;
        ctx.stroke();
    } else if (isSelecting) {
        selectEndX = e.offsetX;
        selectEndY = e.offsetY;
        drawSelectionRect();
    }
});

canvas.addEventListener('mouseup', () => {
    if (drawing) {
        drawing = false;
        ctx.closePath();
    } else if (isSelecting) {
        isSelecting = false;
        selectEndX = event.offsetX;
        selectEndY = event.offsetY;
    }
});

colorPicker.addEventListener('input', (e) => {
    brushColor = e.target.value;
});

imageUploader.addEventListener('change', (e) => {
    const file = e.target.files[0];
    const reader = new FileReader();
    reader.onload = (event) => {
        const img = new Image();
        img.onload = () => {
            ctx.drawImage(img, 0, 0, canvas.width, canvas.height);
        }
        img.src = event.target.result;
    }
    reader.readAsDataURL(file);
});

cutButton.addEventListener('click', () => {
    if (selectStartX !== undefined && selectStartY !== undefined && selectEndX !== undefined && selectEndY !== undefined) {
        const width = selectEndX - selectStartX;
        const height = selectEndY - selectStartY;
        const imageData = ctx.getImageData(selectStartX, selectStartY, width, height);
        ctx.clearRect(0, 0, canvas.width, canvas.height);
        canvas.width = width;
        canvas.height = height;
        ctx.putImageData(imageData, 0, 0);
    }
});

function drawSelectionRect() {
    ctx.clearRect(0, 0, canvas.width, canvas.height);
    // 重绘背景
    ctx.fillStyle = '#ffffff';
    ctx.fillRect(0, 0, canvas.width, canvas.height);
    // 重绘之前的内容
    // 如果在剪切前先绘图再剪切，需要使用一个隐藏画布保存原始内容

    ctx.strokeStyle = 'rgba(0, 0, 0, 0.5)';
    ctx.lineWidth = 1;
    ctx.setLineDash([6]);
    ctx.strokeRect(selectStartX, selectStartY, selectEndX - selectStartX, selectEndY - selectStartY);
    ctx.setLineDash([]);
}
