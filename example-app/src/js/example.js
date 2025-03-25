import { ScreenshotDetectorPlugin } from 'screenshotdetector';

window.testEcho = () => {
    const inputValue = document.getElementById("echoInput").value;
    ScreenshotDetectorPlugin.echo({ value: inputValue })
}
