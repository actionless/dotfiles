// ==UserScript==
// @name     Inoreader: close popups
// @version  1
// @grant    none
// @namespace https://www.inoreader.com/ lovesick/
// @description Close any popups from Inoreader
// @include https://www.inoreader.com/* 
// ==/UserScript==

/* jshint esversion: 6 */

(function() {

const INTERVAL = 1000; // ms
const __DEV__ = false;

const logDebug = (msg) => {
  // eslint-disable-next-line no-console
  if (__DEV__) console.log(msg);
};

logDebug("1 Creating timer...");
var timerCounter = 0;
var mytimer;
mytimer = setInterval(
  () => {
    
    timerCounter = timerCounter + INTERVAL;
    //logDebug("3 Timer triggered! Waiting for button to appear...");
    let xpath = "//a[contains(text(),'Not now')]";
    let matchingElement = document.evaluate(xpath, document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue;
    if (matchingElement) {
      matchingElement.click();
      logDebug("3.5 SUCCESS, clicked");
      logDebug("4 Clearing timer...");
      window.clearInterval(mytimer);
      logDebug("5 END");
    } else {
      //logDebug("3.5 element not found");
    }      
    
  }, INTERVAL
);
logDebug("2 Created timer.");
  
}());
